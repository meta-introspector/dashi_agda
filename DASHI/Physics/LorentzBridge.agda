module DASHI.Physics.LorentzBridge where

-- Lorentz-like adapter boundary: symmetry data only, no semantics.

open import DASHI.Physics.Bridge using (BridgeSurface)

record LorentzAdapter : Set₁ where
  field
    bridge : BridgeSurface

open LorentzAdapter public
