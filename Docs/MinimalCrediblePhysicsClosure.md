# Minimal Credible Physics Closure

## Headline

In this repo, "minimal credible physics closure" means:

- the 4D signature theorem is already in place,
- the closure stack carries a real dynamical package rather than only loose
  closure ingredients,
- the same closure stack also exposes observable consequences and forward
  prediction claims,
- the repo distinguishes clearly between:
  - what is formally proved,
  - what is supported by empirical/evidence modules,
  - what is currently only a prediction or deviation claim.

It does **not** mean:

- full GR/QFT recovery,
- solved physics,
- realization-independent closure beyond the current 4D framework,
- Monster/Moonshine or other deep symmetry closure.

## Minimum Acceptance Boundary

The minimum target is reached only when all of the following are true:

1. the signature input to the full closure comes from the current intrinsic
   `(3,1)` theorem path,
2. the full closure carries a real shift dynamics package with:
   - Fejer/closest-point seams,
   - MDL Lyapunov witness,
   - shift seam certificates,
3. the repo exposes a single observable-consequence package for the current
   shift framework,
4. that package distinguishes:
   - proved outputs,
   - excluded alternatives,
   - forward prediction claims,
5. downstream consumers such as the spin/Dirac gate depend on theorem-backed
   closure data rather than only type-level metric access.

## Parallel Tracks

### Track T — Theorem and Dynamics

This track upgrades the current closure from "signature + wiring" to
"signature + dynamics".

Current priorities:

- remove trivial placeholders from the minimum closure path,
- bundle the real shift Lyapunov and seam certificates as a dynamics package,
- feed full-closure instances from the intrinsic signature theorem,
- make downstream closure consumers depend on that package.

### Track E — Observables and Forward Predictions

This track upgrades the empirical side from separate evidence modules to a
single observable boundary.

Current priorities:

- package orbit/signature, MDL/Fejer, and seam evidence together,
- split that boundary into:
  - proved outputs:
    exact orientation-tag, shell-1 profile, shell-2 profile, and `(3,1)`
    profile match,
  - excluded alternatives:
    failure of the other 4D candidate signatures,
  - forward prediction claims:
    profile rigidity across new realizations,
    Fejer-over-χ² monotonicity,
    observable-space collapse,
    snap-threshold transition laws,
- state a falsifiability/deviation boundary for the framework.

## Forward Prediction Table

These are **not** current theorem outputs. They are forward claims suggested by
the present closure stack and should be tested on new realizations, datasets,
or regimes.

| Claim | Source modules | Confidence | What would falsify it |
| --- | --- | --- | --- |
| Profile rigidity across new realizations | `Signature31FromShiftOrbitProfile`, `ConeArrowIsotropyShiftOrbitEnumeration` | High | A new 4D realization preserving the same cone/arrow/isotropy structure produces a different shell-profile class or fails to select `(3,1)`. |
| Fejér-over-χ² monotonicity | `ShiftSeamCertificates`, `EnergyClosestPointShiftInstance`, `MDLFejerAxiomsShift` | High | A compatible shift-like regime shows persistent χ²-style improvement while Fejér/MDL observables lose monotonicity or closest-point behavior. |
| Observable-space collapse | `RealClosureKitFiber`, `DynamicalClosureShiftInstance` | High | Distinct microstates in the same observable quotient fail to converge to the same observable endpoint in the closure-compatible regime. |
| Snap-threshold transition law | `SnapSignatureShiftInstance`, `RealConeMonotoneExceptSnapsShift`, `SeverityGuard*` modules | Medium | Regime changes occur diffusely rather than clustering at snap/severity threshold events. |
| Witness-policy robustness | `WitnessSetPolicy`, `EmpiricalClosureWithWitnessPolicy`, `EmpiricalClosureWithSignatureLock` | Medium | Admissible witness-policy changes alter the final signature/closure classification rather than only efficiency or convergence behavior. |
| Cone-split persistence | `PhysicsClosureEmpiricalWithConeSplit`, `ArrowSeparatedDeltaConeSplit*`, `MaskedOrthogonalSplit` | Medium | New compatible datasets fail to preserve near-zero cross terms or stable quadratic split structure. |
| Beta-seam universality | `BetaSeamCertificates*`, `BetaSeamCSVEvidence`, `PhysicsClosureEmpiricalBetaInstance` | Medium | Two seam bundles satisfying the same certificate interface lead to incompatible closure observables. |
| Defect-density / curvature correlation | `DefectDensityCurvature`, `EinsteinFromDefect` | Low | Persistent defect concentration shows no correlation with effective curvature concentration in the intended closure regime. |
| Area-law style admissible-state growth | `Holography.AreaLaw` | Low | Admissible-state growth tracks bulk volume systematically better than boundary complexity in closure-compatible regimes. |

## Validation Priority

Recommended order for checking the forward claims:

1. profile rigidity across new realizations,
2. Fejér-over-χ² monotonicity,
3. observable-space collapse,
4. snap-threshold transition law,
5. witness-policy robustness,
6. cone-split persistence.

## Current Status

Already closed:

- Stage A orbit-profile signature discrimination,
- Stage B finite 4D cone/signature forcing in the current framework.

Still open:

- Stage C theorem/dynamics closure,
- Stage C observable/prediction closure,
- broader realization-independent and full-physics generalization.

## Next Phase

The next implementation phase is intentionally narrow:

- harden the current minimum-credible closure path so downstream consumers point
  to the real dynamics package rather than generic fallback seams,
- add the first typed forward-test harness,
- use **profile rigidity across new 4D realizations** as the flagship
  benchmark.

Initial benchmark boundary:

- reference realization:
  the current signed-permutation 4D shift realization,
- comparison surface:
  orientation tag, shell-1 profile, shell-2 profile, and final signature,
- benchmark verdicts:
  exact match, signature-only match, mismatch,
- admissible comparison realization:
  one that is intended to preserve the same cone/arrow/isotropy comparison
  boundary and exposes the full orientation/profile/signature surface,
- negative control:
  one that is structurally nearby enough to probe failure modes, but is already
  known not to satisfy the intended comparison boundary.

Current benchmark decision:

- the tail-permutation realization is now treated as a **negative control**,
  not as an admissible alternate realization,
- it still yields a useful first nontrivial rigidity verdict because its shell
  profiles diverge from the signed-permutation reference,
- the next benchmark after that should be a genuinely closure-compatible
  alternate realization.

Current admissible candidate:

- Bool inversion on the same 4D `(3,1)` mask is the first closure-compatible
  alternate realization,
- the current expectation is `signatureOnlyMatch`:
  same signature/orientation class, different shell-profile class.
- the next closure-facing step is to make the rigidity suite part of the
  minimum-credible adapter surface, not just a sibling validation module.

For the current `P0/P1/P2` execution order, see
`Docs/PhysicsClosurePriorities.md`.
