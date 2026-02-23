{-# OPTIONS --safe #-}

module DASHI.Physics.DecimationToClifford where

open import Level using (Level; suc)
open import Data.Product using (Σ; _,_)
open import Relation.Binary.PropositionalEquality using (_≡_; refl)

open import DASHI.Physics.Core

-- Abstract algebra with multiplication.
record Algebra {ℓ : Level} : Set (suc ℓ) where
  field
    A   : Set ℓ
    _·_ : A → A → A

-- Decimation algebra interface (kernel algebra / RG algebra).
record DecimationAlgebra {ℓ : Level} (V : Set ℓ) : Set (suc ℓ) where
  field
    A    : Set ℓ
    mul  : A → A → A
    gen  : V → A
    -- add your decimation relations/axioms here

-- Clifford relations: gen(v)·gen(v) = Q(v)·1 (abstractly encoded).
record CliffordRelations {ℓ : Level} (V : Set ℓ) (Q : Quadratic V) (D : DecimationAlgebra V) : Set (suc (suc ℓ)) where
  open DecimationAlgebra D
  field
    rel : Set (suc ℓ)   -- supply concrete relation later

-- Universal property: any algebra satisfying relations factors uniquely.
record UniversalClifford {ℓ : Level} (V : Set ℓ) (Q : Quadratic V) : Set (suc ℓ) where
  field
    Cl     : Set ℓ
    embed  : V → Cl
    -- factorization property left abstract for now

decimation⇒clifford :
  ∀ {ℓ} {V : Set ℓ} (Q : Quadratic V) →
  (D : DecimationAlgebra V) →
  CliffordRelations V Q D →
  UniversalClifford V Q
decimation⇒clifford _ D _ =
  record { Cl = DecimationAlgebra.A D ; embed = DecimationAlgebra.gen D }
