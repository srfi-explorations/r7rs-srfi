#lang r7rs
(import (scheme base)
        (only (racket) compile-enforce-module-constants))
(compile-enforce-module-constants #f)
(include "64.sld")
