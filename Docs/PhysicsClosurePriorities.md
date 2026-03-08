# Physics Closure Priorities

## P0 — Validation and Closure Hardening

This is the current highest-priority phase.

Goals:

- keep the minimum-credible closure path authoritative,
- run the first substantive profile-rigidity benchmark,
- stop treating negative controls as if they were candidate alternate
  realizations.

Concrete tasks:

- define the admissible comparison realization interface,
- keep the tail-permutation case as a negative control,
- add one genuinely closure-compatible second realization,
- surface the first admissible result explicitly:
  Bool inversion on the 4D `(3,1)` mask is expected to be a
  `signatureOnlyMatch`,
- run the profile-rigidity harness and classify the outcome,
- keep downstream closure consumers attached to the real dynamics package.

Exit criteria:

- one non-reference realization is classified by the harness,
- the result is recorded as exact match, signature-only match, or mismatch,
- the closure path still compiles through the minimum-credible adapter.

Current snapshot:

- reference signed-permutation self-check: `exactMatch`
- Bool inversion admissible candidate: `signatureOnlyMatch`
- tail-permutation negative control: `mismatch`

Immediate next step after this snapshot:

- surface the same three outcomes through a repo-facing closure summary
  entrypoint so they are easy to cite without walking the validation modules
  directly.
- start the Fejér-over-χ² benchmark as a typed reference harness with:
  theorem-backed Fejér / closest-point / MDL witnesses,
  and an explicit χ² falsifier-status field.
- make the next mathematically serious alternate realization a Coxeter/Weyl
  one:
  first an independent `B₄` shell/profile report,
  then orientation/signature refinement,
  then harness promotion.
- next algebraic handle:
  add a finite orbit-shell generating series for the theorem-backed shift
  profile, then compare `B₄` at the series level before attempting any
  admissible promotion.
- current theorem object:
  use the bounded one-minus shell family plus the landed parametric `m`
  shell-1 theorem as the baseline shell-neighborhood story, then move to
  shell-2 / orientation follow-through or a second Lorentz-family
  realization.
- immediate theorem/benchmark sub-goals:
  finish the arithmetic lemma layer for the full parametric shell-1 theorem,
  formalize the χ²-boundary witness on the shift reference,
  and add a typed snap-threshold benchmark from the concrete severity policy.
- current closure hardening object:
  keep the canonical Stage C path on concrete constraint closure and real shift
  dynamics, and remove the remaining trivial closure shim from the empirical
  full adapter, while exposing an explicit canonical Stage C entrypoint/status
  surface in code so repo-facing consumers stop drifting back to compatibility
  modules.
- next dynamics-hardening object:
  make the canonical shift dynamics package expose a structured status surface
  for propagation, causal admissibility, monotone quantity, and effective
  geometry.

## P1 — Runnable Forward Benchmarks

Once P0 is complete, the next priority is turning the other forward claims into
typed runnable checks.

Ordered targets:

1. Fejér-over-χ² monotonicity
2. observable-space collapse
3. snap-threshold transition law

Each benchmark should expose:

- a typed report,
- a falsifier,
- a reference harness or dataset,
- an explicit distinction between proved outputs and measured outcomes.

Immediate first implementation:

- the shift realization acts as the reference harness,
- the positive side is theorem-backed already and should be carried directly by
  the benchmark report,
- the χ² side is allowed to progress through intermediate states:
  pending,
  interface-wired,
  formalized.
- observable-space collapse is the next benchmark that can be made fully
  theorem-backed from existing shift witnesses, because the real closure kit
  already carries `obsFixed` and `obsUnique`.
- the next benchmark hardening step is:
  use the landed concrete χ²-boundary witness and standalone snap-threshold
  report as the new baseline, then decide whether to promote the χ² side into
  a broader falsifier theorem or explicit counterexample library.
- immediate next validation refinement:
  grow the single shift χ²-boundary witness into an explicit small witness
  library so the Fejér benchmark has a real counterexample surface rather
  than one privileged state.
- immediate next realization-search step:
  add an independent shell-side one-minus-family candidate in the Lorentz
  neighborhood, but keep it outside the admissible harness until shell-2,
  orientation, and signature are justified independently.
- current realization-search refinement:
  the synthetic one-minus candidate is now profile-aware on shell-1 and
  shell-2, and the next search-side artifact is a prototype-only dynamic
  candidate scaffold rather than premature admissible-harness promotion.
- immediate promotion-side task:
  add a typed synthetic-promotion bridge that records whether orientation and
  signature are independently justified, then only promote to the admissible
  harness if both become available.

Current second-realization preference:

- Bool inversion remains the first admissible alternate realization,
- the next mathematically preferred one is Coxeter/Weyl-based rather than
  another bespoke contraction flow.
- that Coxeter/Weyl path should enter in two steps:
  independent shell/profile report first, admissible harness later.
- but it is no longer the immediate next theorem milestone.
  First priority is:
  shell-neighborhood class -> parametric one-minus family theorem ->
  second Lorentz-family realization.

Canonical note for this framing:

- `Docs/OrbitShellProfilesAndLorentzSignature.md`

## P2 — Stronger Dynamics and Physics Closure

Only after P0 and P1 should the repo push further into broader physics-closure
claims.

Priority tasks:

- strengthen the dynamics package with clearer propagation and conservation
  statements,
- harden spin/Dirac, gauge, and constraint consumers against the minimum
  closure boundary,
- start scoped known-limits recovery work,
- expand prediction work beyond internal closure observables.

Immediate precondition:

- finish the current closure burn-down so the canonical Stage C path is free of
  trivial closure shims, while legacy assumption-backed modules remain clearly
  marked as compatibility surfaces.

This remains well short of any “solved physics” claim.

## P1 Theorem-Seam Requirement

For the shell-action theorem seam, the implementation target is:

- the theorem-critical intrinsic shell/orbit path must no longer mention
  finite carrier points, finite action lists, shell predicates, or finite
  realization records,
- those finite realization artifacts may remain on the shift-instance discharge
  side as validation support only.
