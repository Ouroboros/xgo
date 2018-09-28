WORKING_DIR=/mac/source
VOLUME_GO=/Users/ouroboros/dev/xgo/go:/mac/go
VOLUME_GO_PKGS=/Users/ouroboros/go:/mac/go/pkgs
VOLUME_SOURCE=/Users/ouroboros/Documents/source:/mac/source
CONTAINER_NAME=xgo
IMAGE_NAME=xgo

cmd="$1"

case $cmd in
    stop)
        echo stop
        docker ps -a -f name=$CONTAINER_NAME --format "{{.ID}}" | xargs -I % $SHELL -c 'docker kill %; docker rm %'
        ;;

    "")
        RUNNING_XGO="$(docker ps -q -f name=$CONTAINER_NAME)"

        if [ ! "$RUNNING_XGO" ]; then
            if [ "$(docker ps -aq -f status=exited -f name=$CONTAINER_NAME)" ]; then
                docker rm $CONTAINER_NAME
            fi

            docker container run -w $WORKING_DIR -v $VOLUME_GO -v $VOLUME_GO_PKGS -v $VOLUME_SOURCE -di --name $CONTAINER_NAME $IMAGE_NAME
        fi

        docker exec -it $CONTAINER_NAME bash

        ;;
esac
