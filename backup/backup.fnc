function _create_backup_file() {
    [ $# -ne 1 ] && echo 'no file/dir' && return
    [ ! -e $(basename $1) ] && echo 'no file/dir' && return
    #cp -r ${1} ${1}.bk
    local bk_name="bk_$(date '+%Y%m%d')_$(basename $1).tar.gz"
    tar czf ${bk_name} $1
    echo "backed up. ($1 >>> ${bk_name})"
}

function _create_backou_file_and_remove_original() {
    _create_backup_file $@ && {
        rm -rf $@
    }
}

function _restore_backup_file() {
    local strip=$(echo $1 | sed -e 's/\.tar\.gz$//g')

    [ $# -ne 1 ] && echo 'no file/dir' && return
    [ ! -e $1 ] && [ ! -e ${strip}.tar.gz ] && echo 'no file/dir' && return

    local target=$(echo $1 | sed 's/\.tar\.gz//g')
    tar xzf ${strip}.tar.gz
    echo "Restored. ($1)"
}

function _restore_backup_file_and_remove_original() {
    _restore_backup_file $@ && {
        rm -rf $@
    }
}

alias bk='_create_backup_file'
alias bkrm='_create_backou_file_and_remove_original'
alias kb='_restore_backup_file'
alias kbrm='_restore_backup_file_and_remove_original'
