patchup
=======

Small utility for post-deployment system patching.

Usage:
- deploy on target system by checking out and performing `make deploy`
- queue update by adding a directory containing an executable `patch` script to
  the `patches` directory.

Notes:
- patches are executed once, in numerical order
- if the patch is invalid (eg. no `patch` script) or execution failed, the patch
  will be re-executed on the next iteration
- do not re-use patch directory names

TODO:
- report failure logs
- timeout on patch execution
