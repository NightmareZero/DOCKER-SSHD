#!/bin/bash

source /etc/profile

REGISTRY=""
TEAM="nightzhuxy"
NAME="jenkins-slave"
TAG="jdp-maven"

FULLNAME="$REGISTRY$TEAM/$NAME:$TAG"

{
  { 
    docker build -t "$FULLNAME" . 
  } || {
    echo -e "\e[31merror on build $FULLNAME\e[0m" && \
    exit 1 
  }
} && {
  docker push "$FULLNAME" || echo -e "\e[31merror on push\e[0m"
}

