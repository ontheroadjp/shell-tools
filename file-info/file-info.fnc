function _display_directory_size() {
    printf "$(pwd)\t\t" && du -sh | cut -f1
}

function _display_sub_directory_size() {
    #du -sh ${1:-"$(pwd)"}/* 2>&1 | grep -v "Operation not permitted" | sort -hr
    du -sh ${1:-.}/* 2>&1 | grep -v "Operation not permitted" | head -n 10 | sort -hr
}

function _find_fat_files() {
    find ${1:-.} -type f -print0 |
        xargs -0 du |
        sort -rn |
        head -n 10 |
        cut -f2 |
        xargs -I{} du -sh {}
}

function _find_fat_dirs() {
    find ${1:-.} -maxdepth 1 -type d -print0 |
        xargs -0 du -d 1 |
        sort -rn |
        uniq |
        head -n 11 |
        tail -n +2 |
        cut -f2 |
        xargs -I{} du -sh {}
}

alias dirsize="_display_directory_size"
alias subdirsize="_display_sub_directory_size"
alias fatf='_find_fat_files'
alias fatd='_find_fat_dirs'

function _find_count() {
    [ -z $3 ] && {
        find $1 -type $2 -maxdepth 1 | grep -v "^\.$" | sort
        local count=$(find $1 -type $2 -maxdepth 1 | \
            grep -v "^\.$" | wc -l | tr -d ' ')
    } || {
        find -E $1 -type $2 -regex "^.*\.${3}$" | grep -v "^.$" | sort
        local count=$(find -E $1 -type $2 -regex "^.*\.${3}$" | wc -l)
    }

    echo "------------------"
    [ ${count} -gt 1 ] && {
        [ $2 = f ] && { label="files" } || { label="directories" }
    } || {
        [ $2 = f ] && { label="file" } || { label="directory" }
    }
    echo "${count} ${label}."
}

alias ff='(){_find_count ${1:-.} f}'
alias fd='(){_find_count ${1:-.} d}'
alias fimg='(){_find_count ${1:-.} f "(JPG|jpg|jpeg|PNG|png|TIFF|TIF|tiff|tif|CR2|NEF|ARW)"}'
alias fmov='(){_find_count ${1:-.} f "(MOV|mov|AVI|avi|MPG|mpg|mpeg|mp4)"}'
alias fmus='(){_find_count ${1:-.} f "(mp3)"}'

