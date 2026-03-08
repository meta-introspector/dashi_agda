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
- added a repo-facing closure validation summary surface that re-exports the
  current Stage C rigidity verdicts from the minimum-credible validation
  adapter,
- recorded the current validation snapshot explicitly in the docs and README:
  signed-permutation self-check `exactMatch`,
  Bool inversion admissible case `signatureOnlyMatch`,
  tail-permutation negative control `mismatch`.
- started the Fejér-over-χ² benchmark as a typed shift reference harness with
  theorem-backed Fejér / closest-point / MDL witnesses,
- made the χ² side explicit as a falsifier-status boundary instead of
  overstating it as a completed Agda proof.
- upgraded the χ² benchmark status from flat `pending` to an intermediate
  `interfaceWired` state when the snap / `chi2Spike` boundary is present,
- exposed the Fejér benchmark snapshot through the repo-facing closure
  validation summary:
  positive side established,
  χ² side interface-wired,
  standalone falsifier still not formalized.
- tightened the Fejér benchmark report so the positive side now carries the
  actual shift seam and MDL/Fejér witnesses directly instead of placeholder
  booleans.
- documented the Coxeter / Weyl-group direction as the preferred next
  mathematically serious alternate realization after Bool inversion,
- replaced the vocabulary-only `B₄` scaffold with an independent
  root-shell/Weyl-action shell-orbit computation,
- added a standalone `B₄` shell comparison report and exposed it through the
  validation summary without promoting it into the admissible rigidity harness,
- kept orientation/signature promotion for the `B₄` realization explicitly
  deferred until it is justified.
- added a repo-facing note documenting the orbit-shell / Lorentz-signature
  framing and the current validation ladder,
- added a typed `B₄` promotion status surface so the summary can say
  `standaloneOnly` explicitly instead of relying on prose alone.
- refined the standalone `B₄` comparison report so it now classifies the
  computed shell data by candidate shell neighborhood; the current `B₄`
  realization lands in the definite shell class `[8] / [24]`, clarifying that
  Lorentz-harness promotion is blocked structurally rather than by missing
  wiring alone.
- added a finite orbit-shell generating series layer built from orientation
  plus shell-1 / shell-2 orbit-size multiplicities.
- added theorem-backed shift-series and standalone `B₄` series modules, then
  exposed a standalone `B₄` series comparison through the closure-validation
  summary.
- added a concrete grade-0 wave-series prototype from the shift series while
  keeping it outside the theorem-critical closure path and any moonshine-level
  claim surface.
- promoted shell-neighborhood class to a first-class API shared by the shift
  reference and the standalone `B₄` comparison surface.
- added a bounded one-minus shell-family module proving the current shell-1
  family pattern for `m = 2..8`.
- refactored the standalone `B₄` report to use the canonical neighborhood type
  instead of a `B₄`-specific enum.
- updated the roadmap and TODOs so the next theorem milestone after the bounded
  family is an explicit parametric-`m` generalization.
- generalized the shell-neighborhood classifier so the one-minus family is
  recognized structurally from shell-1 triples rather than only by the bounded
  lookup cases.
- added a parametric `m` one-minus family layer that exposes the general family
  formula and its shell-neighborhood classification, while keeping the bounded
  `m = 2..8` module as the theorem-backed witness layer.
- exposed the parametric family layer through the closure validation/summary
  surface for the current shift reference.
- hardened `PhysicsClosureEmpiricalToFull` so it now reuses the same concrete
  constraint system, Lie structure, and closure witness as the canonical full
  closure instance instead of a trivial compatibility shim.
- hardened `PhysicsClosureInstanceAssumed` in the same way, so the legacy
  assumed closure surface now also reuses the concrete constraint witness
  rather than a trivial closure shim.
- added an explicit canonical Stage C entrypoint and status surface so the
  minimum-credible closure path is authoritative in code, while compatibility
  wrappers and prototype branches remain explicitly non-canonical.
- added a typed observable-collapse benchmark surface for the shift reference,
  backed by the `RealClosureKitFiber` observable fixed-point and uniqueness
  witnesses and ready for repo-facing validation summary export.
- tightened the one-minus shell story from a parametric family layer into a
  real parametric shell-1 theorem exported through the validation summary.
- added a concrete shift-side χ²-boundary witness from the severity/snap
  layer and promoted the Fejér-over-χ² shift reference off the old
  `interfaceWired` status.
- added a standalone typed snap-threshold benchmark for the shift reference
  and exposed it through the repo-facing validation summary.
- expanded the single χ² boundary witness into a small typed shift-side
  boundary library and surfaced its size through the validation summary.
