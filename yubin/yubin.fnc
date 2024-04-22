#-------------------------------------------------
# Search Yubin bangou
#-------------------------------------------------
function _search_yubin_bangou() {
    data_path="${DOTPATH}/.yubin_bangou"
    data="${data_path}/KEN_ALL.CSV"
#    data_url='https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip'
#    mkdir -p ${data_path}
#    curl ${data_url} -o ${data_path}/ken_all.zip
#    unar -f ${data_path}/ken_all.zip
    cat ${data} | \
        nkf -w -Z1 | \
        sed 's/"//g' | \
        awk -F',' '{ printf("%10d %-60s\n", $3, $7$8$9) }' | \
        sed 's/〜/-/g' | \
        peco --prompt 'Search Yubin bangou>' --query ${@:-''}
}
alias yubin='_search_yubin_bangou $@'
alias yubinbangou='_search_yubin_bangou $@'


