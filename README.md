# R7RS-SRFI

This is a project for collection of R7RS SRFI implementations.

[Jenkins](https://jenkins.scheme.org/job/r7rs/job/r7rs-srfi/)

[Test report](https://jenkins.scheme.org/job/r8rs/job/r7rs-srfi/job/main/R7RS-SRFI_20Test_20Report/)

## Building

    rm -rf srfi-test
    git clone https://github.com/srfi-explorations/srfi-test.git --depth=1
    make -C srfi-test
    make -f Makefile.build

This will generate Makefile to run tests.

## Running tests

    make test-srfi-N-IMPLEMENTATION

On implementation like Chicken that compile the libraries too you need to first run tests for
SRFIs that the SRFI you want to the depends on. The tests will propably fail but the libraries will
get built.

With compiler implementations run the tests for SRFIs the SRFI you want to test needs to build them.

So for example on chicken-compiler to test SRFI-64 run:

    make 8-chicken-compiler-library
    make 1-chicken-compiler-library
    make 60-chicken-compiler-library
    make 14-chicken-compiler-library
    make 13-chicken-compiler-library
    make 26-chicken-compiler-library
    make 28-chicken-compiler-library
    make 39-chicken-compiler-library
    make 64-chicken-compiler-library
    make 64-chicken-compiler

If you find yourself running this repeatedly you can add them into Makefile.shortcuts


# Adding new srfi

Add files:

    - srfi/N.sld
        - Library definition
    - srfi/N.scm
        - Library body/content
    - srfi/N.rkt
        - Shim file to support Racket
    - srfi/srfi-N.scm
        - Shim file to support Guile and Foment
        - Should have identical exports to N.sld but cond-expanded include for Foment and Guile only


You should be able to deduct what the contents of these files are from other SRFI implementations
in this repository.

Every SRFI needs corresponding test file in [test repository](https://github.com/srfi-explorations/srfi-test).
The test file needs to be named N.scm.

Add the SRFI data into srfis.scm. Keep the order by dependencies and mention them in the file.

## Adding new implementation

Add the implementation data into implementations.scm, keep the order alphabetical.
The first SRFI you port to any new implementation should be SRFI-64. As it's the test suite used
in SRFI tests.

### Misc

The srfi/srfi-N.scm files exist for Guile compability, their content should be identical to
srfi/N.sld.

The srfi/N.rkt files exists for racket-r7rs compability.
