# Architecture Notes for DashI Closure Path

## Current canonical stack
- Constraint layer: `CanonicalStageC` orchestrates canonical gauge, algebraic, and
  wave modules, exporting `CanonicalStageCTheoremBundle` and `CanonicalStageCSummaryBundle`.
- Recovery layer: known-limits modules now include propagation, geometry transport,
  local coherence, extended recovery, the new local causal-effective propagation,
  and the local causal-geometry coherence theorem, culminating in
  `KnownLimitsRecoveredDynamicsTheorem` anchored by `CanonicalDynamicsLawTheorem`.
- Bridge layer: Stage C now re-exports `KnownLimitsMatterGaugeTheorem`, with existing
  GR and QFT bridge theorems depending on it.

## Remaining architecture work
1. Land the bottleneck theorem path around projection/defect to quadratic:
   `ProjectionDefectToParallelogram` then `ContractionForcesQuadraticStrong`.
2. Discharge the remaining seams:
   invariant quadratic under the contraction dynamics, and uniqueness up to scale.
3. Only after (2), treat signature, Clifford, and full gauge/matter recovery
   as mathematically closed rather than packaged.

## Engineering hardening track (normalization cost)
- Base369 cyclic operators are being split into:
  - compatibility definitions that keep the existing `spin` semantics,
  - closed-form definitions via index arithmetic (`fromIndex` / modulo carrier period).
- Scope for this turn:
  - land the triadic closed-form path with a correctness bridge,
  - stage hex/nonary migration as follow-up TODO work.
- Intent:
  reduce recursive normalization pressure in small but frequently reused cyclic
  operators without changing external behavior.

## Signals to watch
- `status.json` should flip `milestones_remaining` to 0 once the bridge and
  dynamics pillars are recorded as canonical exports.
- `COMPACTIFIED_CONTEXT.md` should summarize each fixed theorem surface.
