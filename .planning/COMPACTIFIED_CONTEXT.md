# Compactified Context

- Physics bridge stubs were added under `DASHI/Physics/` to mirror the remaining “unproven” list with minimal records/postulates.
- A new `AdmissibleQuadratic` interface now bundles contraction, isotropy, involution, and finite-speed invariances; uniqueness is the intended bottleneck.
- Shared symmetry definitions (`Isotropy`, `PreservesQuadratic`) live in `DASHI/Physics/Core.agda`.
- Current milestone: remove remaining postulates in `DASHI/Physics/*` by providing concrete witnesses and wiring to existing bridge modules.
- Added concrete geometry helpers for isotropy and finite-speed with trivial instances for wiring: `DASHI/Geometry/Isotropy.agda`, `DASHI/Geometry/FiniteSpeed.agda`.
- Extended `Contraction.agda` with `StrictContraction` (contractive + unique fixed point).
- Repo fully typechecks against stdlib; ternary carrier + agreement ultrametric are concrete and postulate-free.
- Real operator stack now uses tail-zeroing projection `Pᵣ` and fine-agreement ultrametric; nontrivial isotropy (C₂ sign-flip) and finite-speed (ball locality) are wired.
- Strict contraction and fixed-point claims are now framed via **fiber/quotient contraction**: added `FiberContraction` and `RealClosureKitFiber`, and `TernaryRealInstance` provides observable fixed/unique on tail digit.
- Remaining global StrictContraction path is still available but not used for the real ternary instance; physics closure now uses the fiber kit.
