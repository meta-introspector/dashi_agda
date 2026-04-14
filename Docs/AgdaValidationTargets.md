# Agda Validation Targets

Purpose: record which Agda modules are safe for routine targeted validation and
which ones should be avoided in normal loops because they are known to be
runtime-heavy or aggregate too much of the closure surface at once.

## Safe Routine Targets

These are the preferred modules for focused validation while working on the
canonical closure spine:

- `DASHI/Geometry/CausalForcesLorentz31.agda`
- `DASHI/Geometry/Signature31FromIntrinsicShellForcing.agda`
- `DASHI/Physics/Signature31IntrinsicShiftInstance.agda`
- `DASHI/Physics/Signature31FromShiftOrbitProfile.agda`
- `DASHI/Physics/Closure/ContractionQuadraticToSignatureBridgeTheorem.agda`
- `DASHI/Physics/Closure/QuadraticToCliffordBridgeTheorem.agda`
- `DASHI/Physics/CliffordEvenLiftBridge.agda`
- `DASHI/Physics/Closure/CliffordToEvenWaveLiftBridgeTheorem.agda`
- `DASHI/Physics/Closure/CanonicalContractionToCliffordBridgeTheorem.agda`
- `DASHI/Physics/Closure/KnownLimitsQFTBridgeTheorem.agda`
- `DASHI/Physics/Closure/Canonical/LocalProgramBundle.agda`
- `DASHI/Physics/Closure/Canonical/Ladder.agda`
- `DASHI/Physics/Closure/PhysicsClosureSummary.agda`

Use these for routine theorem-edit loops and targeted bridge checks.

## Heavy / Avoid In Routine Loops

These should not be part of normal rapid validation passes:

- `DASHI/Physics/Closure/PhysicsClosureValidationSummary.agda`
- `DASHI/Everything.agda`

Reason:

- `PhysicsClosureValidationSummary.agda` is the known heavy aggregate closure
  summary and currently remains outside routine validation policy.
- `Everything.agda` is the authoritative top-level route, but bounded local
  checks currently time out because it eventually pulls the heavy validation
  summary path.

## Bounded-Only Target

- `DASHI/Physics/Closure/CanonicalStageC.agda`

This module is not banned, but it is heavy enough that bounded runs can still
time out. Use it as a checkpoint module, not as the default inner-loop target.

## Hygiene Script Policy

- `scripts/run_closure_hygiene.py`
- `scripts/run_closure_hygiene.sh`

These now skip learned `heavy` and `aggregator` tasks by default. Use
`--include-heavy` only for deliberate aggregate validation runs with a larger
runtime budget.

## Practical Rule

Default inner loop:

1. run one or two canonical bridge modules directly
2. run `PhysicsClosureSummary.agda` if you need a broader canonical surface
3. avoid `PhysicsClosureValidationSummary.agda` unless you are explicitly doing
   a long-budget validation pass
4. treat `Everything.agda` as an occasional bounded checkpoint, not a routine
   target

## Execution Stratification

Use the repo in three layers:

- `L0`: thin, interactive targets
- `L1`: bounded medium targets
- `L2`: heavy aggregate or heavy fixed-domain targets that should stay out of
  the interactive loop

Current policy examples:

- `L0`
  - the canonical bridge modules listed above
  - `Kernel/*.agda`
  - `Verification/*.agda`
  - `Ontology/Hecke/Layer2FiniteSearchShell.agda`
- `L1`
  - `DASHI/Physics/Closure/CanonicalStageC.agda`
  - `Ontology/Hecke/SaturatedInvariantRefinementStatus.agda`
- `L2`
  - `DASHI/Physics/Closure/PhysicsClosureValidationSummary.agda`
  - `DASHI/Everything.agda`
  - the current heavy Hecke Layer 2 implementation lane:
    `Ontology/Hecke/DefectOrbitSummaryRefinement.agda`,
    `Ontology/Hecke/ForcedStableCountDecomposition.agda`,
    `Ontology/Hecke/TriadIndexedDefectOrbitSummaryRefinement.agda`,
    `Ontology/Hecke/CurrentSaturatedTriadHistogramSeparation.agda`,
    `Ontology/Hecke/CurrentSaturatedSectorHistogramComputations.agda`,
    `Ontology/Hecke/CurrentSaturatedPredictedPairComparisons.agda`,
    `Ontology/Hecke/TriadSectorCorrelationRefinement.agda`, and
    `Ontology/Hecke/Layer2FiniteSearch.agda`

Control-plane helper:

- `scripts/route_agda_by_layer.py`
- `scripts/run_agda_easy_to_hard.py`

Use it to classify one or more modules and route them as:

- interactive direct Agda runs for `L0`
- timeout-bounded Agda runs for `L1`
- queue-only handoff for the heavy current Hecke `L2` lane

Use `scripts/run_agda_easy_to_hard.py` when the task is not “classify this one
target” but “run the current validated easiest-to-hardest sequence”.
Its default order is:

1. `Ontology/Hecke/Layer2FiniteSearchShell.agda`
2. `Kernel/Monoid.agda`
3. `Verification/Prelude.agda`
4. `DASHI/Physics/Closure/CanonicalPrimeSelectionBridge.agda`
5. `DASHI/Physics/Closure/CanonicalPrimeInvariance.agda`
6. `DASHI/Physics/Closure/CanonicalPrimeConcentration.agda`
7. `DASHI/Physics/Closure/CanonicalPrimeSelector.agda`
8. `DASHI/Physics/Closure/CanonicalPrimeIsolation.agda`

Optional flags then extend the run with:

- bounded medium targets such as
  `Ontology/Hecke/SaturatedInvariantRefinementStatus.agda`
- Layer 2 queue generation only, not heavy theorem-lane execution
