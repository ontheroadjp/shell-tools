#-------------------------------------------------
# Search Yubin bangou
#-------------------------------------------------
function _search_yubin_bangou() {
    mkdir -p ${YUBIN_DATA_DIR}
    YUBIN_DATA_URL='https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip'
    YUBIN_DATA_ZIP="${YUBIN_DATA_DIR}/ken_all.zip"
    YUBIN_DATA_CSV="${YUBIN_DATA_DIR}/KEN_ALL.CSV"

    if [ ! -e "${YUBIN_DATA_CSV}" ]; then
        curl -L "${YUBIN_DATA_URL}" -o "${YUBIN_DATA_ZIP}" && {
            unzip -o "${YUBIN_DATA_ZIP}" -d "${YUBIN_DATA_DIR}"
        }
    fi

    cat "${YUBIN_DATA_CSV}" | \
        nkf -w -Z1 | \
        sed 's/"//g' | \
        awk -F',' '{ printf("%10d %-60s\n", $3, $7$8$9) }' | \
        sed 's/〜/-/g' | \
        fzf-tmux -p 80%
}

alias yubin="_search_yubin_bangou"

