module DASHI.Physics.Closure.PhysicsClosureSummary where

-- Repo-facing summary entrypoint.
-- Stage A current headline:
--   orbit profile signature discrimination in 4D.
-- Stage B next rigorous target:
--   cone + arrow + isotropy -> orbit profile -> sig31.
-- Stage B current strengthening:
--   explicit shell/action/profile records,
--   shift-instance shell preservation lemmas,
--   and a dedicated shift-orbit enumeration bridge.
-- Stage C long-horizon program:
--   full closure and downstream symmetry structure, documented in
--   Docs/ResearchRoadmap_A_to_C.md and not asserted as a current theorem.
-- Primary closure consumers:
--   PhysicsClosureInstanceAssumed and PhysicsClosureFullInstance.
-- Downstream physical consumer:
--   SpinDiracGateFromClosure.
-- The open lemma remains the intrinsic derivation
--   from the abstract shell-action construction to the concrete orbit
--   enumeration used by the current 4D shift profile.

open import DASHI.Physics.Closure.PhysicsClosureFull as PCF public
open import DASHI.Physics.Closure.PhysicsClosureFullInstance as PCFI public
open import DASHI.Physics.Closure.PhysicsClosureInstanceAssumed as PCA public

open import DASHI.Physics.SignatureUniquenessOrbitLock as SUL public
open import DASHI.Physics.SignatureUniquenessOrbitLockInstance as SULI public
open import DASHI.Physics.OrbitProfileComputedSignedPermEvidence as OPCE public
open import DASHI.Physics.ConeArrowIsotropyShiftOrbitEnumeration as SOE public
open import DASHI.Physics.Signature31FromShiftOrbitProfile as S31OP public
open import DASHI.Physics.Signature31ShiftProfileWitness as SPW public
open import DASHI.Physics.Signature31OrbitActionAgreement as OAA public
open import DASHI.Physics.Closure.SpinDiracGateFromClosure as SDGC public
