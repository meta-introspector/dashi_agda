module DASHI.Geometry.EnergyAdditivityProofQ where

open import DASHI.Geometry.EnergyAdditivityProof
open import DASHI.Geometry.ScalarLawsQ

-- Convenience wrapper: apply EnergyAdditivityProof with ℚ scalar laws.
EnergyAdditivityProofℚ :
  ∀ {ℓ}
  {A : Additive {ℓ}}
  (V : InnerProductSpace A scalarFieldℚ)
  (T : Two scalarFieldℚ) →
  (∀ x y → Orth V x y → ⟪_,_⟫ V x y ≡ 0s scalarFieldℚ) →
  ∀ x y → Orth V x y → E V (_+_ A x y) ≡ (_+s_ scalarFieldℚ (E V x) (E V y))
EnergyAdditivityProofℚ V T =
  EnergyAdditivityProof V T scalarLawsℚ
