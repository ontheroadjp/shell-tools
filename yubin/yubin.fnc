#-------------------------------------------------
# Search Yubin bangou
#-------------------------------------------------
function _search_yubin_bangou() {
    data_dir="${GIT_REPOSITORY}/shell-tools/yubin/data"
    mkdir -p data
    data="${data_dir}/KEN_ALL.CSV"
    data_zip="${data_dir}/ken_all.zip"
    data_path="data"

    if [ ! -e "${data}" ]; then
        data_url='https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip'

        curl -L "${data_url}" -o "${data_zip}" && {
            unzip -o "${data_zip}" -d "${data_dir}"
        }
    fi

    cat "${data}" | \
        nkf -w -Z1 | \
        sed 's/"//g' | \
        awk -F',' '{ printf("%10d %-60s\n", $3, $7$8$9) }' | \
        sed 's/〜/-/g' | \
        fzf-tmux -p 80%
}

alias yubin="_search_yubin_bangou"
