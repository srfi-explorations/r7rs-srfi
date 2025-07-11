# R7RS-SRFI

This is a project for collection of R7RS SRFI implementations.

[Jenkins](https://jenkins.scheme.org/job/r7rs_srfi/job/r7rs-srfi/)


## Notes

- Cyclone not working, cause yet unknown.

- Racket implementation waiting for
[https://github.com/lexi-lambda/racket-r7rs/pull/26](https://github.com/lexi-lambda/racket-r7rs/pull/26).
Hopefully will work.

- STklos include is fixed in git, waiting for next release. Then works.

- tr7 does not have (scheme complex). Then should work.

## Running tests

You will need to install
[https://gitea.scheme.org/Retropikzel/compile-r7rs](https://gitea.scheme.org/Retropikzel/compile-r7rs).
And implementations you want to test with.

To run test:

    make compile-r7rs COMPILE_R7RS=<IMPLEMENTATION> SRFI=<SRFI_NUMBER>

## Running tests in docker

Only make and docker are needed.

    make test-compile-r7rs-docker COMPILE_R7RS=<IMPLEMENTATION> SRFI=<SRFI_NUMBER>

If you are on windows look up the docker commands from the Makefile.

# Adding new srfi

Add files:

    - srfi/N.sld
        - Library definition
    - srfi/N.scm
        - Library body/content
    - srfi/srfi-N.scm
        - Guile compability file, should have library definition


Every SRFI needs corresponding test file in [test repository](https://github.com/srfi-explorations/srfi-test).
The test file needs to be named N.scm. If you dont use SRFI-64 for testing then
port your preferred test library first to be portable on all all implementations.

Add the SRFI number into srfis.scm.

## Adding new implementation

Add the implementation data into implementations.scm, keep the order alphabetical.
The first SRFI you port to any new implementation should be SRFI-64. As it's the test suite used
in SRFI tests.
