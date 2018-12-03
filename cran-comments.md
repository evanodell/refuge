
## Submission Notes

This is a resubmission of the `refuge` package, to correct a bug found 
immediately after the release of 0.3.0 to CRAN.

This is version 0.3.2, which fixes that bug, caused by a missing "&" sign in
the `rfg_search` function. Have implemented better testing to catch it

## Test environments
* local macOS install, R 3.5.1
* ubuntu 14.04 (on travis-ci), R 3.5.1
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 notes
