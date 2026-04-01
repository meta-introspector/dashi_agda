# DNA Supervoxel Hierarchy

## Scope

This note starts the DNA-first supervoxel lane that previously existed only in
the archive thread `DNA Cassette Tape Comeback`.

The local repo previously had:

- no DNA 4/16/64/256 carrier,
- no chemistry-native supervoxel note,
- no theorem surface for chemistry quotienting.

This pass starts that lane.

## Archived guidance now made local

The archive material pointed to four recurring ideas:

- DNA should be treated as a native 4-adic carrier, not only as a remapped
  ternary stream;
- the natural fixed-height hierarchy is `4 -> 16 -> 64 -> 256`;
- chemistry sees only a quotient of the raw sequence;
- thermo / reverse-complement risk should be modeled as a screen or kernel on
  that quotient-aware carrier.

## Landed modules

- [`Ontology/DNA/Supervoxel4Adic.agda`](../Ontology/DNA/Supervoxel4Adic.agda)
- [`Ontology/DNA/ChemistryQuotient.agda`](../Ontology/DNA/ChemistryQuotient.agda)
- [`Ontology/DNA/ChemistryConcrete.agda`](../Ontology/DNA/ChemistryConcrete.agda)

## What is now implemented

### 1. DNA-first 4-adic carrier

`Supervoxel4Adic.agda` defines:

- DNA alphabet `A C G T`
- Watson-Crick complement
- fixed-height block carriers:
  - `DNA4`
  - `DNA16`
  - `DNA64`
  - `DNA256`
- a first `BlockLift4Adic` record

This is intentionally the smallest honest carrier.

### 2. Chemistry quotient surface

`ChemistryQuotient.agda` defines:

- `U`-style strong/weak feature stream
- `V`-style purine/pyrimidine feature stream
- a `ChemistryFeature` record
- a `ChemistryQuotient` record with:
  - `featureMap`
  - `thermoKernel`
  - `admissible`
- a quotient interface on `DNA256`

So the repo now has a formal place to say:

> chemistry does not see the raw sequence directly; it sees a feature quotient
> plus a thermo-like scalar screen.

## Current boundary

This is still early and intentionally narrow.

What is implemented:

- the carrier hierarchy
- the chemistry-visible quotient surface
- the first quotient interface on `DNA256`
- a first concrete chemistry quotient instance with:
  - `U/V` feature map
  - strong-base thermo scalar
  - local immediate-repeat ban
  - local immediate-complement ban
  - bounded span-2 complement exclusion
  - sliding 4-window GC-extremal ban
  - sliding 4-window reverse-complement palindrome ban
  - sliding 6-window hairpin-like reverse-complement ban

What is not implemented:

- a longer-window reverse-complement or hairpin law beyond the current 6-window
  screen
- richer GC-window theorems beyond the current 4-window extreme ban
- dimer theorems
- an encoder/decoder
- any connection to the physics closure bundle

## Next step

The next honest move is no longer the first quotient instantiation.
It is to strengthen the admissibility screen beyond the current local pairwise
ban, for example by adding:

- a longer-window reverse-complement exclusion law,
- a stronger GC-window constraint,
- or a stronger hairpin/dimer kernel.
