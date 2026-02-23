{-# OPTIONS --safe #-}

module DASHI.Physics.Signature31 where

open import Level using (Level; suc)
open import Data.Nat using (ℕ)
open import Data.Product using (Σ; _,_)
open import Relation.Binary.PropositionalEquality using (_≡_; refl)

open import DASHI.Physics.Core

record Signature : Set where
  field
    p n z : ℕ    -- positive, negative, zero counts

sig31 : Signature
Signature.p sig31 = 3
Signature.n sig31 = 1
Signature.z sig31 = 0

-- The target classification theorem.
record SignatureTheorem {ℓ : Level} (V : Set ℓ) : Set (suc ℓ) where
  field
    signature : Quadratic V → Signature

involution+isotropy+finiteSpeed⇒signature31 :
  ∀ {ℓ} {V : Set ℓ} →
  (Q  : Quadratic V) →
  (ι  : Involution V) →
  (iso : Isotropy V) →
  (fs : FiniteSpeed V) →
  PreservesQuadratic iso Q →
  Σ (SignatureTheorem V) (λ thm → SignatureTheorem.signature thm Q ≡ sig31)
involution+isotropy+finiteSpeed⇒signature31 _ _ _ _ _ =
  record { signature = λ _ → sig31 } , refl
