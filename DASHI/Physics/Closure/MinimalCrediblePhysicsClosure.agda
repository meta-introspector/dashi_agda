module DASHI.Physics.Closure.MinimalCrediblePhysicsClosure where

open import Agda.Primitive using (Setω)
open import Relation.Binary.PropositionalEquality using (_≡_)

open import DASHI.Geometry.ConeTimeIsotropy as CTI
open import DASHI.Physics.Closure.DynamicalClosure as DC
open import DASHI.Physics.Closure.PhysicsClosureFull as PCF
open import DASHI.Physics.Closure.ObservablePredictionPackage as OPP

-- Final adapter boundary for the current minimum credible closure milestone.
record MinimalCrediblePhysicsClosure : Setω where
  field
    full : PCF.PhysicsClosureFull
    observables : OPP.ObservablePredictionPackage
    closureSignatureMatchesPrediction :
      PCF.PhysicsClosureFull.signature31 full
      ≡ OPP.ObservablePredictionPackage.provedSignature observables

open MinimalCrediblePhysicsClosure public

authoritativeDynamics :
  MinimalCrediblePhysicsClosure → DC.DynamicalClosure
authoritativeDynamics C = PCF.PhysicsClosureFull.dynamics (full C)
