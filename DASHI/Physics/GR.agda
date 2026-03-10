module DASHI.Physics.GR where

-- GR-side adapter boundary: placeholders expressed as parameters.

open import DASHI.Physics.Bridge using (BridgeSurface)
open import DASHI.Physics.LorentzBridge using (LorentzAdapter)

record GRAdapter : Set₁ where
  field
    bridge  : BridgeSurface
    lorentz : LorentzAdapter

open GRAdapter public

-- Thin projections so GR can cite the canonical signature seam without
-- importing the underlying signature modules.

grSignature31 : GRAdapter -> _
grSignature31 A = LorentzAdapter.signature31Tag (GRAdapter.lorentz A)

grSignature31Theorem : GRAdapter -> _
grSignature31Theorem A = LorentzAdapter.signature31Theorem (GRAdapter.lorentz A)
