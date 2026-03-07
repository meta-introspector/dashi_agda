module DASHI.Geometry.ConeTimeIsotropy where

open import Level using (Level; suc; _⊔_)
open import Data.Product using (Σ; _,_)
open import Data.Unit using (⊤; tt)
open import Agda.Builtin.Nat using (Nat)
open import Data.List using (List)

open import DASHI.Geometry.QuadraticForm

record ConeStructure {ℓv} (V : Set ℓv) : Set (suc ℓv) where
  field
    Cone : V → Set ℓv
    ConeNontrivial : ⊤

open ConeStructure public

record TimeArrow {ℓv} (V : Set ℓv) : Set (suc ℓv) where
  field
    _≺_ : V → V → Set ℓv
    Irreflexive : ∀ (x : V) → ⊤
    Transitive  : ∀ (x y z : V) → ⊤

open TimeArrow public

record IsotropyAction {ℓv} (V : Set ℓv) : Set (suc ℓv) where
  field
    G     : Set ℓv
    _•_   : G → V → V
    PresCone : ∀ (g : G) (x : V) → ⊤
    PresQ    : ∀ (g : G) (x : V) → ⊤

open IsotropyAction public

record ShellStructure {ℓv} (V : Set ℓv) : Set (suc ℓv) where
  field
    Shell1 : V → Set ℓv
    Shell2 : V → Set ℓv

open ShellStructure public

record AdmissibleMove {ℓv} (V : Set ℓv) : Set (suc ℓv) where
  field
    _↦_ : V → V → Set ℓv

open AdmissibleMove public

record ShellIsotropyAction {ℓv} (V : Set ℓv)
  (ShellS : ShellStructure V) (Iso : IsotropyAction V) : Set (suc ℓv) where
  field
    PresShell1 : ∀ (g : IsotropyAction.G Iso) (x : V) → ⊤
    PresShell2 : ∀ (g : IsotropyAction.G Iso) (x : V) → ⊤

open ShellIsotropyAction public

record ShellOrbitEnumeration : Set where
  field
    shell1OrbitSizes : List Nat
    shell2OrbitSizes : List Nat

open ShellOrbitEnumeration public

record OrbitProfileData : Set where
  field
    orientationTag : Nat
    shell1Profile  : List Nat
    shell2Profile  : List Nat

open OrbitProfileData public

data Signature : Set where
  sig31 : Signature
  sig13 : Signature
  other : Signature
