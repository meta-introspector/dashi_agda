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

This remains well short of any “solved physics” claim.

## P1 Theorem-Seam Requirement

For the shell-action theorem seam, the implementation target is:

- the theorem-critical intrinsic shell/orbit path must no longer mention
  finite carrier points, finite action lists, shell predicates, or finite
  realization records,
- those finite realization artifacts may remain on the shift-instance discharge
  side as validation support only.
