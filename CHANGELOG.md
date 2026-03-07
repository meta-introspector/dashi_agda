# Changelog

## 2026-03-08

- documented Stage C as the open "minimal credible physics closure" target
  rather than a vague full-closure slogan,
- added a dedicated design note for the minimum acceptable physics-closure
  boundary,
- reorganized `TODO.md` into theorem/dynamics, observable/prediction, shared
  integration, and deferred sections,
- introduced closure-side dynamics and observable/prediction packaging in code,
- rewired the main full-closure instances toward the intrinsic signature path
  and real shift dynamics witnesses.
- clarified the observable boundary so it now separates:
  proved outputs,
  excluded alternatives,
  and separately documented forward prediction claims.
- expanded the typed observable package with the proved current shell/orientation
  outputs and the exclusion of the non-`(3,1)` 4D candidates.
- added a repo-facing forward-prediction table with confidence levels and
  falsifiers for the current leading novel claims.
- marked profile rigidity as the flagship next-phase benchmark in the roadmap,
  minimum-closure note, README, and TODO.
- added a typed realization-profile-rigidity validation surface with benchmark
  verdicts, a shift reference report, and a tail-permutation alternate slot.
- tightened the Stage C closure boundary by exposing the minimum-credible
  adapter and authoritative dynamics/Lyapunov accessors for downstream
  consumers.
- upgraded the tail-permutation benchmark slot into a real comparison
  observation with computed shell-1 and shell-2 profiles.
- classified tail permutations as a negative control rather than an admissible
  alternate realization, and wired the first nontrivial rigidity report
  through the typed harness.
- added a concrete `P0/P1/P2` milestone document for physics closure work.
- formalized the admissible comparison realization interface so future
  profile-rigidity candidates must expose the full
  orientation/profile/signature surface.
- added an aggregate rigidity-suite report that groups:
  self exact match,
  Bool inversion admissible result,
  and tail-permutation negative control.
- implemented the first admissible alternate realization:
  the 4D Bool inversion candidate on the `(3,1)` mask, with shell-1 and
  shell-2 profile computation.
- refined rigidity verdict semantics so `signatureOnlyMatch` now means:
  same signature class with non-rigid shell profiles.
- refactored the intrinsic shell/orbit theorem boundary so theorem-critical
  records no longer mention finite realization fields; finite enumeration now
  remains on the shift-instance discharge side.
- added a closure-facing validation adapter so the minimum-credible Stage C
  entrypoint can expose the aggregate rigidity suite and its explicit verdicts.
- added the first admissible alternate realization implementation:
  the 4D Bool inversion candidate on the `(3,1)` mask.
- refined rigidity verdict semantics so `signatureOnlyMatch` now means:
  signature agrees while profile rigidity fails.
