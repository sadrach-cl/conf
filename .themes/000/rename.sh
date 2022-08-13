#! /usr/bin/bash
REPO_DIR=~/.themes
SRC_DIR="${REPO_DIR}/src"

THEME_NAME=Catppuccin
COLOR=('-Grey')
FLAVOUR=('-Dark')
SIZE=('-Compact')
CAFE=('-Frappe')
local={color}

sed -i "s/${THEME_NAME}${COLOR}${FLAVOUR}${SIZE}/${THEME_NAME}${CAFE}${COLOR}${SIZE}/g" "${REPO_DIR}/${THEME_NAME}${COLOR}${FLAVOUR}${SIZE}/index.theme"

rename -v "s/${THEME_NAME}${COLOR}${FLAVOUR}${SIZE}/${THEME_NAME}${CAFE}${COLOR}${SIZE}/" "~/.themes/"
