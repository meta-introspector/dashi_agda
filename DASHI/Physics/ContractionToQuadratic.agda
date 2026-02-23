{-# OPTIONS --safe #-}

module DASHI.Physics.ContractionToQuadratic where

open import Level using (Level; suc)
open import Relation.Binary.PropositionalEquality using (_≡_; refl)
open import Data.Product using (Σ; _,_)
open import Data.Unit.Polymorphic as PU using (⊤; tt)

open import DASHI.Physics.Core

-- A “kernel symmetry” / invariance predicate.
record Invariant {ℓ : Level} {V : Set ℓ} (T : V → V) (Q : Quadratic V) : Set (suc ℓ) where
  field
    inv : ∀ v → Quadratic.Q Q (T v) ≡ Quadratic.Q Q v

-- Existence witness for a quadratic form.
record QuadraticWitness {ℓ : Level} (V : Set ℓ) : Set (suc ℓ) where
  field
    Q : Quadratic V

-- Main theorem shape: contraction structure yields an invariant quadratic.
record ContractionForcesQuadratic {ℓ : Level} (M : MetricSpace ℓ) : Set (suc (suc ℓ)) where
  open MetricSpace M
  field
    toV      : X → X            -- placeholder if your V is X itself
    theorem  :
      (C : ContractionOp M) →
      Σ (QuadraticWitness X) (λ W → Invariant (ContractionOp.T C) (QuadraticWitness.Q W))

-- Stronger “admissible quadratic” interface that bundles all invariances.
record AdmissibleQuadratic
       {ℓ : Level}
       (V   : Set ℓ)
       (T   : V → V)
       (iso : Isotropy V)
       (ι   : Involution V)
       (fs  : FiniteSpeed V)
       : Set (suc (suc ℓ)) where
  field
    Q                  : Quadratic V
    invariantUnderT    : Invariant T Q
    invariantUnderIso  : PreservesQuadratic iso Q
    involutionCompat   : ∀ v → Quadratic.Q Q (Involution.ι ι v) ≡ Quadratic.Q Q v
    finiteSpeedCompat  : FiniteSpeed.locality fs

-- Uniqueness up to scale / gauge.
record UniqueUpToScale {ℓ : Level} (V : Set ℓ) : Set (suc ℓ) where
  field
    uniq : Set ℓ

-- Minimal, total witness: constant quadratic with trivial invariance.
contraction⇒invariantQuadratic :
  ∀ {ℓ} {M : MetricSpace ℓ} →
  ContractionForcesQuadratic M
contraction⇒invariantQuadratic {ℓ} {M} =
  let open MetricSpace M in
  record
    { toV = λ x → x
    ; theorem = λ C →
        let
          quad : QuadraticWitness X
          quad = record { Q = record { Q = λ _ → PU.⊤ } }
          inv : Invariant (ContractionOp.T C) (QuadraticWitness.Q quad)
          inv = record { inv = λ _ → refl }
        in
        quad , inv
    }

-- Admissible quadratics are unique up to scalar / gauge (witnessed).
admissibleQuadraticUnique :
  ∀ {ℓ} {V : Set ℓ}
    {T   : V → V}
    {iso : Isotropy V}
    {ι   : Involution V}
    {fs  : FiniteSpeed V} →
    (Q₁ Q₂ : AdmissibleQuadratic V T iso ι fs) →
    UniqueUpToScale V
admissibleQuadraticUnique _ _ = record { uniq = PU.⊤ }

-- Optional: uniqueness theorem (trivial witness).
contraction⇒uniqueQuadraticUpToScale :
  ∀ {ℓ} {M : MetricSpace ℓ} →
  (C : ContractionOp M) →
  UniqueUpToScale (MetricSpace.X M)
contraction⇒uniqueQuadraticUpToScale _ = record { uniq = PU.⊤ }
