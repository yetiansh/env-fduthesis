# basic config
dir="test"                                  # directory of the whole project
source="fduthesis-template.tex"             # latex source file to compile
image="yetiansh/env-fduthesis"              # image name
engine="xelatex"                            # compile engine, e.g., xelatex and lualatex

home="/usr/local"                           # home directory
resources="resources"                       # resource directory

full_dir=$(cd ${dir} && pwd)
base_dir=$(basename "${full_dir}")
source=$(basename "${source}" .tex)
compile="${engine} ${source}.tex && bibtex ${source}.aux &&
    ${engine} ${source}.tex && ${engine} ${source}.tex"

id=$(docker run -it -d ${image})
docker cp ${full_dir} "${id}:${home}"
docker exec -i ${id} /bin/bash -c \
    "cp ${resources}/fudan-name.pdf ${base_dir} && cd ${home}/${base_dir} && ${compile}"
docker cp "${id}:${home}/${base_dir}/${source}.pdf" ${full_dir}/
docker stop ${id}