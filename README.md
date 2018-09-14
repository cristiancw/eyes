# eyes

Docker image with a gui application to test gui access from a container.

### To run

Need to execute **xhost +local:root** before to run the container.

```
xhost +local:root

docker run \
    --rm \
    --name eyes \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    cristiancw/eyes
```
