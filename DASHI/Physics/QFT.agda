module DASHI.Physics.QFT where

-- QFT-side adapter boundary: placeholders expressed as parameters.

open import DASHI.Physics.Bridge using (BridgeSurface)
open import DASHI.Physics.CliffordBridge using (CliffordAdapter)

record QFTAdapter : Set₁ where
  field
    bridge    : BridgeSurface
    clifford  : CliffordAdapter

open QFTAdapter public
