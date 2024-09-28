# Building

Use either:

- ./generate-kawa
- ./generate-gauche


# Running tests

    make test-IMPLEMENTATION-srfi-N

# Adding new srfi

Add files:

    - srfi/N.sld
        - Library definition
    - srfi/N.scm
        - Library body/content
    - srfi/N.rkt
        - Shim file to support Racket

You should be able to deduct what the contents of these files are from other SRFI implementations
in this repository.

Every SRFI needs corresponding test file in [test repository](https://github.com/srfi-explorations/srfi-test).
The test file needs to be named N.scm.

Add the SRFI data into srfis.scm.

# Adding new implementation

Add the implementation data into implementations.scm.

## Code origins, notes, articles and misc.

- SRFI-64
    - https://github.com/fisherro/snow-srfi-64
    - https://mdhughes.tech/2020/02/27/scheme-test-unit/
    - https://wolfsden.cz/blog/post/state-of-srfi-64.html
    - https://github.com/mnieper/scheme-libraries-fork/blob/main/lib/scheme-libraries/testing.sls
        - This should produce [TAP](https://testanything.org/) output
    - tr7 does not have (scheme complex) support as the time of writing (2024-09-28)
