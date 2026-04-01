module DASHI.Physics.Closure.ExecutionContract where

open import Agda.Primitive using (Level; lsuc; _⊔_)
open import Agda.Builtin.Nat using (Nat)
open import Data.Nat using (_≤_)
open import Data.Product using (_×_; _,_)

-- Generic execution contract for a single step. The cone check is evaluated
-- on projected deltas rather than absolute states.
record ExecutionContract
  {ℓx ℓs ℓδ ℓπ ℓe : Level} : Set (lsuc (ℓx ⊔ ℓs ⊔ ℓδ ⊔ ℓπ ⊔ ℓe)) where
  field
    State : Set ℓx
    Source : Set ℓs
    ΔState : Set ℓδ
    ΔSource : Set ℓπ
    Eigen : Set ℓe

    π : State → Source
    Δ : State → State → ΔState
    projectΔ : ΔState → ΔSource

    ArrowOK : State → State → Set (ℓx ⊔ ℓs ⊔ ℓδ ⊔ ℓπ ⊔ ℓe)
    ConeOK : ΔSource → Set (ℓx ⊔ ℓs ⊔ ℓδ ⊔ ℓπ ⊔ ℓe)
    mdl : State → Nat
    Basin : Source → Set (ℓx ⊔ ℓs ⊔ ℓδ ⊔ ℓπ ⊔ ℓe)
    eigenOf : Source → Eigen
    eigenOverlap : Eigen → Eigen → Nat
    overlapFloor : Nat

  ArrowAdmissible : State → State → Set (ℓx ⊔ ℓs ⊔ ℓδ ⊔ ℓπ ⊔ ℓe)
  ArrowAdmissible x x' = ArrowOK x x'

  ConeAdmissible : State → State → Set (ℓx ⊔ ℓs ⊔ ℓδ ⊔ ℓπ ⊔ ℓe)
  ConeAdmissible x x' = ConeOK (projectΔ (Δ x x'))

  MDLAdmissible : State → State → Set
  MDLAdmissible x x' = mdl x' ≤ mdl x

  BasinAdmissible : State → State → Set (ℓx ⊔ ℓs ⊔ ℓδ ⊔ ℓπ ⊔ ℓe)
  BasinAdmissible x x' = Basin (π x) × Basin (π x')

  EigenAdmissible : State → State → Set
  EigenAdmissible x x' = overlapFloor ≤ eigenOverlap (eigenOf (π x)) (eigenOf (π x'))

  AdmissibleStep : State → State → Set (ℓx ⊔ ℓs ⊔ ℓδ ⊔ ℓπ ⊔ ℓe)
  AdmissibleStep x x' =
    ArrowAdmissible x x'
    × ConeAdmissible x x'
    × MDLAdmissible x x'
    × BasinAdmissible x x'
    × EigenAdmissible x x'

open ExecutionContract public
