#!bash

tag=$(date '+%d%m%Y_%H%M');
image_name=fdenisnascimento/postgres-backup-s3

docker build --build-arg ALPINE_VERSION=3.17 --platform=linux/amd64 -t $image_name .
docker push $image_name

git add .
git commit -am "new release"
git push origin master --force


echo "Criando tag release_$tag"
git tag release_$tag
echo "enviando tag release_$tag para git"
git push --tags






