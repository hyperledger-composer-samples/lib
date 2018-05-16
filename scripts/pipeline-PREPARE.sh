#!/bin/bash
if [ ! -f  ${SCRIPT_DIR} ]; then
  mkdir -p ${SCRIPT_DIR}
fi

for SCRIPT in $BUILD_SCRIPTS; do
  SCRIPT_FILE="${SCRIPT_DIR}${SCRIPT}"
  SCRIPT_URL="https://raw.githubusercontent.com/hyperledger-composer-samples/lib/master/scripts/${SCRIPT}"
  if [ ! -f  ${SCRIPT_FILE} ]; then
    echo -e "No script found at ${SCRIPT_FILE}, defaulting to ${SCRIPT_URL}"
    (curl -sSL ${SCRIPT_URL}) > ${SCRIPT_FILE}
  else
    echo "Script found at ${SCRIPT_FILE}"
  fi
done
