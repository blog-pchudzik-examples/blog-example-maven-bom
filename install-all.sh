#!/usr/bin/env bash

MVN_ARGS="-B -q"

function install() {
    local role=$1
    local project_name=$2
    (cd "${role}/${project_name}"; ./mvnw ${MVN_ARGS} install)
    echo "Installed: ${project_name}"
}

install system discount-api
install system order-api
install system product-api
install system user-api
install system bom

(cd "project" ; ./mvnw ${MVN_ARGS} install)
echo "Installed: project"
