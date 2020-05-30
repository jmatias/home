#!/bin/sh

CHART=$1
HR=$2

usage() {
  echo "$(basename $0) </path/to/chart/> </path/to/helmrelease>"
}

if test ! -d "${CHART}"
then
  echo "Error! \"${CHART}\" is not an existing directory!"
  echo
  usage
  exit 1;
fi

if test ! -f "${HR}"
then
  echo "Error! \"${HR}\" is not an existing file!"
  echo
  usage
  exit 1;
fi

NAME=$(yq r ${HR} metadata.name)
VALUES=$(yq r ${HR} spec.values)

echo "${VALUES}" | helm install --debug --dry-run --name ${NAME} --values=- ${CHART}
