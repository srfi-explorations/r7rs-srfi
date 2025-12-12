# R7RS-SRFI

This is a project for collection of R7RS SRFI implementations.

[Repository](https://github.com/srfi-explorations/r7rs-srfi)
[Issues](https://github.com/srfi-explorations/r7rs-srfi/issues)
[Jenkins](https://jenkins.scheme.org/job/r7rs_srfi/job/r7rs-srfi/)


## Running tests

You will need to install
[https://codeberg.org/retropikzel/compile-scheme](https://codeberg.org/retropikzel/compile-scheme).
And implementations you want to test with.

Test only with docker.

To run R7RS tests use either:

    make SCHEME=<IMPLEMENTATION> SRFI=<SRFI_NUMBER> test-r6rs-docker
    make SCHEME=<IMPLEMENTATION> SRFI=<SRFI_NUMBER> test-r7rs-docker

If you are on windows look up the docker commands from the Makefile.

# Adding new srfi

Add files:

    - srfi/N.sld
        - Library definition
    - srfi/N.scm
        - Library body/content

Every SRFI needs corresponding test file in [test repository](https://github.com/srfi-explorations/srfi-test).
The test file needs to be named N.scm. If you dont use SRFI-64 for testing then
port your preferred test library first to be portable on all all implementations
and put it into snow-fort, then install it with snow-chibi inside the Dockerfile.

Add the SRFI number into srfis.scm.

## Adding new implementation

Add support for implementation
into [https://codeberg.org/retropikzel/compile-scheme](https://codeberg.org/retropikzel/compile-scheme).

Add support for implementation
into [snow-chibi](https://github.com/ashinn/chibi-scheme).
