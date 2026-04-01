# Conserved Quantity Lane

## Scope
This lane documents the most promising conserved quantities that are already visible in the Dashi closure program, highlights what is formalized versus what remains to be defined, and frames a theorem-style note describing the minimal failures should those quantities not be preserved. No shared files are touched; everything lives under `Docs/`.

## Candidate conserved quantities
- **MDL descent as quasi-conservation.** The execution contract makes `L(x)` a Lyapunov function: each step satisfies `L(step x) ≤ L(x)`. Formally we can treat `ΔL := L(x) - L(step x)` as the “energy dissipated” per step, and the conservation candidate is the cumulative `L0 - L(x)` reaching a plateau whenever the coarse descent terminates. Already formalized: `shiftExecutionAdmissible` uses `OldMDL.Lyapunov.descent` and `RGCoarseWitnessPackage.signatures` preserve `mdlLevel`. Missing: a precise statement that `(L0 - L(x))` is conserved across coarse schedules and how deviations signal failure modes.
- **Cone membership as invariant charge.** The cone witness `ShiftConeCompatible x` represents a binary statement that the state stays within the Lorentz cone. Its candidate conserved quantity is the indicator `1_{InCone}`. Formalized: `shiftConeTransportStep/Coarse` prove that the witness is preserved under allowed schedules. Missing: a scalar charge (e.g., cone depth) and a theorem that `Δcone` equals zero unless a failure mode (e.g., crossing the boundary) occurs.
- **Gödel/Hecke signature counts.** The flattening to `Sig15` and eigen profiles yields a finite set of bits. The conserved quantity is the signature histogram (counts of primes flagged as `true`). Formalized: `shiftPipeline` extracts `shiftPrimeEmbedding` and the RG surface preserves `heckeSignature`. Missing: a proof that these counts are invariant up to MDL or coarse updates and explicit failure modes when they are not.
  Current boundary correction: after the archived `Dashi and Physics Insights`
  thread and the failed canonical widening probe, raw `heckeSignature` should
  now be treated first as representation-layer structure rather than as the
  next default conserved-witness candidate. See
  [`HeckeRepresentationLayer.md`](./HeckeRepresentationLayer.md).

- **Eigen-profile payload.** The RG layer already computes
  `RGOI.RGObservable.eigenSummary`, and the live shift witness package proves
  `shiftEigenSchedule` on the shift carrier. Missing: a bridge from the
  canonical closure-derived carrier law in
  [`CanonicalAbstractGaugeMatterInstance.agda`](../DASHI/Physics/Closure/CanonicalAbstractGaugeMatterInstance.agda)
  into that shift-side schedule. The current blocker is not a missing rewrite:
  the canonical law `x ↦ [ CR , x ]` lives on the three-point canonical
  carrier, while the available eigen schedule is proved only for
  `shiftCoarse/step` on the transported shift carrier. Until that bridge
  exists, `eigenSummary` is not an honest next conserved witness.

## Current classification boundary

The current closure results now support an explicit three-way split.

### Descending physical observables

These are the channels currently known to survive the closure quotient and
bridge canonically to the schedule side on the canonical carrier:

- `Gauge`
- `basinLabel`
- `motifClass`
- and the products/subquotients they generate

The strongest currently bridged package is therefore:

- `Gauge × basinLabel × motifClass`

### Structured fibre/defect data

These channels are theorem-bearing and informative, but they are not conserved
base observables of the current closure law:

- bridge-level `mdlLevel`
- bridge-level `eigenShadow`
- raw `eigenSummary`
- raw `heckeSignature`

The current best reading is that they live as internal fibre or defect data
over the coarse quotient, not as the next conserved package.

### Scaffolding and diagnostics

These objects remain construction or diagnosis surfaces until a stronger
descent theorem promotes them:

- raw prime-address carriers
- support-style quotient probes
- synthetic transport wrappers
- correspondence/defect packaging used to expose obstruction structure

## Theorem-style formulation
Let `Q(x)` denote one of the candidate scalars above. For the conserved quantity to hold across the closure, state:

> **Conservation Clause:** For any admissible execution/coarse step pair `(evolve, coarse)` and any state `x` satisfying `admissible x`, `Q(coarse(evolve x)) = Q(evolve(coarse x))`.  
> **Failure modes:** If the equality fails, then either (a) `x` left the Shannon basin `ShiftInBasin`, (b) the cone witness is violated, or (c) the observable signature changed, each of which can be detected via the respective witness records already tracked in `shiftRGWitnessPackage`.

## Missing links
- Need a scalar lifting for each candidate (e.g., `L` difference, cone depth, prime counts) with a formal `DeltaQ = 0` definition.
- Need explicit failure categories (e.g., `Δcone > 0` triggers Lorentz lock failure) with code references to where they should be asserted.
- Need a note tying these charges to MDL/observable universality theorems so the control law can raise alarms rather than silently discard them.
- Need a canonical closure-to-shift schedule bridge before any eigen-profile
  conserved-quantity widening can be proved honestly.

## Goal of this lane
Produce a documentation artifact that future proofs can cite when they refer to “conserved physical quantity” detection. When the conservation equality fails, the note should be the first reference for which witness or empirical variable to inspect before declaring system failure.
