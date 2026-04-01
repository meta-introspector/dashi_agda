# Canonical Prime-selection Rule (Lane 4)

This lane specifies the theorem target for the canonical prime-selection rule that underlies the Monster/prime bridge. The document stays in `Docs/` and avoids touching shared metadata.

**Objective**

Establish that the closure construction selects primes `p` that satisfy a property `P` defined entirely by the Dashi state geometry and MDL structure, without reference to external sporadic group data. Only after `P` is met may the bridge invoke any Ogg/Monster comparison.

**What `P` must look like**

1. `P` refers to the intrinsic `SSP` prime set and the `Vec15` signature extracted via `Docs/PhotonBridge.md` / `DASHI/Physics/Lorentz/Signature` modules.
2. `P` is a predicate on prime exponents such that: a) the prime appears in the `shiftPrimeEmbedding`, b) the MDL/Lyapunov orbit concentrates on that prime’s coefficient, and c) the ultrametric cone admits a nontrivial valuation drop along the projection for that prime.
3. `P` is monotonic under the existing `shiftCoarse` and `shiftExecutionAdmissible` dynamics, so the selected primes remain valid along admissible traces.

**Proof obligations before Monster comparison**

- `PrimeStability`: show `P` is preserved by `shiftCoarse` and `ShiftStep` (`shiftCoarseStep-commute` plus the `shiftCoarse-idem` lemma provide the skeleton).
- `PrimeWitness`: produce an explicit `Vec15` coordinate witness for the prime satisfying `P`, built from `shiftPrimeEmbedding` and `shiftDeltaEigenProfile`.
- `PrimeInvariance`: prove the MDL value for the prime decreases or stays fixed under the coarse evolution, ensuring the selection is meaningful rather than accidental noise.
- `PrimeIsolation`: demonstrate that any other prime falling outside `P` either loses volume under the MDL descent or violates the cone bound, keeping the selection canonical.

Only after these obligations are proved may downstream notes or modules compare the resulting prime selection with the Monster’s Ogg data.
