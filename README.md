# Base images for Kibana CI

These are maintained separately to reduce complexity a bit. They really shouldn't change much, and are built locally by devs and pushed to dockerhub.

To build the images you will need to [install docker locally](https://www.docker.com/products/overview).

```sh
# clone the registry
git clone https://github.com/kreeware/docker-kibana-ci.git kibana-ci
cd kibana-ci

# build the image
docker build \
  --tag kibanaci/base:master \
  --build-arg NODE_VERSION=4.4.7 \
  --build-arg JDK_VERSION=8 \
  base

# push the image to dockerhub
docker push kibanaci/base:master
```
