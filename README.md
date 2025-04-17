# Intro

 This scope provides support for GitHub self-hosted runners operated as Docker environment. 

# Examples

**setup**
  - edit setvariables.sh (modify variables correspondingly)
  - source setvariables.sh

**Docker compose build, run and scale runners:**
  - docker compose up -d --scale runner=2

**Docker compose stop runners:**
- - docker compose down runner

 **Docker build runner:**
 - docker build to create runner-image:
 ./runner_build.sh

 **Docker start runner instance:**
 - docker run to start runner (possible to start any amount as needed):
 ./runner_start.sh

 **Docker stop all runners:**
 - docker container ls --filter "name=runner-*" (get list of activated runners)
 - docker container stop runner-... (stop selected runner)
 ./runners_stop.sh (stop all of previously started runners)
