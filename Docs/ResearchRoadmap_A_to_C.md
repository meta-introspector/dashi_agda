# Research Roadmap: A -> B -> C

## Current Theorem State

The current finished mathematical headline in this repo is:

> **Stage A — Orbit Profile Signature Discrimination**  
> The orbit shell profile computed from the shift dynamics uniquely selects
> Lorentz signature `(3,1)` among the candidate 4D signatures.

The canonical path is:

`OrbitProfileComputedSignedPerm`
-> `Signature31ShiftProfileWitness`
-> `Signature31FromShiftOrbitProfile`
-> `PhysicsClosureInstanceAssumed` / `PhysicsClosureFullInstance`
-> `SpinDiracGateFromClosure`

This is a classification theorem. It is not yet a theorem that cone invariance
and isotropy intrinsically force Lorentz signature.

Current strengthening on the Stage B side:

- the repo now has an explicit shell/action/profile layer,
- the 4D shift instance proves shell preservation for the signed-permutation
  action,
- a dedicated shift-enumeration bridge derives the shell-orbit lists consumed
  by the current agreement module.

What is still missing is the final intrinsic step showing that the abstract
shell-action construction itself determines the same orbit enumeration, rather
than delegating that step to the current concrete enumerator module.

## Stage A — Orbit Profile Signature Discrimination

Stage A is the finished theorem layer currently supported by the repo.

What it establishes:

- a concrete orbit shell invariant is computed from the 4D shift dynamics,
- that invariant is matched against the candidate signatures
  `sig40`, `sig31`, `sig22`, `sig13`, `sig04`,
- the discriminant uniquely selects `sig31`.

Immediate implications:

- a new invariant for dynamical classification,
- a signature detector derived from orbit statistics,
- a mathematically clean entrypoint for collaborators and outreach.

Primary repo anchors:

- `DASHI.Physics.Signature31ShiftProfileWitness`
- `DASHI.Physics.Signature31FromShiftOrbitProfile`
- `DASHI.Physics.Closure.PhysicsClosureSummary`

## Stage B — Cone -> Signature Forcing

Stage B is the next rigorous theorem target.

Current status:

- partially implemented for the concrete 4D shift instance,
- not yet complete as a theorem headline.

Target statement:

`cone invariance + arrow/time orientation + isotropy -> orbit shell profile`

combined with Stage A:

`orbit shell profile -> sig31`

to yield:

`cone invariance + arrow/time orientation + isotropy -> sig31`

Primary missing lemma:

`cone + arrow + isotropy -> orbit shell profile`

Proof obligations before Stage B can be claimed:

- expose shell/orbit structure from the abstract cone/arrow/isotropy data,
- connect the abstract shell action to the concrete 4D signed-permutation
  enumeration,
- show the profile derived from the abstract shell/action construction agrees
  with the computed shift profile consumed by the Stage A discriminant,
- remove the remaining enumeration seam from the concrete theorem path.

Stage B should be treated as the main rigorous next objective for the project.

## Stage C — Full Closure Program

Stage C is a speculative long-horizon research program, not a current theorem.

The intended direction is:

`ultrametric contraction`
-> `quadratic / polarization / orthogonality`
-> `cone structure`
-> `signature forcing`
-> `closure consequences`
-> possible deep symmetry structure

Possible downstream themes include:

- stronger closure and geometric rigidity results,
- representation-theoretic explanations of the orbit invariant,
- Monster/Moonshine-style symmetry as a later structural hypothesis or theorem
  target.

Stage C must not be described as proved by the current repo state.
Any Monster/Moonshine interpretation remains explicitly downstream and
speculative unless supported by separate theorem-level bridges.

## Milestones and Exit Criteria

### Stage A

Status: complete.

Exit criterion:

- the computed shift orbit profile uniquely selects `(3,1)` among the candidate
  4D signatures and is exposed through the theorem path.

### Stage B

Status: open.

Exit criterion:

- the concrete shift theorem no longer depends on a manual profile or
  enumeration seam,
- the shell/action side determines the orbit profile theoremically,
- the signature theorem can be stated as a genuine cone-forcing result.

### Stage C

Status: speculative.

Exit criterion:

- closure, symmetry, and downstream physical structures are linked by
  theorem-level bridges rather than assumption packages or compatibility
  scaffolding.

## Practical Implications by Stage

### A — Orbit invariant

- mathematical classification tool,
- geometric/signature inference from dynamics,
- possible new invariant for dynamical systems and optimization geometry.

### B — Cone -> signature forcing

- structural geometric theorem,
- causal-cone-first explanation of Lorentz signature,
- stronger classification of isotropic cone-preserving dynamics.

### C — Full closure

- speculative foundational structure,
- possible deep symmetry interpretation,
- potential long-term bridge between dynamics, geometry, and algebra.

The intended reading discipline is:

- A is proved,
- B is the next theorem target,
- C is a research program.
