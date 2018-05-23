#!/bin/bash
${BUILD_SCRIPTS:?No scripts specified}

if [ ! -f  ${SCRIPT_DIR:=./scripts/} ]; then
  mkdir -p ${SCRIPT_DIR}
fi

for SCRIPT in $BUILD_SCRIPTS; do
  SCRIPT_SRC="${SCRIPT_URL:=https://raw.githubusercontent.com/hyperledger-composer-samples/lib/master/scripts}/${SCRIPT}"
  SCRIPT_FILE="${SCRIPT_DIR}${SCRIPT}"
  
  if [ ! -f  ${SCRIPT_FILE} ]; then
    echo -e "No script found at ${SCRIPT_FILE}, defaulting to ${SCRIPT_SRC}"
    (curl -sSL ${SCRIPT_SRC}) > ${SCRIPT_FILE}
  else
    echo "Script found at ${SCRIPT_FILE}"
  fi
done
