module DASHI.Physics.QFT where

-- QFT-side adapter boundary: placeholders expressed as parameters.

open import DASHI.Physics.Bridge using (BridgeSurface)
open import DASHI.Physics.CliffordBridge using (CliffordAdapter)
open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosure as MCPC
open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosureShiftInstance as MCCSI
open import DASHI.Physics.Closure.PhysicsClosureFull as PCF
open import DASHI.Physics.RealClosureKit as RK

record QFTAdapter : Set₁ where
  field
    bridge    : BridgeSurface
    clifford  : CliffordAdapter

open QFTAdapter public

qftBridgeSurface : MCPC.MinimalCrediblePhysicsClosure -> BridgeSurface
qftBridgeSurface C =
  record
    { A = RK.closureAxioms (PCF.PhysicsClosureFull.kit (MCPC.MinimalCrediblePhysicsClosure.full C)) }

canonicalQFTAdapterFromMinimal : MCPC.MinimalCrediblePhysicsClosure -> QFTAdapter
canonicalQFTAdapterFromMinimal C =
  record
    { bridge = qftBridgeSurface C
    ; clifford = record { bridge = qftBridgeSurface C}
    }

canonicalQFTAdapter : QFTAdapter
canonicalQFTAdapter = canonicalQFTAdapterFromMinimal MCCSI.minimumCredibleClosureShift
