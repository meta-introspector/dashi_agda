# Dynamics/Invariants Gap Checklist

This note is the repo-accurate version of the remaining proof mass on the
physics side. The right statement is not “the repo is missing these structures
from zero.” The right statement is:

> the repo already has many of these structures as local, canonical, or weak
> witnesses, but they have not yet been promoted into nontrivial,
> realization-independent theorems.

## 1. Execution Contract

Already present:

- [`ExecutionContract.agda`](../DASHI/Physics/Closure/ExecutionContract.agda)
  already bundles:
  - arrow admissibility,
  - cone admissibility on projected delta,
  - MDL descent,
  - basin admissibility,
  - eigen admissibility.
- The shift instance in
  [`ShiftLorentzEmergenceInstance.agda`](../DASHI/Geometry/ShiftLorentzEmergenceInstance.agda)
  already supplies a concrete `shiftExecutionAdmissible` witness.

Real gap:

- the current shift witness is still partially trivialized:
  - `ShiftArrow _ = zero`
  - `ShiftQ _ = zero`
  - `ShiftEigenOf _ = zero`
- the basin witness is only genuinely nontrivial on the canonical `(1,3)`
  carrier.

Promotion target:

- replace those trivial witnesses with nontrivial quantities,
- then lift the shift contract into the abstract bundle layer without baking
  it back into the shift carrier.

Current status:

- partially landed.
- a shared shift invariant core now computes the canonical shift
  signature/eigen profile below both the execution and RG layers.
- the shift execution contract now uses that core for the canonical `(1,3)`
  carrier instead of a constant zero eigen witness.
- the live shift RG surface has now been revalidated and the abstract
  gauge/matter bundle imports its observed value at
  `canonicalShiftStateWitness`.
- the abstract bundle now also has a carrier-level
  `ObservableTransportWitness`, with a first admissible-state-sound canonical
  inhabitant into the live shift RG surface.
- that canonical transport now factors through the three concrete canonical
  generators and the bundle observable follows the transported shift state, so
  the transport is sensitive at the `RGObservable` level.
- the canonical bundle now also carries a first non-identity dynamics law on
  the carrier, and that law is now derived from the canonical closure package
  itself via `x ↦ [ CR , x ]` rather than a synthetic three-cycle.
- the canonical conserved witness is no longer gauge-only:
  it now carries `Gauge × mdlLevel × motifClass`, showing that part of the
  transported live RG observable is genuinely stable under the closure-derived
  carrier law.
- attempted widening to `eigenSummary` already fails on the concrete `CP`
  branch, so the current conserved witness boundary is real rather than
  artificially conservative.
- after rechecking the canonical instance against the live shift witness
  package, the next eigen-side widening blocker is now precise:
  there is still no theorem connecting the canonical closure-derived carrier
  law `x ↦ [ CR , x ]` to the shift-side `shiftCoarse/step` schedule on which
  `shiftEigenSchedule` is proved.
- the minimal transported schedule surface is now packaged explicitly in
  [`CanonicalClosureShiftScheduleBridge.agda`](../DASHI/Physics/Closure/CanonicalClosureShiftScheduleBridge.agda):
  for transported canonical closure states, the two shift schedule branches
  already agree at the transported observable surface whenever shift-side
  admissibility is supplied.
- the same module also records the sharper blocker:
  a stronger bridge shape that simultaneously identifies closure dynamics with
  a schedule-side state and then identifies that schedule-side raw eigen
  channel back with the source is inconsistent on the canonical `CP` branch.
- the remaining gap is to strengthen that closure-derived law into one that is
  tied not only to the abstract bracket but also to the live transported RG
  and cone structure, so the nontrivial dynamics and nontrivial invariants are
  carried by the same theorem surface.

## 2. Projection/Δ Compatibility

Already present:

- the execution contract evaluates cone admissibility on projected deltas
  rather than on absolute states.
- the repo already contains projection/defect and quadratic-emergence
  machinery under [`DASHI/Geometry`](../DASHI/Geometry).

Real gap:

- there is still no realization-independent theorem stating that projected
  delta structure is the right invariant carrier across admissible schedules.

Promotion target:

- state and prove an abstract projection/Δ compatibility theorem above the
  current shift-specific admissibility surface.

Current status:

- partially landed.
- [`RGObservableInvariance.agda`](../DASHI/Physics/Closure/RGObservableInvariance.agda)
  now defines an explicit `ProjectionDeltaCompatibility` record above the
  existing RG universality shells.
- [`ShiftRGObservableInstance.agda`](../DASHI/Physics/Closure/ShiftRGObservableInstance.agda)
  now instantiates that surface as `shiftProjectionDeltaCompatibility`, using
  the live `shiftCoarse` / `shiftCoarseAlt` schedules, the shift cone witness,
  and the existing schedule-equality lemmas.
- [`AbstractGaugeMatterBundle.agda`](../DASHI/Physics/Closure/AbstractGaugeMatterBundle.agda)
  now exports `toProjectionDeltaCompatibility`, and the canonical bundle
  instance exposes `canonicalBundleProjectionDeltaCompatibility`.
- the same abstract bundle layer now also makes transported projection/Δ
  compatibility part of `GaugeMatterRecoveryTheorem` itself, rather than
  leaving it as only a side export;
- the recovery theorem now carries both the base and alternate transported
  target-side schedule families, not just one.
- the remaining gap is now to make that bundle-level witness less canonical and
  more realization-sensitive, rather than merely lifting it out of the shift RG
  layer.

## 3. Lorentz Signature Uniqueness

Already present:

- strong local signature-lock and uniqueness machinery already exists, e.g.:
  - [`Signature31Lock.agda`](../DASHI/Geometry/Signature31Lock.agda)
  - [`SignatureUniqueness31.agda`](../DASHI/Geometry/SignatureUniqueness31.agda)
  - [`ShiftLorentzEmergenceInstance.agda`](../DASHI/Geometry/ShiftLorentzEmergenceInstance.agda)

Real gap:

- those results are still strongest on the canonical shift route; they are not
  yet carried by the new abstract gauge/matter bundle surface.

Promotion target:

- connect the existing signature-lock stack to the abstract bundle layer so
  `(3,1)` is not just a strong local result but part of the broader recovery
  story.

Current status:

- partially landed.
- the abstract bundle layer now has an explicit `SignatureLockWitness`, and
  the canonical inhabitant carries a `sig31`-locked witness there.
- the remaining gap is to replace the constant canonical witness with a more
  realization-sensitive transport out of the live closure stack.

## 4. Basin Preservation

Already present:

- basin preservation already appears in the execution/admissibility surface and
  in the shift witness package.
- the RG lane also transports basin witnesses through `step` and `shiftCoarse`
  in
  [`ShiftRGObservableInstance.agda`](../DASHI/Physics/Closure/ShiftRGObservableInstance.agda).

Real gap:

- basin preservation is still too tied to the canonical shift basin and its
  coarse-head predicate.

Promotion target:

- generalize basin preservation beyond the current canonical carrier/predicate
  so it can serve as a genuine theorem obligation, not only a local witness.

## 5. Eigen/Hecke Compatibility

Already present:

- the RG observable layer already has real finite Hecke/signature/eigen/motif
  structure in
  [`ShiftRGObservableInstance.agda`](../DASHI/Physics/Closure/ShiftRGObservableInstance.agda).

Real gap:

- the lower execution contract still uses a trivial eigen witness on the shift
  side away from the canonical `(1,3)` route, so execution and spectral
  structure are still not tied together by a nontrivial realization-
  independent theorem;
- on the canonical abstract bundle, `motifClass` is now stable under the
  closure-derived law, but `heckeSignature` and `eigenSummary` are not yet
  preserved at that level.
- an explicit canonical widening attempt with `heckeSignature` now also fails
  on the concrete `CP` branch, so the next honest widening target is no longer
  “try the raw Hecke channel again” but either:
  - a coarser quotient derived from the RG spectral data, or
  - a stronger/noncanonical dynamics-target family pairing.
- the archived `Dashi and Physics Insights` thread now sharpens the same
  boundary from the representation side: Hecke/FRACTRAN belong first on the
  prime-lattice representation layer, not on the transported conserved-witness
  layer. See [`HeckeRepresentationLayer.md`](./HeckeRepresentationLayer.md).

Promotion target:

- generalize the now-live canonical anchor import into an execution/eigen
  transport theorem derived from the actual RG observable pipeline and carried
  by the abstract gauge/matter bundle.

## Priority order

The best order is:

1. nontrivial execution/eigen bridge,
2. realization-independent execution contract,
3. signature-lock promotion into the abstract bundle layer.

That order matches the actual repo bottleneck: binding dynamics to invariants,
not inventing new theorem families from scratch.
