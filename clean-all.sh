#!/usr/bin/env bash

MVN_ARGS="-B -q"
function clean() {
    local role=$1
    local project_name=$2
    (cd "${role}/${project_name}"; ./mvnw ${MVN_ARGS} clean)
    echo "Cleaned: ${project_name}"
}

clean system discount-api
clean system order-api
clean system product-api
clean system user-api
clean system bom

(cd project; ./mvnw ${MVN_ARGS} clean)
echo "Cleaned: project"

to_remove="${HOME}/.m2/repository/com/pchudzik/blog/example/bom"
rm -rf "${to_remove}"
echo "Removed ${to_remove}"
