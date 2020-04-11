#!/bin/sh

cd src

docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` pandoc/latex cv.md -f markdown -t pdf -V geometry:"top=2cm" -o cv.pdf && \mv cv.pdf ../dist
docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` pandoc/latex cv.md -f markdown -t html -H pandoc.css --metadata pagetitle="David Sierra CV" -s -o cv.html && \mv cv.html ../dist
docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` pandoc/latex cv.md -f markdown -t odt -o cv.odt && \mv cv.odt ../dist
docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` pandoc/latex cv.md -f markdown -t markdown -o cv2.md && \mv cv2.md ../dist/cv.md
