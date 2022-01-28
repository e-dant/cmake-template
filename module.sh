#!/bin/bash

function main() {
	local project_name=$(cat config/CMakeLists.txt \
		|grep "set(_project_name.*" \
		|grep -o "\".*\"" \
		|sed "s/\"//g" \
		|| return 1)
	local project_root="$HOME/$project_name"
	local project_config="$HOME/$project_name/config"
	local project_build="$HOME/$project_name/build"
	local project_src="$HOME/$project_name/src"
	local project_cmakelists="$HOME/$project_name/config/CMakeLists.txt"
	local directories=(
		"$project_root"
		"$project_config"
		"$project_build"
		"$project_src"
	)
	for i in ${directories[@]}; do
		if [ ! -d $i ]; then
			echo "directory structure is invalid."
			echo "see cmakelists.txt -> notes -> directories for documentation."
			return 1
		fi
	done
	if [ ! -f "$project_cmakelists" ] || [ ! "$project_name" ]; then
			echo "cmakelists.txt is invalid or does not exist."
			return 1
	fi
	if echo "$@" | grep "build" &>/dev/null; then
		cd "$project_config"	
		cmake CMakeLists.txt && make
	fi
	if echo "$@" | grep "run" &>/dev/null; then
		local input="${!#}"
		$project_build/$project_name $input
	fi
}

main "$@" || exit 1

