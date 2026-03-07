# TODO

## Track T — Dynamical / Theorem Closure

Priority bucket: `P0`

- Replace trivial closure fallbacks on the minimum credible path.
  Current priority:
  `PhysicsClosureFullInstance` and `PhysicsClosureEmpiricalToFull` should use
  the real shift dynamics package and the intrinsic `(3,1)` theorem path.
- Tighten downstream closure consumers so they depend on theorem-backed closure
  data, not only type-level metric availability.
- Extend the dynamics package beyond Fejer/closest-point/MDL if a concrete
  causal propagation or effective-geometry witness becomes available.

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
