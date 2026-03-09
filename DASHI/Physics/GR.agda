module DASHI.Physics.GR where

-- GR-side adapter boundary: placeholders expressed as parameters.

open import DASHI.Physics.Bridge using (BridgeSurface)
open import DASHI.Physics.LorentzBridge using (LorentzAdapter)

record GRAdapter : Set₁ where
  field
    bridge  : BridgeSurface
    lorentz : LorentzAdapter

open GRAdapter public
