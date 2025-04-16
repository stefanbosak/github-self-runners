#!/bin/bash
docker container stop $(docker container ls --filter "name=runner-*" -q)
