#!/bin/bash

_display_directory_size() {
    printf "$(pwd)\t\t" && du -sh | cut -f1
}

_display_sub_directory_size() {
    du -sh "${1:-.}"/* 2>&1 | grep -v "Operation not permitted" | head -n 10 | sort -hr
}

_find_fat_files() {
    find "${1:-.}" -type f -print0 |
        xargs -0 du |
        sort -rn |
        head -n 10 |
        cut -f2 |
        xargs -I{} du -sh {}
}

_find_fat_dirs() {
    find "${1:-.}" -maxdepth 1 -type d -print0 |
        xargs -0 du -d 1 |
        sort -rn |
        uniq |
        head -n 11 |
        tail -n +2 |
        cut -f2 |
        xargs -I{} du -sh {}
}

_find_count() {
    local dir="$1" type="$2" ext="$3"
    if [ -z "$ext" ]; then
        find "$dir" -type "$type" -maxdepth 1 | grep -v "^\.$" | sort
        local count
        count=$(find "$dir" -type "$type" -maxdepth 1 | grep -v "^\.$" | wc -l | tr -d ' ')
    else
        find -E "$dir" -type "$type" -regex "^.*\.${ext}$" | grep -v "^.$" | sort
        local count
        count=$(find -E "$dir" -type "$type" -regex "^.*\.${ext}$" | wc -l)
    fi
    echo "------------------"
    if [ "${count}" -gt 1 ]; then
        [ "$type" = f ] && label="files" || label="directories"
    else
        [ "$type" = f ] && label="file" || label="directory"
    fi
    echo "${count} ${label}."
}

case "$1" in
    dirsize)    _display_directory_size ;;
    subdirsize) shift; _display_sub_directory_size "$@" ;;
    fatf)       shift; _find_fat_files "$@" ;;
    fatd)       shift; _find_fat_dirs "$@" ;;
    cfile)      _find_count "${2:-.}" f ;;
    cdir)       _find_count "${2:-.}" d ;;
    cimg)       _find_count "${2:-.}" f "(JPG|jpg|jpeg|PNG|png|TIFF|TIF|tiff|tif|CR2|NEF|ARW)" ;;
    cmovie)     _find_count "${2:-.}" f "(MOV|mov|AVI|avi|MPG|mpg|mpeg|mp4)" ;;
    cmusic)     _find_count "${2:-.}" f "(m4a|MP3|mp3|WAV|wav)" ;;
    *)
        echo "Usage: $(basename "$0") <command> [path]"
        echo "Commands:"
        echo "  dirsize              current directory size"
        echo "  subdirsize  [path]   top 10 subdirectory sizes"
        echo "  fatf        [path]   top 10 largest files"
        echo "  fatd        [path]   top 10 largest directories"
        echo "  cfile       [path]   count files"
        echo "  cdir        [path]   count directories"
        echo "  cimg        [path]   count image files"
        echo "  cmovie      [path]   count movie files"
        echo "  cmusic      [path]   count music files"
        exit 1
        ;;
esac
