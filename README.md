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

    make SCHEME=<IMPLEMENTATION> SRFI=<SRFI_NUMBER> test

## Running tests in docker

Only make and docker are needed.

    make SCHEME=<IMPLEMENTATION> SRFI=<SRFI_NUMBER> test-docker

If you are on windows look up the docker commands from the Makefile.

# Adding new srfi

Add files:

    - srfi/N.sld
        - Library definition
    - srfi/N.scm
        - Library body/content

Add the SRFI number into test_srfis.txt.

Every SRFI needs corresponding test file in [test repository](https://github.com/srfi-explorations/srfi-test).
The test file needs to be named N.scm.


## Adding new implementation

Add support for implementation
into compile-r7rs in [https://codeberg.org/retropikzel/scheme-programs](https://codeberg.org/retropikzel/scheme-programs).

Add support for implementation
into [snow-chibi](https://github.com/ashinn/chibi-scheme).
