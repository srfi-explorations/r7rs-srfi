# R7RS-SRFI

This is a project for collection of R7RS SRFI implementations.

[Repository](https://github.com/srfi-explorations/r7rs-srfi)
[Issues](https://github.com/srfi-explorations/r7rs-srfi/issues)
[Jenkins](https://jenkins.scheme.org/job/r7rs_srfi/job/r7rs-srfi/)


## Running tests

You will need to install
[https://gitea.scheme.org/Retropikzel/compile-r7rs](https://gitea.scheme.org/Retropikzel/compile-r7rs).
And implementations you want to test with.

To run test:

    make test SCHEME=<IMPLEMENTATION> SRFI=<SRFI_NUMBER>

## Running tests in docker

Only make and docker are needed.

    make test-docker SCHEME=<IMPLEMENTATION> SRFI=<SRFI_NUMBER>

If you are on windows look up the docker commands from the Makefile.

# Adding new srfi

Add files:

    - srfi/N.sld
        - Library definition
    - srfi/N.scm
        - Library body/content
    - srfi/srfi-N.scm
        - Guile compability file
        - Should be (almost, change the name) identical to srfi/N.sld


Every SRFI needs corresponding test file in [test repository](https://github.com/srfi-explorations/srfi-test).
The test file needs to be named N.scm. If you dont use SRFI-64 for testing then
port your preferred test library first to be portable on all all implementations.

Add the SRFI number into srfis.scm.

## Adding new implementation

Add support for implementation
into [https://gitea.scheme.org/Retropikzel/compile-r7rs](https://gitea.scheme.org/Retropikzel/compile-r7rs).

Add support for implementation
into [snow-chibi](https://github.com/ashinn/chibi-scheme).
