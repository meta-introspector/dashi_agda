module DASHI.Physics.Closure.SpinDiracGateFromClosure where

open import Agda.Primitive using (Level; _⊔_; lsuc)

open import DASHI.Geometry.CliffordGate using (RingLike)
open import DASHI.Geometry.QuadraticForm as QF
open import DASHI.Physics.Closure.PhysicsClosureFull as PCF
open import DASHI.Physics.SpinDiracGateFromMetric
open import DASHI.Physics.QuadraticEmergenceShiftInstance as QES

-- Expose the spin/dirac gate type tied to the forced metric from a closure.
-- This does not assume an instance; it just pins the dependency.
SpinDiracGateType :
  (C : PCF.PhysicsClosureFull) →
  ∀ {m ℓψ ℓa ℓg} (Ψ : Set ℓψ)
    (R : RingLike (QF.ScalarField.S QES.ScalarFieldℤ)) →
  Set (lsuc (ℓψ ⊔ ℓa ⊔ ℓg))
SpinDiracGateType C {m} {ℓψ} {ℓa} {ℓg} Ψ R =
  SpinDiracGateFromMetric {ℓa = ℓa} {ℓg = ℓg}
    (QES.AdditiveVecℤ {m})
    QES.ScalarFieldℤ
    (PCF.PhysicsClosureFull.polarizationZ C {m})
    R
    Ψ
