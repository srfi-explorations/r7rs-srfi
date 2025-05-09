# R7RS-SRFI

This is a project for collection of R7RS SRFI implementations.

[Jenkins](https://jenkins.scheme.org/job/r7rs/job/r7rs-srfi/)

[Test report](https://jenkins.scheme.org/job/r8rs/job/r7rs-srfi/job/main/R7RS-SRFI_20Test_20Report/)

## Running tests

You will need to install
[https://gitea.scheme.org/Retropikzel/compile-r7rs](https://gitea.scheme.org/Retropikzel/compile-r7rs).
And implementations you want to test with.

    make COMPILE_R7RS=<IMPLEMENTATION> SRFI=<SRFI_NUMBER> test-compile-r7rs

## Running tests in docker

Only make and docker is needed.

    make COMPILE_R7RS=<IMPLEMENTATION> SRFI=<SRFI_NUMBER> test-compile-r7rs-docker

# Adding new srfi

Add files:

    - srfi/N.sld
        - Library definition
    - srfi/N.scm
        - Library body/content
    - jenkins_scritps/test.sh
        - Add to correct place in the library build part


Every SRFI needs corresponding test file in [test repository](https://github.com/srfi-explorations/srfi-test).
The test file needs to be named N.scm.

Add the SRFI number into srfis.scm.

## Adding new implementation

Add the implementation data into implementations.scm, keep the order alphabetical.
The first SRFI you port to any new implementation should be SRFI-64. As it's the test suite used
in SRFI tests.

### Misc

The srfi/srfi-N.scm files exist for Guile compability, their content should be identical to
srfi/N.sld.

The srfi/N.rkt files exists for racket-r7rs compability.

The srfi/39.mit.sld should be identical to srfi/39.sld except the chibi "include-shared" part
commented out.
