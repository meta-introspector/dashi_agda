module DASHI.Physics.Closure.PhysicsClosureRealizationIndependenceTheorem where

open import Agda.Primitive using (Setω)
open import Agda.Builtin.Equality using (_≡_)
open import Data.Empty using (⊥)

open import DASHI.Physics.Closure.PhysicsClosureCoreWitness as PCCW
open import DASHI.Physics.Closure.PhysicsClosureConstructorTheorem as PCCT
open import DASHI.Physics.Closure.PhysicsClosureFull as PCF
open import DASHI.Physics.Closure.PhysicsClosureFullInstance as PCFI
open import DASHI.Physics.Signature31Canonical as S31C

record IndependentFromShift
  (w : PCCW.PhysicsClosureCoreWitness) : Setω where
  field
    providerDistinguishedFromShift :
      PCCW.PhysicsClosureCoreWitness.signatureCoreProvider w
      ≡
      S31C.shiftCoreProvider
      → ⊥

record PhysicsClosureRealizationIndependenceTheorem : Setω where
  field
    shiftWitness : PCCW.PhysicsClosureCoreWitness
    independentWitness : PCCW.PhysicsClosureCoreWitness
    shiftConstructorTheorem : PCCT.PhysicsClosureConstructorTheorem
    independentConstructorTheorem : PCCT.PhysicsClosureConstructorTheorem
    independentFromShift :
      IndependentFromShift independentWitness

  shiftClosure : PCF.PhysicsClosureFull
  shiftClosure =
    PCCT.PhysicsClosureConstructorTheorem.fullClosure
      shiftConstructorTheorem

  independentClosure : PCF.PhysicsClosureFull
  independentClosure =
    PCCT.PhysicsClosureConstructorTheorem.fullClosure
      independentConstructorTheorem

canonicalShiftConstructorTheorem :
  PCCT.PhysicsClosureConstructorTheorem
canonicalShiftConstructorTheorem =
  PCCT.canonicalPhysicsClosureConstructorTheorem

realizationIndependenceTheoremFromWitnesses :
  (wShift : PCCW.PhysicsClosureCoreWitness) →
  (wIndependent : PCCW.PhysicsClosureCoreWitness) →
  IndependentFromShift wIndependent →
  PhysicsClosureRealizationIndependenceTheorem
realizationIndependenceTheoremFromWitnesses wShift wIndependent independence =
  record
    { shiftWitness = wShift
    ; independentWitness = wIndependent
    ; shiftConstructorTheorem =
        PCCT.physicsClosureConstructorTheorem wShift
    ; independentConstructorTheorem =
        PCCT.physicsClosureConstructorTheorem wIndependent
    ; independentFromShift = independence
    }

canonicalShiftWitness :
  PCCW.PhysicsClosureCoreWitness
canonicalShiftWitness = PCFI.physicsClosureCoreWitness
