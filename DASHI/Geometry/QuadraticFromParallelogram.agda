module DASHI.Geometry.QuadraticFromParallelogram where

open import Data.Product using (Σ; _,_)

record QuadraticForm (A : Set) : Set₁ where
  field
    Q : A → Set

record InnerProduct (A : Set) : Set₁ where
  field
    ⟨_,_⟩ : A → A → Set

record Parallelogram⇒Quadratic (A : Set) : Set₁ where
  field
    theorem :
      (E : A → Set) →
      (par : Set) →
      Σ (QuadraticForm A) (λ QF → Set)
