module DASHI.Physics.Closure.CanonicalStageC where

-- Canonical Stage C entrypoint for the current minimum-credible closure path.
-- This surface is the authoritative repo-facing closure boundary.

open import DASHI.Physics.Closure.CanonicalStageCStatus as CSS
open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosure as MCPC
open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosureShiftInstance as MCCSI
open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosureValidation as MCPCV
open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosureValidationShiftInstance as MCPCVS
open import DASHI.Physics.Closure.PhysicsClosureFull as PCF
open import DASHI.Physics.Closure.Validation.RealizationProfileRigidity as RPR

canonicalClosure : MCPC.MinimalCrediblePhysicsClosure
canonicalClosure = MCCSI.minimumCredibleClosureShift

canonicalValidation : MCPCV.MinimalCrediblePhysicsClosureValidation
canonicalValidation = MCPCVS.minimumCredibleClosureValidationShift

canonicalFullClosure : PCF.PhysicsClosureFull
canonicalFullClosure = MCPC.MinimalCrediblePhysicsClosure.full canonicalClosure

canonicalClosureStatus : CSS.ClosureSurfaceStatus
canonicalClosureStatus = CSS.canonicalProved

compatibilityClosureStatus : CSS.ClosureSurfaceStatus
compatibilityClosureStatus = CSS.compatibilityOnly

wavePrototypeStatus : CSS.ClosureSurfaceStatus
wavePrototypeStatus = CSS.prototypeOnly

canonicalSelfVerdict : RPR.RigidityVerdict
canonicalSelfVerdict = MCPCV.selfVerdict canonicalValidation

canonicalAdmissibleVerdict : RPR.RigidityVerdict
canonicalAdmissibleVerdict = MCPCV.admissibleVerdict canonicalValidation

canonicalNegativeControlVerdict : RPR.RigidityVerdict
canonicalNegativeControlVerdict = MCPCV.negativeControlVerdict canonicalValidation
