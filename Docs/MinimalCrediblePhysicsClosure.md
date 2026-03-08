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
- keep the canonical closure path and empirical full adapter on the same
  concrete constraint-closure witness,
- bundle the real shift Lyapunov and seam certificates as a dynamics package,
- expose an explicit dynamics-status surface for propagation, causal
  admissibility, monotone quantity, and effective geometry,
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
- immediate validation hardening:
  move the Fejér-over-χ² reference from `interfaceWired` to a concrete
  shift-side χ²-boundary witness, and add a standalone snap-threshold law
  benchmark sourced from the same severity/snap policy layer.

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
- the next synthetic-promotion step is now explicit in code:
  orientation/signature remain blocked until independently justified, even
  though shell-1 and shell-2 already match.

## Next Mathematical Realization Target

After the Bool inversion admissible check, the preferred next alternate
realization is:

- a **Coxeter / Weyl-group realization** of the same 4D shell-orbit data,
  starting in `B₄` / hyperoctahedral language and only later refining to a
  more independent root-system or signed-lattice model.

Why this is the preferred next realization:

- it is mathematically more compelling than another ad hoc dynamics,
- it has a known orbit-stratification story,
- it makes the shell/profile result easier to discuss with geometers,
- it directly tests whether the current profile lock is a signed-orbit
  invariant rather than just a shift artifact.

For the present repo state, the honest next implementation step is:

- add an **independent `B₄` shell-orbit report** built from explicit
  root-shell points and a Weyl-style action,
- keep that report out of the admissible rigidity harness until its shell class
  is shown to be Lorentz-compatible and orientation/signature are justified,
- only then promote it to a full admissible alternate realization.

Current status of that report:

- the independent `B₄` shell data land in the **definite shell class**
  `[8] / [24]`,
- so the current blocker is structural mismatch with the Lorentz shell class,
  not just missing orientation wiring.

## Shell-Family Milestone

The next mathematical milestone is now:

- make **shell-neighborhood class** first-class,
- formalize the bounded one-minus shell family for the dimensions already
  encoded in the repo,
- and only then push for a second Lorentz-family realization.

Current intended bounded family:

- `m = 2 -> [2,2]`
- `m = 3 -> [8,4,2]`
- `m >= 4 -> [4(m-1)(m-2), 2(m-1), 2]`

Roadmap after that:

- bounded family theorem on `m = 2..8`,
- then a parametric `m` shell-1 theorem,
- then a second realization that lands in the same shell neighborhood.

Current closure-burn-down target:

- the canonical Stage C path already uses the concrete shift dynamics package
  and concrete constraint instance,
- the next hardening step is to remove the last trivial constraint shim from
  the empirical full adapter so the recommended closure surfaces all agree on
  the same closure witness,
- and keep the canonical Stage C entrypoint explicit in code so that
  compatibility and prototype surfaces are no longer mistaken for the
  authoritative closure path.

## Orbit-Shell Series Next Step

The next algebraic object to add is a finite orbit-shell generating series
built from:

- orientation tag,
- shell-1 orbit-size multiplicities,
- shell-2 orbit-size multiplicities.

Immediate targets:

- shift series witness from the current theorem-backed profile data,
- standalone `B₄` series comparison,
- prototype wave-graded lift using the finite series as the grade-0 seed.

This series work is intended to strengthen comparison and future grading
questions. It does **not** by itself upgrade the repo to a theorem-backed
theta-series or moonshine claim.

## Current Validation Snapshot

The current Stage C validation surface now exposes one explicit rigidity suite
through the minimum-credible closure adapter:

- reference self-check:
  `exactMatch`,
- first admissible alternate realization:
  Bool inversion on the 4D `(3,1)` mask, currently classified as
  `signatureOnlyMatch`,
- negative control:
  tail permutations, classified as `mismatch`.

This means the current closure stack is already stronger at the
**signature-rigidity** level than at the **exact shell-profile-rigidity**
level. The next validation work should preserve this distinction explicitly.

## Next Runnable Benchmark

The next runnable benchmark after the rigidity snapshot is:

- **Fejér-over-χ² monotonicity**

For the current repo state, the first honest implementation target is:

- a typed reference harness for the shift realization,
- theorem-backed positive-side witnesses:
  Fejér monotonicity, closest-point behavior, and MDL descent,
- an explicit χ² falsifier-status slot.

This means the first Fejér benchmark report should distinguish:

- what is already theorem-backed on the MDL / closest-point side,
- whether the χ² side is carried by a concrete shift-side boundary witness,
  and whether that witness remains only a boundary proxy or has been upgraded
  to a broader falsifier theorem.

It should not pretend that the χ²-side counterexample is already encoded if
the repo still only documents that part empirically.

Current Fejér benchmark snapshot:

- positive side:
## Observable-Collapse Benchmark

The next benchmark that can be made fully theorem-backed from the current
shift stack is:

- **observable-space collapse**

Reason:

- `RealClosureKitFiber` already carries a distinguished observable endpoint
  `obs0`,
- together with `obsFixed` and `obsUnique`,
- and the shift instance already instantiates that structure concretely.

So this benchmark should be treated as stronger than a mere forward claim for
the current shift realization: it is a typed theorem-backed collapse witness on
the present Stage C path.
  theorem-backed, established, and carried directly by the benchmark harness,
- χ² side:
  now carried by a concrete shift-side boundary witness from the
  snap/`chi2Spike` severity layer,
  with the standalone snap-threshold benchmark exposed separately as its own
  typed report.

For the current `P0/P1/P2` execution order, see
`Docs/PhysicsClosurePriorities.md`.

For the current mathematical framing of the orbit-shell result, see
`Docs/OrbitShellProfilesAndLorentzSignature.md`.
