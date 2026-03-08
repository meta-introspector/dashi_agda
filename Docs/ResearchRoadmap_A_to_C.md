# Research Roadmap: A -> B -> C

## Current Theorem State

The current finished mathematical headline in this repo is:

> **Stage A — Orbit Profile Signature Discrimination**  
> The orbit shell profile computed from the shift dynamics uniquely selects
> Lorentz signature `(3,1)` among the candidate 4D signatures.

The canonical path is:

`OrbitProfileComputedSignedPerm`
-> `Signature31ShiftProfileWitness`
-> `Signature31FromShiftOrbitProfile`
-> `PhysicsClosureInstanceAssumed` / `PhysicsClosureFullInstance`
-> `SpinDiracGateFromClosure`

This is the finished classification theorem. In addition, the repo now closes
the Stage B bridge for the current finite 4D shift realization: the
cone/arrow/isotropy instance carries a finite shell realization and finite
isotropy realization, the shell-orbit enumeration is derived from the abstract
shell-action layer, and the resulting profile agrees with the computed
signed-permutation profile used by the Stage A discriminant.

What is still missing is the broader generalization beyond the current finite
4D realization. The repo does not yet prove that arbitrary abstract
cone/arrow/isotropy data force the same shell-orbit structure without passing
through the current finite realization framework.

## Stage A — Orbit Profile Signature Discrimination

Stage A is the finished theorem layer currently supported by the repo.

What it establishes:

- a concrete orbit shell invariant is computed from the 4D shift dynamics,
- that invariant is matched against the candidate signatures
  `sig40`, `sig31`, `sig22`, `sig13`, `sig04`,
- the discriminant uniquely selects `sig31`.

Immediate implications:

- a new invariant for dynamical classification,
- a signature detector derived from orbit statistics,
- a mathematically clean entrypoint for collaborators and outreach.

Primary repo anchors:

- `DASHI.Physics.Signature31ShiftProfileWitness`
- `DASHI.Physics.Signature31FromShiftOrbitProfile`
- `DASHI.Physics.Closure.PhysicsClosureSummary`

## Stage B — Cone -> Signature Forcing

Stage B is now solved for the current finite 4D shift realization framework.

Current status:

- complete for the concrete finite 4D shift realization,
- still open as a fully realization-independent theorem.

Target statement:

`cone invariance + arrow/time orientation + isotropy -> orbit shell profile`

combined with Stage A:

`orbit shell profile -> sig31`

to yield:

`cone invariance + arrow/time orientation + isotropy -> sig31`

What is now proved in the current framework:

- `SignatureAxioms` carries the finite shell carrier, shell predicates, and
  finite isotropy action for the 4D shift instance,
- `AbstractShellAction` transports that data through the geometry-side shell
  action layer,
- generic shell enumeration derives the shell-orbit profile from that abstract
  shell action,
- the resulting profile is proved equal to the computed signed-permutation
  profile used by the Stage A discriminant,
- therefore the concrete finite 4D cone/arrow/isotropy realization forces
  `sig31`.

What remains open beyond Stage B:

- remove dependence on the current finite realization framework itself,
- derive the shell-orbit structure from more intrinsic abstract hypotheses,
- generalize beyond the current ternary 4D signed-permutation model.
- immediate theorem order:
  bounded one-minus family theorem on `m = 2..8`
  -> parametric `m` family theorem
  -> second Lorentz-family realization.

## Stage C — Minimal Credible Physics Closure

Stage C is the next major program after the current signature closure result.
It is still open. In this repo, Stage C should now be read as:

> a minimal credible physics closure for the current 4D framework,
> not a final or “solved physics” claim.

Stage C is split into two coordinated tracks.

### Track T — Theorem/Dynamics Closure

Target:

`signature closure`
-> `causal/dynamical closure`
-> `nontrivial full closure instance`

This track is responsible for:

- theorem-backed dynamics rather than type-only wiring,
- causal propagation and closure laws tied to the current shift stack,
- real Lyapunov / Fejer / closest-point witnesses on the minimum closure path,
- nontrivial closure consumers downstream of the signature theorem.

### Track E — Observable Consequences and Forward Predictions

Target:

`signature closure`
-> `observable consequence package`
-> `forward prediction package`

This track is responsible for:

- explicit observable bundles rather than scattered evidence modules,
- exact shell/profile outputs for the current 4D shift realization,
- exclusion statements for the non-`(3,1)` 4D candidates,
- explicit separation between theorem outputs and forward prediction claims,
- forward predictions for new realizations or new external regimes,
- packaging orbit/signature, MDL/Fejer, and closure seams into one interface,
- concrete falsifiability/deviation statements for the current framework,
- a unified report boundary that separates proved, evidence-backed, and
  predicted claims.

Current leading forward claims:

- profile rigidity across new realizations,
- Fejér-over-χ² monotonicity,
- observable-space collapse,
- snap-threshold transition laws,

Current note for the orbit-shell side of this program:

- `Docs/OrbitShellProfilesAndLorentzSignature.md`
- witness-policy robustness,
- cone-split persistence.

Possible downstream themes still remain:

- stronger closure and geometric rigidity results,
- representation-theoretic explanations of the orbit invariant,
- Monster/Moonshine-style symmetry as a later structural hypothesis or theorem
  target.

Stage C must not be described as proved by the current repo state.
Any Monster/Moonshine interpretation remains explicitly downstream and
speculative unless supported by separate theorem-level bridges.

Immediate mathematical milestone before another Lorentz-family realization
search:

- canonical shell-neighborhood classification,
- bounded one-minus shell-family theorem on `m = 2..8`,
- parametric `m` shell-1 theorem,
- then a second Lorentz-family realization search.

Immediate next phase inside Stage C:

- closure hardening on the minimum-credible path,
- remove the trivial empirical full-adapter closure shim so the canonical path
  and the empirical full adapter both reuse the concrete constraint instance,
- keep the canonical Stage C entrypoint explicit in code,
- add an explicit dynamics-status layer on the canonical shift path,
- a typed profile-rigidity validation harness,
- one reference benchmark using the signed-permutation shift realization,
- one alternate realization slot,
- explicit distinction between:
  admissible comparison realizations,
  and negative controls.

Current benchmark decision:

- the existing tail-permutation surface is treated as a negative control,
  because it is useful for structured mismatch detection but is not the right
  closure-compatible comparison target.
- the synthetic one-minus candidate is now profile-aware, and its missing
  orientation/signature proof boundary is tracked explicitly through a
  promotion-bridge status surface instead of only prose.

## Milestones and Exit Criteria

### Stage A

Status: complete.

Exit criterion:

- the computed shift orbit profile uniquely selects `(3,1)` among the candidate
  4D signatures and is exposed through the theorem path.

### Stage B

Status: complete for the current finite 4D realization framework.

Exit criterion:

- the concrete shift theorem no longer depends on a manual profile or
  enumeration seam,
- the shell/action side determines the orbit profile theoremically,
- the signature theorem can be stated as a genuine cone-forcing result for the
  current finite 4D realization.

Remaining follow-on objective:

- generalize the theorem beyond the current finite realization framework.

### Stage C

Status: speculative.

Exit criterion:

- the minimum closure instance carries a real dynamics package,
- the signature theorem feeds that closure through theorem-level bridges,
- observable consequences, excluded alternatives, and forward prediction claims
  are exposed through one explicit package,
- the repo can distinguish proved claims, evidence-backed claims, and
  predictions without mixing them.

## Practical Implications by Stage

### A — Orbit invariant

- mathematical classification tool,
- geometric/signature inference from dynamics,
- possible new invariant for dynamical systems and optimization geometry.

### B — Cone -> signature forcing

- structural geometric theorem,
- causal-cone-first explanation of Lorentz signature,
- stronger classification of isotropic cone-preserving dynamics.

### C — Full closure

- minimal credible physics closure for the current 4D framework,
- theorem-backed dynamics plus an observable/prediction package,
- possible later bridge between dynamics, geometry, and algebra.

The intended reading discipline is:

- A is proved,
- B is solved for the current finite 4D realization,
- C is the open physics-closure program.
