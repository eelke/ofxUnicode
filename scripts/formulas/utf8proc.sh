#! /bin/bash
#
# utf8proc
# Unicode normalization, case-folding, and other operations for data in
# https://github.com/JuliaLang/utf8proc
#
# notes on build system, reference links, etc

# array of build types supported by this formula
# you can delete this to implicitly support *all* types
FORMULA_TYPES=( "osx", "msys2" )

# Currently for VS, we use cmake and manually build from the command line.

# download the source code and unpack it into LIB_NAME
function download() {
	echo "Download."
	git clone https://github.com/JuliaLang/utf8proc.git
}

# prepare the build environment, executed inside the lib src dir
function prepare() {
	:
}

# executed inside the lib src dir
function build() {
	make
}

# executed inside the lib src dir, first arg $1 is the dest libs dir root
function copy() {
	mkdir -p $1/include/
	cp -v utf8proc.h $1/include/

	mkdir -p $1/lib/$TYPE/
	cp -v libutf8proc.a $1/lib/$TYPE/

	# copy license file
	rm -rf $1/license # remove any older files if exists
	mkdir -p $1/license
	cp -v LICENSE.md $1/license/
	cp -v README.md $1/license/

}

# executed inside the lib src dir
function clean() {
	echo "Nothing to clean."
}
