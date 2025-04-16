# Intro

 Aim of this scope is providing support for GitHub self-hosted runners operated as Docker environment. 

# Examples
- docker compose (build, run, scale):
- docker compose up -d --scale runner=2
- docker compose down runner

 **build:**
 - docker build to create runner-image:
 ./runner_build.sh

 **start:**
 - docker run to start runner (possible to start any amount as needed):
 ./runner_start.sh

 **stop:**
 - docker container stop
 ./runners_stop.sh (stop all of previously started runners)
