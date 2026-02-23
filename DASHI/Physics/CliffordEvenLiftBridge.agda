module DASHI.Physics.CliffordEvenLiftBridge where

open import Agda.Builtin.Equality using (_≡_)
open import DASHI.Physics.ContractionQuadraticBridge as CQ

record Clifford (V : Set) (Scalar : Set) : Set₁ where
  field
    Cl : Set
    embed : V → Cl
    rel : Set
    universal : Set

record Quadratic⇒Clifford : Set₁ where
  field
    build : (out : CQ.QuadraticOutput) → Clifford (CQ.V out) (CQ.Scalar out)

record EvenSubalgebra (Cl : Set) : Set₁ where
  field
    Even : Set
    incl : Even → Cl
    closed : Set

record WaveLift⇒Even : Set₁ where
  field
    buildEven : ∀ {V Scalar} → (Cℓ : Clifford V Scalar) → EvenSubalgebra (Clifford.Cl Cℓ)

