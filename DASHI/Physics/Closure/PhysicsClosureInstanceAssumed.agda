module DASHI.Physics.Closure.PhysicsClosureInstanceAssumed where

open import Data.Unit as DU using (⊤; tt)
open import DASHI.Physics.Closure.OrthogonalityZLift as OZ
open import Data.Product using (_,_)
open import Relation.Binary.PropositionalEquality using (refl)

open import DASHI.Physics.Closure.PhysicsClosure as PC
open import DASHI.Physics.MyRealInstance as MRI
open import DASHI.Geometry.QuadraticFormFromProjection as QFP
open import DASHI.Geometry.SignatureUniqueness31 as SU
import DASHI.Physics.Signature31FromShiftOrbitProfile as S31OP
open import DASHI.Physics.Constraints.Generators as CG
open import DASHI.Physics.Constraints.Bracket as CB
open import DASHI.Physics.Constraints.Closure as CC
open import Data.Nat using (zero; z≤n)
open import MDL as OldMDL
open import DASHI.Physics.UniversalityTheorem as UTH
open import DASHI.Physics.RealClosureKit as RK

mdlLyapTrivial : ∀ {S : Set} (T : S → S) → OldMDL.Lyapunov T
mdlLyapTrivial T =
  record
    { L = λ _ → zero
    ; descent = λ _ → z≤n
    }

-- Concrete instance: wires the Bool closure stack into PhysicsClosure,
-- using the concrete shift-orbit theorem path.
physicsClosureAssumed : PC.PhysicsClosure
physicsClosureAssumed =
  record
    { kit = MRI.myKit
    ; metricEmergence = record
        { build = λ {A} PD → record
            { A = A
            ; Q = λ _ → 0
            ; parallelogram = record { paral = ⊤ }
            }
        }
    ; orthogonalityZ = λ {m} → OZ.orthogonalityZLift {m}
    ; signature31 = S31OP.signature31-theorem
    ; CS = record
        { Constraint = ⊤
        ; actsOn = λ X → X
        ; apply = λ {S} _ x → x
        }
    ; L = record
        { _[_,]_ = λ _ _ → tt
        ; antisym = ⊤
        ; jacobi = ⊤
        }
    ; constraintClosure = record { closes = λ _ _ → (tt , refl) }
    ; mdlLyap = λ {S} T → mdlLyapTrivial T
    ; universality = UTH.canonicalUniversality (RK.RealClosureKit.C MRI.myKit)
    }

physicsClosureAssumedDefault : PC.PhysicsClosure
physicsClosureAssumedDefault = physicsClosureAssumed
