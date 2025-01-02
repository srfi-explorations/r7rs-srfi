(define-library
  (srfi 19)
  (import (scheme base)
          (scheme write)
          (scheme read)
          (scheme file)
          (scheme time)
          (scheme char)
          (scheme cxr)
          (srfi 8))
  (export time-tai
          time-utc
          time-monotonic
          time-thread
          time-process
          time-duration
          current-time
          time-resolution
          make-time
          time?
          time-type
          time-second
          time-nanosecond
          set-time-type!
          set-time-second!
          set-time-nanosecond!
          copy-time
          time=?
          time<?
          time<=?
          time>?
          time>=?
          time-difference
          time-difference!
          add-duration
          add-duration!
          subtract-duration
          subtract-duration!
          make-date
          date?
          date-nanosecond
          date-second
          date-minute
          date-hour
          date-day
          date-month
          date-year
          date-zone-offset
          date-year-day
          date-week-day
          date-week-number
          current-date
          current-julian-day
          current-modified-julian-day
          date->julian-day
          date->modified-julian-day
          date->time-monotonic
          date->time-tai
          date->time-utc
          julian-day->date
          julian-day->time-monotonic
          julian-day->time-tai
          julian-day->time-utc
          modified-julian-day->date
          modified-julian-day->time-monotonic
          modified-julian-day->time-tai
          modified-julian-day->time-utc
          time-monotonic->date
          time-monotonic->julian-day
          time-monotonic->modified-julian-day
          time-monotonic->time-tai
          time-monotonic->time-tai!
          time-monotonic->time-utc
          time-monotonic->time-utc!
          time-utc->date
          time-utc->julian-day
          time-utc->modified-julian-day
          time-utc->time-monotonic
          time-utc->time-monotonic!
          time-utc->time-tai
          time-utc->time-tai!
          time-tai->date
          time-tai->julian-day
          time-tai->modified-julian-day
          time-tai->time-monotonic
          time-tai->time-monotonic!
          time-tai->time-utc
          time-tai->time-utc!
          date->string
          string->date)
  (cond-expand
    (chicken (include "19.scm"))
    (foment (include "srfi/19.scm"))
    (guile (include "19.scm"))))
