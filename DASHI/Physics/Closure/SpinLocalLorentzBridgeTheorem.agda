module DASHI.Physics.Closure.SpinLocalLorentzBridgeTheorem where

open import Agda.Primitive using (Setω)

open import DASHI.Physics.Closure.CanonicalSpinDiracConsumer as CSDC
open import DASHI.Physics.Closure.KnownLimitsLocalCoherenceTheorem as KLLCT
open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosure as MCPC
open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosureShiftInstance as MCCSI

record SpinLocalLorentzBridge
  (C : MCPC.MinimalCrediblePhysicsClosure) : Setω where
  field
    consumer : CSDC.SpinDiracConsumerFromMinimal C
    localCoherence : KLLCT.KnownLimitsLocalCoherenceTheorem

canonicalSpinLocalLorentzBridge :
  SpinLocalLorentzBridge MCCSI.minimumCredibleClosureShift
canonicalSpinLocalLorentzBridge =
  record
    { consumer =
        CSDC.spinDiracConsumerFromMinimal MCCSI.minimumCredibleClosureShift
    ; localCoherence = KLLCT.canonicalKnownLimitsLocalCoherenceTheorem
    }
