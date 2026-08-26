# R7RS-SRFI


This is a project for collection of R7RS SRFI implementations.

- [Repository](https://github.com/srfi-explorations/r7rs-srfi)
- [Issues](https://github.com/srfi-explorations/r7rs-srfi/issues)
- [Jenkins](https://jenkins.scheme.org/job/r7rs_srfi/job/r7rs-srfi/)


## Running tests

You will need to install snow-chibi and implementations you want
to test with.
To run test:

    make SCHEME=chibi SRFI=64 test

Change chibi and 64 to other implementations and SRFI numbers.

To get Test Anything Protocl (TAP) output run:

    make SCHEME=chibi SRFI=64 test-tap


## Running tests with compile-r7rs

You will need to install snow-chibi, compile-r7rs and implementations you want
to test with.

    snow-chibi install --impls=chibi retropikzel.compile-r7rs

To run test:

    make SCHEME=chibi SRFI=64 all install test-compile-r7rs

Change chibi and 64 to other implementations and SRFI numbers.

To get Test Anything Protocl (TAP) output run:

    make SCHEME=chibi SRFI=64 all install-tap test-compile-r7rs


## Running tests in docker

You will need to install test-r7rs and docker. Make docker work without sudo.

    snow-chibi install --impls=chibi retropikzel.test-r7rs

To run test:

    make SCHEME=chibi SRFI=64 test-docker

Change chibi and 64 to other implementations and SRFI numbers.

To get Test Anything Protocl (TAP) output run:

    make SCHEME=chibi SRFI=64 test-docker-tap


# Adding new SRFI

Add files:

    - srfi/N.sld
        - Library definition
    - srfi/N.scm
        - Library body/content
    - srfi/N/LICENSE
        - Short version of the library license, use the SPDX ID from
        [https://opensource.org/licenses](https://opensource.org/licenses)
        - Only one license identifier in the file
            - Snow limitation
    - srfi/N/VERSION
        - Current version of the library
    - srfi/N/AUTHORS
        - If there are multiple, separate them with ",". No spaces before or after ",".
        - Propably best to not add emails, they can then be found in the code if needed
    - srfi/N/MAINTAINERS
        - If there are multiple, separate them with ",". No spaces before or after ",".
        - Propably best to not add emails
    - Run: make SRFI=N index
        - Creates file srfi/N/index.html
        - Contains the number, title and link
    - Run: make SRFI=N description
        - Creates file srfi/N/DESCRIPTION
        - Contains number and title

Add the SRFI number into test_srfis.txt.

Every SRFI needs corresponding test file in [test repository](https://github.com/srfi-explorations/srfi-test).
The test file needs to be named N.scm.

If you want to test your SRFI locally before the test is in git, run
`make srfi-test`. Then put your test into srfi-tests/N.scm, all-srfis list
in convert.scm and run `chibi-scheme convert.scm` inside the srfi-test directory.


### Additional notes

Some guidelines to get uniformity, but not mandatory

- Put license (header/short version) into srfi/N.scm file at the top
- Remove professions/titles, for example Dr., from author names in srfi/N/AUTHORS file


## Adding support for new implementation

Add support for implementation
into compile-r7rs in [https://codeberg.org/retropikzel/scheme-programs](https://codeberg.org/retropikzel/scheme-programs).

Add support for implementation
into snow-chibi here [https://github.com/ashinn/chibi-scheme](https://github.com/ashinn/chibi-scheme).

Add the name into test_r6rs.txt or/and test_r7rs.txt.
