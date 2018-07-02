#!/bin/bash

DIR=$(cd $(dirname $0) && pwd)
rm -rf ${DIR}/m2repo ${DIR}/target


time (
  mvn -Dmaven.repo.local=${DIR}/m2repo -U -e -C -V dependency:go-offline && \
  mvn -Dmaven.repo.local=${DIR}/m2repo -U -e -C -V dependency:resolve-plugins -Dsilent=true -DexcludeTransitive=false && \
  mvn -Dmaven.repo.local=${DIR}/m2repo -e -V --offline clean package
)
