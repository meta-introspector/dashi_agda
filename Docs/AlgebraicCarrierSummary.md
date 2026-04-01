# Algebraic Carrier Support Lane

## O/R/C/S/L/P/G/F
O: You (algebraic carrier lane owner) synthesize the current moonshine/root-system discussions into a single summary focused on tangible support for the P0 physics closure spine.  
R: Clarify whether there is one runnable carrier idea (e.g., Weyl-invariant Vec ℤ⁴ root lattice) that plugs directly into the closure or whether the lane stays as advisory context.  
C: Docs-only; new note under `Docs/`.  
S: Context medium—Docs/PrimeToModular.md, Docs/MoonshinePrimeSource.md, Docs/MoonshinePrimeObject.md already list candidate carriers; collision with other lanes is avoided.  
L: cheapest viable tier (`gpt-5.1-codex-mini`).  
P: you; no additional experts.  
G: Keep the lane summary compact; avoid changing shared files.  
F: Need to declare carrier idea status clearly for P0 relevance.

## Summary
- **Direct carrier idea**: the signed Weyl-root lattice on `Vec ℤ⁴` decorated with the `SP.SignedPerm4` action plus the hyperbolic cone/MDL structure already present in the shift Lorentz instance. This lattice naturally supports a `B₄`/Weyl symmetry, offers a modular-quotient candidate (via signed-looped Hecke actions), and sits adjacent to the Moonshine prime object that counts basin signatures. Because it is already embedded in `ShiftLR` code and carries the Hecke-friendly signed-permutation action, it can be promoted to the P0 spine by:
  1. Formally abstracting the carrier as “vector lattice + Weyl action + hyperbolic cone + Hecke compat field”.
  2. Showing that `shiftPrimeEmbedding` and `shiftMotifOf` factor through that abstraction, which links the lattice symmetry to the observable Hecke signature.
  3. Using that carrier for gauge/matter reconstruction or continuum-limit proposals by appealing to its orthogonal root-system structure (triality, Niemeier orbit data) already discussed in `Docs/OrbitShellProfilesAndLorentzSignature.md`.
- **Advisory material**: other streams (modular/Hauptmodul, null-model testing, outreach) remain advisory for now; they do not directly produce a new carrier but provide motivation and tests once a carrier is pinned down.

## Decision
This lane yields one direct carrier idea—the Weyl-invariant `Vec ℤ⁴` lattice with signed permutations and Hecke-compatible invariants—so it can be plugged into the main P0 physics closure spine. Additional materials remain advisory until the carrier abstraction is formalized.
