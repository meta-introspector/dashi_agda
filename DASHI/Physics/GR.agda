module DASHI.Physics.GR where

-- GR-side adapter boundary: placeholders expressed as parameters.

open import DASHI.Physics.Bridge using (BridgeSurface)
open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosure as MCPC
open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosureShiftInstance as MCCSI
open import DASHI.Physics.Closure.PhysicsClosureFull as PCF
open import DASHI.Physics.RealClosureKit as RK
open import DASHI.Physics.LorentzBridge using (LorentzAdapter)

open import DASHI.Physics.LorentzBridge as LB

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

grBridgeSurface : MCPC.MinimalCrediblePhysicsClosure -> BridgeSurface
grBridgeSurface C =
  record
    { A = RK.closureAxioms (PCF.PhysicsClosureFull.kit (MCPC.MinimalCrediblePhysicsClosure.full C)) }

canonicalGRAdapterFromMinimal : MCPC.MinimalCrediblePhysicsClosure -> GRAdapter
canonicalGRAdapterFromMinimal C =
  record
    { bridge = grBridgeSurface C
    ; lorentz = LB.canonicalLorentzAdapter (grBridgeSurface C)
    }

canonicalGRAdapter : GRAdapter
canonicalGRAdapter = canonicalGRAdapterFromMinimal MCCSI.minimumCredibleClosureShift
