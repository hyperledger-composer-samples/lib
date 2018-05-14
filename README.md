# Composer toolchain script library

Collection of common build scripts that can be leveraged in Hyperledger Composer toolchains, and pipelines. You can use these shell scripts in your own toolchains in different ways:

1. Copy a script content in one of your pipeline job script.

2. Fetch a script from the commons location, and source it from your pipeline job.

  ```
  #!/bin/bash
  source <(curl -sSL "https://raw.githubusercontent.com/hyperledger-composer-samples/lib/master/scripts/<script>")
  ```

3. Copy a script inside your application code (in a /scripts subfolder), and source it from your pipeline job.

  ```
  #!/bin/bash
  source ./scripts/<script>
  ```

You can even combine the these approaches... use local scripts, or defer to remote one if it doesn't exist...

  ```
  #!/bin/bash
  # use script from app source control, or default to template script
  # use source command to run script to ensure env variables are set in current shell
  SCRIPT_FILE="scripts/<script>"
  SCRIPT_URL="https://raw.githubusercontent.com/open-toolchain/simple-helm-toolchain/master/${SCRIPT_FILE}"
  if [ ! -f  ${SCRIPT_FILE} ]; then
    echo -e "No script found at ./${SCRIPT_FILE}, defaulting to ${SCRIPT_URL}"
    source <(curl -sSL ${SCRIPT_URL})
  else
    source "${SCRIPT_FILE}"
  fi
  ```
