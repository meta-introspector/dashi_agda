# TODO

## Track T — Dynamical / Theorem Closure

Priority bucket: `P0`

- Replace trivial closure fallbacks on the minimum credible path.
  Current priority:
  `PhysicsClosureFullInstance` and `PhysicsClosureEmpiricalToFull` should use
  the real shift dynamics package, the intrinsic `(3,1)` theorem path, and
  the same concrete constraint-closure witness.
- Tighten downstream closure consumers so they depend on theorem-backed closure
  data, not only type-level metric availability.
- Extend the dynamics package beyond Fejer/closest-point/MDL if a concrete
  causal propagation or effective-geometry witness becomes available.
- Keep legacy assumption-backed modules outside the canonical Stage C story.
  Current explicit legacy surfaces:
  `PhysicsClosureInstanceAssumed`,
  generic cone/isotropy compatibility placeholders,
  and prototype wave/unification modules.

## Track E — Observable Consequences / Forward Predictions

Priority bucket: `P0` first, then `P1`

- Package the current shift observables into one typed interface with three
  buckets:
  proved outputs,
  excluded alternatives,
  forward prediction claims.
- Keep the current proved outputs explicit:
  orbit-profile/signature consistency, seam certificates, MDL descent witness,
  exact shell-1/shell-2 profile outputs, and full 4D candidate exclusion.
- Add forward prediction claims separately.
  Current leading candidates:
  profile rigidity across new realizations,
  Fejer-over-χ² monotonicity,
  observable-space collapse,
  snap-threshold transition laws,
  witness-policy robustness,
  cone-split persistence.
- Add a validation table for each forward claim:
  source modules,
  confidence level,
  falsifier,
  preferred test harness or dataset.
- Prioritize validation in this order:
  profile rigidity,
  Fejer-over-χ²,
  observable-space collapse,
  snap-threshold laws.
- Observable-space collapse benchmark:
  add a typed harness/report sourced from `RealClosureKitFiber.obsFixed` and
  `obsUnique`, then expose its verdict through the repo-facing validation
  summary.
- Snap-threshold benchmark:
  landed for the shift reference; next extend it beyond the current witness
  state and decide whether the right next step is a richer falsifier surface
  or additional realization coverage.
- Build the profile-rigidity harness first.
  Concrete sub-tasks:
  define the benchmark interface,
  add an alternate realization slot,
  emit a typed benchmark report,
  connect the report to the minimum-credible closure adapter.
- The tail-permutation comparison is now the first negative control, not the
  first admissible alternate realization.
- Next validation task after the negative control:
  add one genuinely closure-compatible alternate realization that exposes the
  full orientation/profile/signature surface.
- First admissible alternate realization:
  the 4D Bool inversion realization on the `(3,1)` mask.
- Next mathematically serious alternate realization after Bool inversion:
  a Coxeter / Weyl-group realization of the same 4D shell-orbit data.
- First implementation step for that realization:
  add an independent `B₄` / hyperoctahedral shell/profile computation from
  explicit root-shell points and a Weyl-style action.
- Next sub-task after the independent report:
  classify the `B₄` shell neighborhood explicitly and only then decide whether
  orientation/signature promotion is even plausible.
- Add an explicit admissible-realization interface so future comparison
  candidates cannot silently omit orientation/signature data.
- Record whether the Bool inversion candidate lands as
  `signatureOnlyMatch` or `mismatch`.
- Add one aggregate validation/report object that exposes:
  self exact match,
  Bool inversion admissible result,
  tail-permutation negative control.
- Lift that aggregate rigidity report into a closure-facing adapter so the
  minimum-credible Stage C entrypoint exposes both:
  theorem-backed closure data and current validation status.
- Add one repo-facing closure summary surface that re-exports the current
  rigidity suite verdicts directly from the minimum-credible validation
  adapter.
- After the summary surface lands, move the next runnable benchmark to:
  Fejer-over-χ² monotonicity.
- Fejer-over-χ² benchmark sub-tasks:
  define the benchmark report type,
  define an explicit χ² falsifier-status type,
  add a shift reference harness,
  expose the current benchmark verdict from theorem-backed Fejér /
  closest-point / MDL witnesses.
- Upgrade the χ² side from `pending` to an intermediate
  `interfaceWired` status when the snap / `chi2Spike` boundary is present.
- Immediate χ²-side hardening:
  landed via a concrete shift-side χ²-boundary witness from the severity/snap
  layer; next decide whether to promote that witness into a broader falsifier
  theorem or an explicit counterexample library.
- Immediate χ²-side implementation step:
  add a small typed shift-side boundary/counterexample library with more than
  one witness state, then surface it through the validation summary before
  attempting a larger falsifier theorem.
- After that, the next Fejér benchmark target is a standalone formalized χ²
  falsifier theorem or counterexample witness.
- Keep the positive side non-placeholder:
  benchmark facts/reports should carry the actual theorem witnesses instead of
  only boolean flags.
- Add one falsifiability / deviation boundary to the same interface.
  Current minimum:
  mirror-signature exclusion plus failure of competing 4D candidate profiles.
- Promote existing CSV/evidence modules into consumers/providers of the same
  observable package instead of parallel wrappers.

## Shared Integration

- Keep Stage A and Stage B documentation aligned with the new Stage C target:
  minimal credible physics closure.
- Ensure docs, TODOs, code, and changelog all distinguish:
  proved,
  evidence-backed,
  predicted.
- Refactor the intrinsic shell/orbit theorem path so theorem-critical records
  do not mention finite realization fields.
- Keep the Coxeter/Weyl scaffold explicitly separated from the admissible
  realization harness until the `B₄` realization exposes justified
  orientation/signature data.
- Add and maintain a repo-facing note for the mathematical framing of the
  orbit-shell result:
  `Docs/OrbitShellProfilesAndLorentzSignature.md`.
- Next `B₄` sub-task after the independent shell/profile report:
  add a typed shell-neighborhood status surface and only revisit admissible
  promotion if the neighborhood is Lorentz-compatible.
- Add a canonical shell-neighborhood classification layer shared by the shift
  reference, `B₄`, and future realizations.
- Add a bounded one-minus shell-family theorem for `m = 2..8`.
- Current theorem task:
  use the landed parametric `m` shell-1 theorem as the baseline one-minus
  classifier for the current shift family.
- Follow-on theorem task:
  decide whether the next theorem step is shell-2 / orientation follow-through
  or a second Lorentz-family realization.
- Keep the canonical Stage C entrypoint authoritative in code:
  `DASHI.Physics.Closure.CanonicalStageC` is the recommended import surface,
  while legacy assumed/prototype modules remain compatibility-only.
- After the full parametric theorem lands, the next milestone is:
  a second Lorentz-family realization search.
- Add a finite orbit-shell generating series layer:
  orientation tag plus shell-1 / shell-2 orbit-size multiplicities.
- Build the shift series witness from theorem-backed current profile data.
- Build the standalone `B₄` series and compare it against the shift series
  without changing admissible-harness semantics.
- Add a concrete prototype wave-series module that lifts the finite shift
  series into a grade-0 wave-facing object while staying outside the
  theorem-critical closure path.

## Deferred Beyond Minimum

Priority bucket: `P2`

- Full realization-independent generalization beyond the current 4D framework.
- Full GR / QFT recovery.
- Monster / Moonshine or broader symmetry closure.

## Existing Empirical Gate

### Masked Orthogonal Split (empirical gate: PASS)

Layer: 3D closure embedding (`v_pnorm, v_dnorm, v_arrow`).
Quadratic: `G = diag([-1, 0.2034, -1])` (mask-based).
Projector: `P = G-orthogonal projector onto shape coords [0,1]` (`arrow=coord 2`).
Results (n=156 steps, dim=3):

- `||PᵀG − GP||_F = 0.0`
- `max |⟨PΔs, (I−P)Δs⟩_G| = 2.396e−16`
- `max |Q(Δs) − Q(PΔs) − Q((I−P)Δs)| = 6.661e−16`

Interpretation: Case A achieved in cone layer — exact G-self-adjoint
projection, vanishing cross-term, Pythagorean quadratic split holds to machine
precision.
