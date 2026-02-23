# Compactified Context

- Physics bridge stubs were added under `DASHI/Physics/` to mirror the remaining “unproven” list with minimal records/postulates.
- A new `AdmissibleQuadratic` interface now bundles contraction, isotropy, involution, and finite-speed invariances; uniqueness is the intended bottleneck.
- Shared symmetry definitions (`Isotropy`, `PreservesQuadratic`) live in `DASHI/Physics/Core.agda`.
- Current milestone: remove remaining postulates in `DASHI/Physics/*` by providing concrete witnesses and wiring to existing bridge modules.
- Added concrete geometry helpers for isotropy and finite-speed with trivial instances for wiring: `DASHI/Geometry/Isotropy.agda`, `DASHI/Geometry/FiniteSpeed.agda`.
- Extended `Contraction.agda` with `StrictContraction` (contractive + unique fixed point).
- Repo fully typechecks against stdlib; default closure uses a Bool/ultrametric instance to keep compilation green.
- Next scaffolds: real `T` operator module, strict-contraction composition lemma, real isotropy/locality wrappers, and a real closure instance record.
