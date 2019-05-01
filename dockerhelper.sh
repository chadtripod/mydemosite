if [ -z ${1+x} ]; then set "latest" ; fi

echo "<-- building mysite:$1 -->"
docker build -t away168/mysite:$1 .
docker tag away168/mysite:$1 away168/mysite:latest
echo "<-- pushing mysite:$1 -->"
docker push away168/mysite:$1
docker push away168/mysite:latest