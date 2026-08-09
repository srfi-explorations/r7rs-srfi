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

    make SCHEME=chibi SRFI=64 all install test

Change chibi and 64 to other implementations and SRFI numbers.

## Running tests in docker

You will need to install test-r7rs and docker. Make docker work without sudo.

    snow-chibi install --impls=chibi retropikzel.test-r7rs

To run test:

    make SCHEME=chibi SRFI=64 test-docker

Change chibi and 64 to other implementations and SRFI numbers.

# Adding new SRFI

Add files:

    - srfi/N.sld
        - Library definition
    - srfi/N.scm
        - Library body/content

Add the SRFI number into test_srfis.txt.

Every SRFI needs corresponding test file in [test repository](https://github.com/srfi-explorations/srfi-test).
The test file needs to be named N.scm.

If you want to test your SRFI locally before the test is in git, run
`make srfi-test`. Then put your test into srfi-tests/N.scm and run
`chibi-scheme convert.scm` inside the srfi-test directory.


## Adding support for new implementation

Add support for implementation
into compile-r7rs in [https://codeberg.org/retropikzel/scheme-programs](https://codeberg.org/retropikzel/scheme-programs).

Add support for implementation
into snow-chibi here [https://github.com/ashinn/chibi-scheme](https://github.com/ashinn/chibi-scheme).

Add the name into test_r6rs.txt or/and test_r7rs.txt.
