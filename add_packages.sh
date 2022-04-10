pkgs_path="./resources/packages-to-add"
image="yetiansh/env-fduthesis"

pkgs=$(sed '/#/'d ${pkgs_path} | tr '\n' ' ')
id=$(docker run -it -d ${image})
docker exec -i ${id} /bin/bash -c "tlmgr install ${pkgs}"
docker commit ${id} ${image}
docker stop ${id}