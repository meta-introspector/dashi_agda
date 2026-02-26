module DASHI.Physics.Closure.BetaSeamCertificates where

open import Agda.Builtin.Nat using (Nat)

open import DASHI.Energy.Energy as E
open import DASHI.Energy.ClosestPoint as CP
open import DASHI.Geometry.DefectCollapse as DC
open import DASHI.MDL.MDLDescent as MDL

-- Abstract seam pack for beta-space certificates (CSV-driven evidence).
-- Parametrize by the concrete energy space, projection, and defect/MDL structures.
record BetaSeams
  {P : E.Preorder}
  (X : Set)
  (ES : E.EnergySpace X P)
  (Pr : CP.Projection X)
  (Ecod : Set)
  : Set₁ where
  field
    fejer : CP.FejerMonotone ES Pr
    closest : CP.ClosestPoint ES Pr
    defectCollapse : DC.DefectCollapse X Ecod
    mdlDescent : ∀ (T : X → X) (M : MDL.MDLStructure X) → MDL.MDLDescent X T M

open BetaSeams public
