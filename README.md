# Building

Run:

    git submodule update --init --recursive
    git submodule update --recursive --remote
    make -C srfi-test
    make


# Running tests

    make test-srfi-N-IMPLEMENTATION

# Adding new srfi

Add files:

    - srfi/N.sld
        - Library definition
    - srfi/N.scm
        - Library body/content
    - srfi/N.rkt
        - Shim file to support Racket
    - srfi/srfi-N.rkt
        - Shim file to support Guile


You should be able to deduct what the contents of these files are from other SRFI implementations
in this repository.

Every SRFI needs corresponding test file in [test repository](https://github.com/srfi-explorations/srfi-test).
The test file needs to be named N.scm.

Add the SRFI data into srfis.scm.

# Adding new implementation

Add the implementation data into implementations.scm, keep the order alphabetical.
The first SRFI you port to any new implementation should be SRFI-64. As it's the test suite used
in SRFI tests.

## Code origins, notes, articles and misc.

- SRFI-64
    - Taken from Guile's new implementation and mutilated to cooperation
