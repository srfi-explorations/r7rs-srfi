# Building

Run build.scm with any R7RS Scheme implementation. It generates Makefile and Jenkinsfile.

# Running tests

    make test-IMPLEMENTATION-srfi-N

## Code origins, notes, articles and misc.

- SRFI-64
    - https://github.com/fisherro/snow-srfi-64
    - https://mdhughes.tech/2020/02/27/scheme-test-unit/
    - https://wolfsden.cz/blog/post/state-of-srfi-64.html
    - https://github.com/mnieper/scheme-libraries-fork/blob/main/lib/scheme-libraries/testing.sls
        - This should produce [TAP](https://testanything.org/) output
