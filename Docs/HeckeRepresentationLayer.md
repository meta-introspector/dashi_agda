# Hecke, FRACTRAN, and the Representation Layer

## Scope

This note records the current repo-accurate boundary for Hecke/FRACTRAN-style
structure after the archived `Dashi and Physics Insights` thread was pulled
into the local DB on 2026-03-31.

The key correction is simple:

> Hecke/FRACTRAN belong first on the prime-lattice representation layer, not
> on the transported conserved-witness layer of the contractive dynamics.

This does not demote the Hecke lane. It places it on the right side of the
stack.

## The split

The current codebase already has two different kinds of structure:

- a representation layer:
  prime exponent vectors, SSP/Hecke scans, finite factor vectors, lattice
  coordinates, orbit/shell statistics;
- a contractive dynamics layer:
  admissible execution, projected-delta cone screens, MDL descent, basin
  preservation, coarse observables.

The archive makes the non-commutation explicit:

> the lattice/orbit side and the contractive-dynamics side are both real, but
> they are not yet the same conserved structure.

That is exactly what the recent canonical widening failures already showed in
the repo:

- `motifClass` is stable under the current closure-derived carrier law;
- raw `heckeSignature` is not;
- full `eigenSummary` is not.

## Why raw Hecke fails as a conserved charge

The failed widening attempt in the canonical abstract gauge/matter bundle is
not a nuisance. It is the correct mathematical signal.

The current closure-derived dynamics law is contractive and quotient-facing.
It is built to preserve admissibility, projected-delta cone structure, and a
small stable observable payload. A raw Hecke signature is finer-grained than
that payload.

So the honest statement is:

> a Hecke signature is currently a representation-layer diagnostic, not a
> proved conserved quantity of the contractive closure law.

Trying to force it into the conserved witness too early confuses:

- address/representation structure,
- with dynamics/invariance structure.

The obstruction is concrete on the canonical carrier. The bracket law
`x ↦ [CR , x]` sends `CP` to `CC` (see
`DASHI/Physics/Closure/CanonicalAbstractGaugeMatterInstance.agda` for the
carrier definitions), yet the Hecke signature reads its `b3` bit from the
`space1` coordinate of the shift geometry. `CP` is encoded with `space1=1`
while `CC` walks to `space1=0`, and the `p3` compatibility bit
(`DASHI/Physics/Closure/ShiftRGObservableInstance.agda` `shiftCompat p3`)
turns from `false` to `true` across that flow. The `b3` entry of
`HS.Sig15` therefore flips and the raw `heckeSignature` cannot stay equal.

## Where Hecke and FRACTRAN do belong

The archived thread sharpens the right placement.

### Hecke

Hecke belongs on a structured family of states or functions over a symmetry
domain:

- prime exponent lattice,
- quotient/orbit family,
- modular or transport-averaging correspondence,
- eigenstructure on that family.

In that role, a Hecke operator is closer to structured averaging over
admissible transport channels than to a literal conserved scalar attached to a
single contracting trajectory.

### FRACTRAN

FRACTRAN belongs with the same address language:

- prime-exponent updates,
- divisibility flow,
- p-adic/ultrametric addressing,
- multiplicative lattice coordinates.

So the current safe bridge is:

> FRACTRAN and Hecke are both natural on the prime-lattice representation
> layer.

That is the layer where Dashi and DuPont look closest.

## Dashi and DuPont

The strongest archived phrasing is worth preserving conceptually:

> Dashi and DuPont are equivalent at the state-address level, but not yet at
> the conserved-dynamics level.

Repo-facing interpretation:

- state-address level:
  prime vectors, SSP coordinates, factor embeddings, orbit/address grammar;
- conserved-dynamics level:
  what the closure-derived law actually preserves under admissible execution
  and coarse schedules.

That second layer remains narrower.

## Consequences for the current roadmap

This note changes the priority order in one narrow but important way.

Do not spend the next proof effort on:

- another direct raw-Hecke lift into the canonical conserved witness.

Do spend effort on:

- stronger/noncanonical dynamics-target pairings;
- a coarser quotient derived from the RG spectral data if one is genuinely
  stable;
- a representation-layer theorem surface for Hecke/FRACTRAN on prime-lattice
  objects;
- transport theorems only after the representation layer and the contractive
  layer are related by a real bridge.

The first local step of that representation-layer work is now landed in:

- [`ReverseHeckeRepresentation.md`](./ReverseHeckeRepresentation.md)
- [`Ontology/Hecke/ReverseRepresentation.agda`](../Ontology/Hecke/ReverseRepresentation.agda)

The second local step is now also landed:

- [`HeckeQuotientRepresentation.md`](./HeckeQuotientRepresentation.md)
- [`Ontology/Hecke/QuotientRepresentation.agda`](../Ontology/Hecke/QuotientRepresentation.agda)

The third local step is now also landed:

- [`HeckeCorrespondenceRepresentation.md`](./HeckeCorrespondenceRepresentation.md)
- [`Ontology/Hecke/CorrespondenceRepresentation.agda`](../Ontology/Hecke/CorrespondenceRepresentation.agda)
- [`Ontology/Hecke/FactorVecCorrespondence.agda`](../Ontology/Hecke/FactorVecCorrespondence.agda)

The fourth local step is now also landed:

- [`HeckeDefectCorrespondence.md`](./HeckeDefectCorrespondence.md)
- [`Ontology/Hecke/DefectCorrespondenceRepresentation.agda`](../Ontology/Hecke/DefectCorrespondenceRepresentation.agda)
- [`Ontology/Hecke/FactorVecDefectCorrespondence.agda`](../Ontology/Hecke/FactorVecDefectCorrespondence.agda)

The fifth local step is now also landed:

- [`HeckeDefectProfileCorrespondence.md`](./HeckeDefectProfileCorrespondence.md)
- [`HeckeChamberDefectCorrespondence.md`](./HeckeChamberDefectCorrespondence.md)
- [`Ontology/Hecke/FactorVecDefectProfileCorrespondence.agda`](../Ontology/Hecke/FactorVecDefectProfileCorrespondence.agda)
- [`Ontology/Hecke/FactorVecChamberDefectCorrespondence.agda`](../Ontology/Hecke/FactorVecChamberDefectCorrespondence.agda)

## Safe current claim

The strongest current claim the repo can support is:

> Hecke/FRACTRAN structure is real and important, but it is currently justified
> as representation-layer structure rather than as a conserved charge of the
> contractive closure dynamics.

## Full stack status

The current Hecke-side stack is now clearer than it was when this note started.
The repo has already moved beyond plain address and transport diagnostics.

### Layers already landed locally

- substrate:
  raw carriers such as `FactorVec`, prime coordinates, finite trace/state
  carriers;
- representation:
  address maps, prime-lattice coordinates, SSP-facing scans and embeddings;
- transport:
  positive, signed, and multi-lane transport families on the representation
  carrier;
- defect:
  reverse-Hecke discrepancy, scan-visible drift, and coarse defect classes;
- quotient:
  equality, support-mask, and quotient-facing Hecke surfaces, together with
  explicit no-go results for overly coarse signed-transport quotients;
- correspondence:
  finite sum-over-fiber Hecke operators on quotient classes, defect classes,
  and full defect profiles;
- exact chambers:
  legality-signature chambers for the current `PairMode` multi-lane transport
  family.

The first orbit-summary component is now constrained cleanly:

- the histogram-layer forced-stable / illegal count is a lower bound for the
  current orbit-summary `forcedStableCount` field;
- illegal entries are always Stable at the full defect-profile level, but not
  every Stable profile entry is forced by illegality.
- the bridge ladder is now packaged explicitly in
  `Ontology/Hecke/ForcedStableTransferBridge.agda`:
  exact-chamber illegal-count constancy,
  an abstract closure-to-shift transfer inequality,
  and the composed orbit-summary lower bound.
- the minimal fixed-prime witness-level bridge is now also landed in
  `Ontology/Hecke/ChamberToShiftWitnessBridge.agda`,
  where a closure-side illegal mask is compared only to a 15-entry
  forced-stable witness mask, with no larger state semantics attached.
- the closure-side profile feeding that bridge is now factored through
  `DASHI/Physics/Closure/PrimeCompatibilityProfile.agda`,
  so closure-native compatibility data can be turned into a prime embedding,
  illegal mask, and witness bridge without rewriting that construction.
- broader families that currently only expose a transported `State -> FactorVec`
  image can now use
  `DASHI/Physics/Closure/TransportedPrimeCompatibilityProfile.agda`
  to recover the same witness-level bridge surface by forgetting multiplicity
  and keeping only lane presence.
- that transported route is now exercised concretely on the canonical carrier
  in
  `DASHI/Physics/Closure/CanonicalTransportedPrimeCompatibilityProfileInstance.agda`,
  where the resulting prime embedding agrees with the closure-native profile
  on `CR/CP/CC` and therefore inherits the same witness-level inequality.
- the first genuinely broader concrete carrier now uses the full shift geometry
  state space directly in
  `DASHI/Physics/Closure/ShiftGeoVPrimeCompatibilityProfileInstance.agda`,
  so the transported-profile route and the orbit-side forced-stable bridge are
  no longer confined to the tiny canonical `CR/CP/CC` carrier.
- a second broader concrete family now lifts the same surfaces to the full
  shift execution-contract state carrier in
  `DASHI/Physics/Closure/ShiftContractStatePrimeCompatibilityProfileInstance.agda`
  by composing
  `canonicalShiftHeckeState -> shiftPrimeEmbedding`.
- bundle-level closure carriers can now inherit the same profile through
  `DASHI/Physics/Closure/ObservableTransportPrimeCompatibilityProfile.agda`
  whenever they already export an `ObservableTransportWitness` and a target-side
  prime embedding.
- that bundle-level route is now exercised concretely on the canonical abstract
  gauge/matter bundle carrier in
  `DASHI/Physics/Closure/CanonicalObservableTransportPrimeCompatibilityProfileInstance.agda`,
  by composing the canonical bundle transport witness with
  `canonicalShiftHeckeState -> shiftPrimeEmbedding`.
- the first canonical instance of that smaller bridge is now landed in
  `DASHI/Physics/Closure/CanonicalChamberToShiftWitnessBridgeInstance.agda`,
  so the repo now has a concrete proof of
  `illegalCount-chamber <= forcedStableCount-hist`
  on the canonical closure carrier. Its mask is now computed from a
  closure-native compatibility profile for `CR/CP/CC`, with the transported
  shift image kept only as an audit equality.
- the first concrete inhabitant of that bridge surface is now landed for the
  canonical closure carrier in
  `DASHI/Physics/Closure/CanonicalForcedStableTransferBridgeInstance.agda`,
  using the existing map
  `canonicalTransportState -> canonicalShiftHeckeState -> shiftPrimeEmbedding`.
- the remaining concrete gap at this layer is now narrower: the
  `ObservableTransportWitness` lift is now exercised concretely, and the AGMB continuum lane now
  uses a projected continuum observable rather than demanding preservation of
  the full transported `RGObservable`. The canonical instance therefore
  compiles again with a closure-honest continuum target
  (`Gauge × basinLabel × mdlLevel × motifClass × eigenShadow`), where
  `eigenShadow = (earth , hub)` is the first nontrivial preserved quotient of
  `eigenSummary`; stronger continuum targets remain blocked because the
  current closure-derived law does not preserve the raw eigen lane on the
  `CP` branch, now explicitly witnessed by
  `canonicalEigenLevel-CP-obstructed`.

### Layers still open in the strong sense

- compressed chamber quotients that survive proof rather than intuition;
- orbit families and reachability classes above the current exact chambers;
- algebra on correspondences:
  composition, closure, commutators, or semigroup structure;
- weighted or measured correspondences rather than bare uniform finite sums;
- spectral structure for those operators:
  eigenfunctions, eigenvalues, decomposition;
- any proven bridge from this representation-layer Hecke stack into the
  contractive physics bundle.

### Current location in the stack

The clean status line is now:

```text
SUBSTRATE
  ↓
REPRESENTATION
  ↓
TRANSPORT
  ↓
DEFECT
  ↓
QUOTIENT
  ↓
CORRESPONDENCE
  ↓
EXACT CHAMBERS
  ↓
COMPRESSED CHAMBERS / ORBITS / ALGEBRA / MEASURE / SPECTRAL
```

So the repo is no longer "approaching" chambers from the outside. It already
has exact chamber structure. The open work is what survives after chamber data
is compressed or aggregated into stronger laws.

## Immediate next seam

The next honest theorem target is still not another abstract transport or
correspondence interface.

The first histogram step is now landed:

- defect histograms are extracted from the 15-entry defect correspondence
  fiber;
- chamber-stability is now proved for the forced-stable / illegal component of
  that histogram.

So the new next seam is narrower:

- full defect-histogram constancy is now known to fail on the exact legality
  signature alone;
- a first orbit-style summary layer above the full defect-profile
  correspondence is now landed locally, and its full summary is also already
  known not to be determined by legality-signature data alone;
- replace the first concrete but transported/reflexive bridge inhabitant with a
  real inhabitant of the smaller witness-level bridge that computes a
  closure-native illegal mask rather than re-reading it from the transported
  shift image; the first canonical witness inhabitant is now landed with a
  closure-native mask on the three-generator carrier;
- generalize that closure-native witness beyond the tiny canonical carrier to a
  less hand-tabulated closure family;
- then test whether full defect-profile correspondences collapse to chamber
  invariants or only to weaker orbit-style families.

That is the shortest route from "representation gadget" to a stronger law on
the Hecke-side geometry.

### Reporter-readiness check

The current repo state is still a representation-layer theorem stack, not a
complete physics law. A minimal transported closure→shift schedule surface is
now explicit in
`DASHI/Physics/Closure/CanonicalClosureShiftScheduleBridge.agda`, but a
stronger raw-eigen closure/schedule bridge shape is obstructed on `CP`, and
the first attempted bridge on the larger projected charge
`Gauge × basinLabel × mdlLevel × motifClass × eigenShadow` is also obstructed
on `CP`. What now does bridge canonically is the smaller projected observable
`Gauge × basinLabel × motifClass`, via the new
`closureMotifToSchedule` / `sourceMotifToSchedule` theorems in
`CanonicalClosureShiftScheduleBridge.agda`. Raw `heckeSignature` and raw
`eigenSummary` still fail on the `CP` branch (see
`DASHI/Physics/Closure/CanonicalAbstractGaugeMatterInstance.agda`), and the
closure bundle itself still only conserves the projected observable
`Gauge × basinLabel × mdlLevel × motifClass × eigenShadow`. So the reporter
boundary has moved slightly but not across the physics line: we now have a
real closure→schedule bridge on a nontrivial quotient, but not yet a unified
transported physical observable. The safe external story remains
math/formal-methods: the representation layer, the contractive bundle, the
forced-stable inequality ladder, and now a canonical motif-level
closure→schedule bridge are all real; a physics-discovery claim is still
premature.

### Closure target, stated strictly

The current repo state also sharpens what "physics closure" must eventually
mean here. It is not enough that isolated bridges compile or that one toy
carrier supports a quotient-level theorem. A completed closure would require:

- one carrier rather than separate closure-side, shift-side, and
  representation-side objects with open seams;
- one admissible law whose quotients/projections produce both the coarse
  causal story and the operator/defect story;
- one observable package split honestly into descending observables and
  non-descending defect/fibre structure;
- one RG/coarse-graining story internal to that same law;
- no unresolved bridge theorem between those layers.

The present canonical results already show the shape of that target. The
closure law behaves like a quotient selector:

- `Gauge × basinLabel × motifClass` survives the closure→schedule bridge;
- `mdlLevel`, `eigenShadow` at the bridge level, raw `eigenSummary`, and raw
  `heckeSignature` do not.

So the next theorem-bearing move is to define the maximal
closure-invariant observable package explicitly and treat the non-descending
Hecke/eigen channels as lawful defect or fibre data rather than as failed
would-be invariants.

### Observable split at the current boundary

The repo can now describe the closure-side observable lattice more sharply than
before.

#### Base physics

The downward-closed family of currently proved closure-invariant observables is
generated by:

- `Gauge × basinLabel × motifClass`

and its subquotients. This is the strongest currently proved package that
bridges canonically from the closure carrier to the schedule side.

#### Fibre/defect data

The following channels are still structured, but they do not descend through
the current closure quotient:

- bridge-level `mdlLevel`
- bridge-level `eigenShadow`
- raw `eigenSummary`
- raw `heckeSignature`
- finer defect/correspondence profile data on the Hecke side

These should now be treated as fields on the fibres above the coarse quotient,
not as failed base observables. In other words, the current closure law keeps
them as internal fine structure rather than erasing them as noise.

#### Scaffolding

The remaining representation gadgets are still primarily proof and diagnostic
machinery:

- raw prime-address carriers such as `FactorVec`
- support-mask and other overcoarse quotient probes
- synthetic local transport shells used to expose obstruction structure
- raw correspondence packaging before a quotient- or chamber-law is extracted

They remain essential to the theorem pipeline, but they are not yet part of
the physical quotient without an additional descent or invariance theorem.
