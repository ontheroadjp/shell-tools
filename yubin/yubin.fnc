#-------------------------------------------------
# Search Yubin bangou
#-------------------------------------------------
function _search_yubin_bangou() {
    data_path="${DOTPATH}/.yubin_bangou"
    mkdir -p ${data_path}
    data="${data_path}/KEN_ALL.CSV"
    if [ ! -e ${data} ]; then
        data_url='https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip'
        curl ${data_url} -o ${data_path}/ken_all.zip && {
            unzip ${data_path}/ken_all.zip -d ${data_path}
        }
    fi

    # cat ${data} | \
    #     nkf -w -Z1 | \
    #     sed 's/"//g' | \
    #     awk -F',' '{ printf("%10d %-60s\n", $3, $7$8$9) }' | \
    #     sed 's/〜/-/g' | \
    #     peco --prompt 'Search Yubin bangou>' --query ${@:-''}

    cat ${data} | \
        nkf -w -Z1 | \
        sed 's/"//g' | \
        awk -F',' '{ printf("%10d %-60s\n", $3, $7$8$9) }' | \
        sed 's/〜/-/g' | \
        fzf
}
alias yubin='_search_yubin_bangou $@'

