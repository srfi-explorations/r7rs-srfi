# R7RS-SRFI

This is a project for collection of R7RS SRFI implementations.

[Repository](https://github.com/srfi-explorations/r7rs-srfi)
[Issues](https://github.com/srfi-explorations/r7rs-srfi/issues)
[Jenkins](https://jenkins.scheme.org/job/r7rs_srfi/job/r7rs-srfi/)


## Running tests

You will need to install snow-chibi, compile-r7rs and implementations you want
to test with.

    snow-chibi install --impls=chibi retropikzel.compile-r7rs

To run test:

    make SCHEME=<IMPLEMENTATION> SRFI=<SRFI_NUMBER> all install test

## Running tests in docker

You will need to install test-r7rs and docker. Make docker work without sudo.

    snow-chibi install --impls=chibi retropikzel.test-r7rs

To run test:

    make SCHEME=<IMPLEMENTATION> SRFI=<SRFI_NUMBER> test-docker


# Adding new SRFI

Add files:

    - srfi/N.sld
        - Library definition
    - srfi/N.scm
        - Library body/content
    - srfi/N
        - Directory for misc files
    - srfi/N/VERSION
        - Version, start with 0.1.0
    - srfi/N/DEPENDS
        - List of dependendis fron snow-fort, like so on one line: srfi.N srfi.N
            - Do not depend on SRFI 64, it will always be installed in docker
            and otherwise you should install it by hand


Every SRFI needs corresponding test file in
[test repository](https://github.com/srfi-explorations/srfi-test).
The test file needs to be named N.scm. Use SRFI-64 for testing!

Add the SRFI into the Jenkinsfiles running list.

## Adding support for new implementation

Add support for implementation into compile-r7rs here
[https://codeberg.org/retropikzel/scheme-programs](https://codeberg.org/retropikzel/scheme-programs).

Add support for implementation
into snow-chibi here [https://github.com/ashinn/chibi-scheme](https://github.com/ashinn/chibi-scheme).
