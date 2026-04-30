module DASHI.Physics.Closure.PhysicsUnificationToCanonicalClosureAdapter where

open import Agda.Primitive using (Setω)

open import DASHI.Physics.ClosureBuilder as CB
open import DASHI.Physics.ContractionQuadraticBridge as CQB
open import DASHI.Physics.SignatureClassificationBridge as SCB
open import DASHI.Physics.CliffordEvenLiftBridge as CE
open import DASHI.Physics.ConcreteClosureStack as CCS
open import DASHI.Physics.UnifiedClosure as UC

open import DASHI.Physics.Closure.CanonicalContractionToCliffordBridgeTheorem as CCTCB
open import DASHI.Physics.Closure.PhysicsClosureTheoremChecklist as PCTC
open import DASHI.Physics.Closure.PhysicsClosureFullCanonicalBridgePackage as PCBP

-- Adapter surface exposing the route from the abstract unification record
-- on the concrete stack into the canonical theorem checklist and bridge
-- package used by the closure story.
record PhysicsUnificationToCanonicalClosureAdapter : Setω where
  field
    concreteUnification :
      UC.PhysicsUnification CCS.realStack

    canonicalContractionToCliffordBridge :
      CCTCB.CanonicalContractionToCliffordBridgeTheorem

    canonicalChecklist :
      PCTC.PhysicsClosureTheoremChecklist

    canonicalBridgePackage :
      PCBP.PhysicsClosureFullCanonicalBridgePackage

    contractionQuadraticBridge :
      CQB.Contraction⇒Quadratic
        (CB.U CCS.realStack) (CB.T CCS.realStack)

    signatureBridge :
      SCB.Quadratic⇒Signature

    cliffordBridge :
      CE.Quadratic⇒Clifford

    waveLiftEvenBridge :
      CE.WaveLift⇒Even

canonicalPhysicsUnificationToCanonicalClosureAdapter :
  PhysicsUnificationToCanonicalClosureAdapter
canonicalPhysicsUnificationToCanonicalClosureAdapter =
  let
    concreteUnification = CCS.physicsUnification
    canonicalContractionToCliffordBridge =
      CCTCB.canonicalContractionToCliffordBridgeTheorem
  in
  record
    { concreteUnification = concreteUnification
    ; canonicalContractionToCliffordBridge =
        canonicalContractionToCliffordBridge
    ; canonicalChecklist =
        PCTC.canonicalPhysicsClosureTheoremChecklist
    ; canonicalBridgePackage =
        PCBP.canonicalPhysicsClosureFullCanonicalBridgePackage
    ; contractionQuadraticBridge =
        UC.PhysicsUnification.cq concreteUnification
    ; signatureBridge =
        UC.PhysicsUnification.qs concreteUnification
    ; cliffordBridge =
        UC.PhysicsUnification.q2cl concreteUnification
    ; waveLiftEvenBridge =
        UC.PhysicsUnification.wl concreteUnification
    }
