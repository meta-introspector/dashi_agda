# Orbit Profile Signature Discrimination

## Headline

The current finished mathematical result in this repo is:

> The orbit shell profile computed from the shift dynamics uniquely selects
> Lorentz signature `(3,1)` among the candidate 4D signatures.

This is a classification theorem, not yet a full cone-forcing theorem.

## Canonical Theorem Path

The intended proof-reading order is:

1. `DASHI.Physics.OrbitProfileComputedSignedPerm`
   computes the shell profile for the 4D signed-permutation action.
2. `DASHI.Physics.Signature31ShiftProfileWitness`
   packages that computed profile as the concrete witness consumed downstream.
3. `DASHI.Physics.ConeArrowIsotropyShiftOrbitEnumeration`
   is the concrete Stage B bridge that derives the shell-orbit lists used by
   the current shift-profile agreement path.
4. `DASHI.Physics.ConeArrowIsotropyOrbitProfileAgreement`
   turns the Stage B shift bridge into the profile equality consumed by the
   theorem layer.
5. `DASHI.Physics.Signature31FromShiftOrbitProfile`
   proves the theorem-level `sig31` result from the computed profile and the
   profile discriminant.
6. `DASHI.Physics.Closure.PhysicsClosureInstanceAssumed` and
   `DASHI.Physics.Closure.PhysicsClosureFullInstance`
   consume that signature result.
7. `DASHI.Physics.Closure.SpinDiracGateFromClosure`
   is a downstream consumer of the closure, not the primary theorem headline.

## Current Open Lemma

The missing intrinsic step is:

`cone + arrow + isotropy -> orbit shell profile`

The repo now has an explicit shell/action/profile layer and a dedicated
shift-enumeration bridge, so the remaining gap is narrower than before.
What is still not proved is that the abstract shell-action construction itself
forces the same orbit enumeration, rather than handing that step to the current
concrete signed-permutation enumerator.

## Outreach Framing

For external mathematical communication, the conservative and accurate summary
is:

> We compute an orbit shell invariant from the dynamics and show that it
> uniquely identifies Lorentz signature `(3,1)` among the candidate 4D
> signatures. The remaining open problem is to derive that invariant directly
> from cone/arrow/isotropy hypotheses.

## Next Roadmap

For the staged internal research path from the current theorem state to the
cone-forcing theorem target and the longer-horizon full-closure program, see:

- `Docs/ResearchRoadmap_A_to_C.md`
