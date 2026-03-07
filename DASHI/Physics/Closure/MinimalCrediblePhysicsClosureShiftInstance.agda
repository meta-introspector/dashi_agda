module DASHI.Physics.Closure.MinimalCrediblePhysicsClosureShiftInstance where

open import Relation.Binary.PropositionalEquality using (refl)

open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosure as MCPC
open import DASHI.Physics.Closure.PhysicsClosureFullInstance as PCFI
open import DASHI.Physics.Closure.ShiftObservablePredictionInstance as SOPI

minimumCredibleClosureShift : MCPC.MinimalCrediblePhysicsClosure
minimumCredibleClosureShift =
  record
    { full = PCFI.physicsClosureFull
    ; observables = SOPI.shiftObservablePrediction
    ; closureSignatureMatchesPrediction = refl
    }
