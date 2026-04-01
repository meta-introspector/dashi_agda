# Abstract Gauge/Matter Bundle Scaffold

This note records the first implementation-facing abstraction layer for the
gauge/matter recovery program.

## Purpose

The existing gauge theorems in `DASHI/Physics/Closure` are already
package-parametric, but they still package only:

- a concrete carrier,
- a bracket/closure law,
- an admissibility predicate,
- and a chosen gauge label.

That is not yet enough for the `P0` recovery target. The missing abstraction is
an explicit bundle layer carrying:

- a dynamics law (`evolve`, `coarse`, `offset`);
- a cone-style admissibility witness;
- a gauge action on the carrier;
- a matter/observable projection;
- conserved quantities;
- and a continuum lift.

## Scaffold target

The new Agda scaffold should expose the following records:

1. `AbstractGaugeMatterBundle`
   - carrier, gauge fiber, matter field, observable, continuum field
   - dynamics maps and admissibility
   - gauge action plus observable projection
2. `ConservedObservableWitness`
   - charge extraction and preservation along evolve/coarse
   - gauge invariance of the observable layer
3. `ObservableTransportWitness`
   - an external target carrier
   - a transport from the abstract bundle carrier into that target
   - admissible-state soundness of observable transport
4. `GaugeMatterRecoveryTheorem`
   - natural-dynamics witness
   - conserved-observable witness
   - continuum witness
   - observable-transport witness
   - transported projection/Δ witnesses
   - gauge recovery and observable agreement on admissible states

## First canonical instantiation

The first implementation step after the scaffold is intentionally narrow:

- instantiate the abstract bundle from the existing
  `CanonicalConstraintGaugePackage`;
- use identity `evolve` / `coarse` / `offset` maps as the smallest lawful
  dynamics carrier lift;
- use the current gauge label `pickGauge` as the first conserved observable;
- keep the matter and continuum fields minimal so the new layer can typecheck
  before stronger witnesses are threaded in from the RG/closure side.

This does not solve gauge/matter recovery. It only proves that the abstract
bundle surface is inhabited by the current canonical package and can carry a
first conserved-observable witness without collapsing back into shift-specific
code.

## First RG-facing strengthening

The next honest strengthening is still modest:

- keep the same canonical package carrier;
- keep the minimal identity dynamics;
- but lift the observable layer from a raw gauge label to a pair consisting of
  the gauge label and a transported `RGObservable`-typed payload from the real
  shift RG instance.

That keeps the new bundle connected to the RG theorem surface without making a
false claim that the canonical constraint carrier already computes the full
shift RG observable.

The exact first step is to use the observed value at the canonical shift witness
state as an anchor payload. That is a genuine import from the real RG surface,
but it is still weaker than a carrier-level transport theorem.

## Current landed strengthening

The scaffold is now stronger than the original identity-only inhabitant:

- a shared shift invariant core now lives in
  [`DASHI/Physics/Closure/ShiftExecutionInvariantCore.agda`](../DASHI/Physics/Closure/ShiftExecutionInvariantCore.agda),
  exposing the canonical shift Hecke/signature/eigen computation below both
  the execution and RG layers;
- the shift execution contract in
  [`DASHI/Geometry/ShiftLorentzEmergenceInstance.agda`](../DASHI/Geometry/ShiftLorentzEmergenceInstance.agda)
  now uses that core to derive a nontrivial canonical eigen profile on the
  `(1,3)` carrier instead of a constant zero eigen witness;
- the abstract bundle now carries a `SignatureLockWitness`, and the canonical
  inhabitant attaches a `sig31`-locked witness there while also replacing the
  earlier all-true/zero RG payload with the canonical shift signature/eigen
  payload from the shared core.

That strengthening has now been pushed one step further:

- the canonical bundle inhabitant no longer manufactures its `RGObservable`
  payload from a local zero/canonical constructor;
- instead, it imports the observed value of the live
  [`shiftRGSurface`](../DASHI/Physics/Closure/ShiftRGObservableInstance.agda)
  at
  [`canonicalShiftStateWitness`](../DASHI/Geometry/ShiftLorentzEmergenceInstance.agda).

That strengthening has now been pushed into a carrier-level theorem surface:

- the abstract bundle exposes an `ObservableTransportWitness`;
- the canonical inhabitant uses that surface to transport every bundle carrier
  point into an external target carrier for the live shift RG observable;
- soundness is stated on admissible states, which is the right boundary for the
  current gauge-recovery theorem.

The first inhabitant is still conservative, but it is no longer either
constant or merely representative-sensitive:

- it factors through the concrete three-generator canonical carrier;
- it chooses among three shift-side representatives based on the source
  generator;
- the bundle observable layer now follows the transported shift state itself,
  so the three source generators can carry genuinely different
  `RGObservable`-typed payloads.

So the repo now has an observable-sensitive carrier-level transport law.

That weakness has also been reduced one step:

- the canonical bundle no longer uses identity `evolve/coarse/offset` maps;
- it now carries a concrete non-identity carrier dynamics law derived from the
  canonical closure package itself:
  `x ↦ [ CR , x ]`;
- on the concrete three-generator carrier this means `CR -> CR` and
  `CP <-> CC`, so the first nontrivial bundle dynamics is now closure-derived
  rather than hand-chosen;
- the conserved quantity has now been strengthened again:
  the canonical inhabitant conserves not only the gauge label but the quintuple
  `Gauge × basinLabel × mdlLevel × motifClass × eigenShadow`, where
  `eigenShadow = (earth , hub)` is a closure-honest quotient of the
  transported `eigenSummary`;
- the repo now also carries an explicit obstruction theorem on the canonical
  carrier: raw `eigenSummary` itself is not preserved by the current
  closure-derived law because the `CP` branch moves to a state with a different
  eigen profile;
- an honest probe to widen that conserved charge with `heckeSignature`
  fails on the concrete `CP` branch under the current closure-derived law, so
  the remaining transported RG channels (`heckeSignature` and raw
  `eigenSummary`) stay on the observable side rather than the
  conserved-charge side;
- that failure also lowers the value of adding more canonical transported phase
  families right now: the sharper next seam is either a less canonical target
  family or a stronger dynamics law, not another canonical phase variant.

This is still not a full physical dynamics theorem, but it is now tied to the
actual closure/recovery stack rather than a synthetic carrier permutation.

The current canonical inhabitant is now slightly less nominal on the invariant
side as well:

- `mdlLevel` is no longer the old constant-zero placeholder;
- it now reads the `mdlLevel` field off the live transported
  `RGObservable` imported from `shiftRGSurface`;
- the cone witness remains trivial at this layer because the current
  closure-derived dynamics still lacks a shift-side cone preservation theorem,
  and a shift-derived cone witness
  would need an actual dynamics-preservation lemma rather than a placeholder.

The continuum side has also been strengthened:

- the abstract `ContinuumWitness` no longer carries only a bare
  `limitObservable`;
- it now exposes an explicit limit carrier, a scaling map into that carrier,
  a projected limit-side observable, a limit-side cone witness, a limit-side
  MDL readout, and a carrier-side scaling map preserved by the current bundle
  dynamics;
- the canonical inhabitant now proves compatibility against that stronger
  projected surface using the closure-honest observable
  `Gauge × basinLabel × mdlLevel × motifClass × eigenShadow`;
- so the current canonical limit carrier is no longer the whole transported
  `RGObservable`, but also no longer merely the finite bundle object rewrapped:
  it is the first projected continuum target that the closure-derived law
  actually preserves on all three canonical generators.

The realization-independent offset story is also now connected back into this
bundle layer:

- `GaugeMatterRecoveryTheorem` can now be exported as an
  `ObservableRGOffsetUniversality` witness;
- the canonical bundle instance exposes that converted offset witness directly,
  rather than leaving offset universality only on the separate RG layer.

The same is now true for the projection/Δ lane:

- `NaturalDynamicsWitness` now states offset admissibility and
  cone-preservation explicitly, which is the missing condition needed to lift
  projection/Δ compatibility above the shift-only layer;
- `AbstractGaugeMatterBundle.agda` now exports
  `toProjectionDeltaCompatibility`, deriving a
  `ProjectionDeltaCompatibility` witness directly from a
  `GaugeMatterRecoveryTheorem`;
- the canonical bundle instance now exposes that converted projection/Δ
  witness, so the abstraction is no longer only inhabited by
  `shiftProjectionDeltaCompatibility`.

That bundle-side projection/Δ story is now slightly less nominal on the
observable side as well:

- the canonical bundle instance now also exposes a second projection/Δ witness
  whose observable carrier is the transported live `RGObservable` itself,
  rather than the full bundle observable with equality;
- that witness uses the live shift RG observable quotient
  (`Observable≈` from `shiftRGWitnessPackage`) instead of plain equality, so
  the abstraction now reuses the same quotient notion already carried by the
  shift RG lane.

The carrier/dynamics side has now also moved one step:

- the canonical bundle instance now exposes a transport-attached
  projection/Δ witness on the live shift carrier itself;
- this witness uses the actual shift-side projection schedules
  (`shiftCoarse ∘ step` and `shiftCoarseAlt`) and the live shift cone
  transport lemmas, while packaging the observed result through the canonical
  transport observable.

So the bundle layer no longer speaks only through bundle-side rebuilt schedules;
it now also exports a target-side live carrier witness attached through the
observable transport.

That target-side story is no longer only a one-off canonical constant:

- `AbstractGaugeMatterBundle.agda` now defines
  `TransportedProjectionDeltaWitness`, a reusable record tying:
  - an existing `ObservableTransportWitness`,
  - target-side admissibility,
  - target-side projection schedules,
  - target-side cone transport,
  - and target-side projection/Δ universality
  into one theorem surface;
- the module also exports `toTransportedProjectionDeltaCompatibility`, so such
  a witness can be converted directly into a
  `ProjectionDeltaCompatibility` record on the transported carrier;
- the canonical shift-target witness now inhabits that reusable surface.

That reusable transported surface now has more than one live-shift inhabitant:

- one for the base phase pair
  (`shiftCoarse ∘ step`, `shiftCoarseAlt`);
- one for the alternate phase pair
  (`shiftCoarseAlt ∘ step`, `step ∘ shiftCoarseAlt`).

That theorem surface is no longer merely adjacent to the recovery theorem:

- `GaugeMatterRecoveryTheorem` now carries a
  `transportedProjectionDelta` field directly;
- it now also carries a second
  `transportedProjectionDeltaAlt` field for a distinct target-side schedule
  family on the same transported carrier;
- `AbstractGaugeMatterBundle.agda` now exports a corresponding
  `toRecoveryTransportedProjectionDeltaCompatibility` conversion, plus an
  alternate `toRecoveryTransportedProjectionDeltaCompatibilityAlt`;
- so transported projection/Δ compatibility is now part of the same abstract
  proof mass as natural dynamics, conserved observables, continuum witness,
  signature lock, and observable transport, rather than a parallel export.

Current remaining boundary:

- the recovery theorem now requires transported projection/Δ witnesses, but
  the canonical inhabitant still supplies them only from the current live
  shift target families;
- the next real promotion step is therefore not more wiring but a less
  canonical inhabitant of that same field.

So the target-side bundle export is no longer represented by only one canonical
transport/schedule choice.

## Exact claim boundary

This scaffold does not prove:

- Yang-Mills dynamics,
- confinement,
- a continuum limit,
- or full matter/gauge recovery.

It only creates the abstract carrier-level theorem surface needed so the
current canonical shift proofs can later be lifted into a realization-
independent gauge/matter program.

This also explains why we cannot hand off a physics claim yet: the canonical
closure law now has only a minimal transported schedule surface bridge into the
live shift RG lane (`CanonicalClosureShiftScheduleBridge.agda`). That bridge
has now been strengthened once: `Gauge × basinLabel × motifClass` does match
the schedule side canonically, but the larger projected charge
`Gauge × basinLabel × mdlLevel × motifClass × eigenShadow` is still obstructed
on `CP`, as are raw `heckeSignature` and raw `eigenSummary`. Those facts are
recorded in the TODO/checklist entries mentioned above and the most recent
CHANGELOG entries, and they define the safe reporter boundary: we can explain
the representation-layer Hecke/FRACTRAN stack, the inequality ladder, and a
motif-level closure→schedule bridge, but not a new conserved-physics headline
until a stronger transported observable exists.

## Stronger meaning of closure

For this repo, "closure" now needs a stricter meaning than "the code compiles"
or "a toy bridge exists on one carrier".

A physics-closure target is only met when the stack stops being a set of
adjacent theorem surfaces and becomes one law with internal projections:

- one carrier of physical states rather than separate closure, shift/RG, and
  Hecke carriers joined only by partial bridges;
- one admissible dynamics law rather than closure dynamics on one side and
  schedule/RG structure beside it;
- one observable package whose descending part is physical and whose
  non-descending part is reinterpreted lawfully as gauge/fibre/defect data;
- one RG/coarse-graining story compatible with the same law;
- explicit obstruction theorems for channels that do not descend.

That sharper definition matches the current canonical theorem state:

- the maximal closure→schedule bridge currently landed on the canonical
  carrier is the quotient `Gauge × basinLabel × motifClass`;
- the stronger bridge package
  `Gauge × basinLabel × mdlLevel × motifClass × eigenShadow`
  still fails on `CP` at the closure→schedule seam;
- raw `heckeSignature` and raw `eigenSummary` remain non-descending channels.

So the correct next target is not another ad hoc bridge. It is to identify the
maximal closure-invariant observable package explicitly and then classify the
remaining channels as either:

- physical observables that descend canonically,
- lawful defect/gauge/fibre structure,
- or representation-layer scaffolding that is not yet part of the physical
  quotient.

## Current observable split

The current canonical theorem state is now strong enough to state the split
explicitly.

### 1. Base physical quotient

The strongest currently bridged canonical package is:

- `Gauge × basinLabel × motifClass`

This is the maximal currently proved closure-invariant observable package on
the canonical carrier. It is the coarsest point at which the closure law and
the schedule side are already identified by theorem, rather than by analogy.

### 2. Fibre/defect structure over that quotient

The next layer is not "failed physics". It is structured internal data that
does not descend through the current closure quotient:

- bridge-level `mdlLevel`
- bridge-level `eigenShadow`
- raw `eigenSummary`
- raw `heckeSignature`

These channels are still lawful and informative, but they vary inside the
coarse closure classes. So they should currently be read as fibre, gauge, or
defect data over the quotient `Gauge × basinLabel × motifClass`, not as base
closure observables.

### 3. Representation scaffolding

Some objects remain construction or diagnostic surfaces rather than physical
observables:

- raw `FactorVec` / prime-address encodings
- support-mask style carriers
- synthetic transport helpers
- intermediate correspondence packaging used to expose defect structure

These are still useful, but they are not yet part of the maximal physical
quotient unless a later theorem promotes them.
