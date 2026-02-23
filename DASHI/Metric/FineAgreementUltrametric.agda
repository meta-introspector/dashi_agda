module DASHI.Metric.FineAgreementUltrametric where

open import Agda.Builtin.Nat using (Nat)
open import Agda.Builtin.Equality using (_≡_)
open import Contraction using (_≢_)
open import Relation.Binary.PropositionalEquality using (cong; trans; sym)
open import Data.Nat using (_<_)
open import Data.Vec using (Vec; map)
open import Data.Vec.Base using (reverse)
open import Data.Vec.Properties using (map-reverse; reverse-injective)
open import Ultrametric as UMetric
open import DASHI.Algebra.Trit using (Trit; inv)
import DASHI.Metric.AgreementUltrametric as AM

-- Fine agreement metric: use agreement depth on reversed vectors (suffix agreement).
agreeDepthFine : ∀ {n : Nat} → Vec Trit n → Vec Trit n → Nat
agreeDepthFine x y = AM.agreeDepth (reverse x) (reverse y)

dNatFine : ∀ {n : Nat} → Vec Trit n → Vec Trit n → Nat
dNatFine x y = AM.dNat (reverse x) (reverse y)

dNatFine-inv :
  ∀ {n : Nat} (x y : Vec Trit n) →
  dNatFine (map inv x) (map inv y) ≡ dNatFine x y
dNatFine-inv x y =
  let
    rx = reverse x
    ry = reverse y
    rx-inv : reverse (map inv x) ≡ map inv rx
    rx-inv = sym (map-reverse inv x)
    ry-inv : reverse (map inv y) ≡ map inv ry
    ry-inv = sym (map-reverse inv y)
  in
  trans
    (cong (λ a → AM.dNat a (reverse (map inv y))) rx-inv)
    (trans
      (cong (λ b → AM.dNat (map inv rx) b) ry-inv)
      (AM.dNat-inv rx ry)
    )

reverse≢ : ∀ {n : Nat} {x y : Vec Trit n} → x ≢ y → reverse x ≢ reverse y
reverse≢ x≢y rev≡ = x≢y (reverse-injective rev≡)

dNatFine-zero→eq :
  ∀ {n : Nat} (x y : Vec Trit n) → dNatFine x y ≡ 0 → x ≡ y
dNatFine-zero→eq x y d≡0 =
  reverse-injective (AM.dNat-zero→eq (reverse x) (reverse y) d≡0)

dNatFine-positive :
  ∀ {n : Nat} {x y : Vec Trit n} → x ≢ y → 0 < dNatFine x y
dNatFine-positive x≢y = AM.dNat-positive (reverse≢ x≢y)

ultrametricVec : ∀ {n : Nat} → UMetric.Ultrametric (Vec Trit n)
ultrametricVec {n} =
  record
    { d = dNatFine
    ; id-zero = λ x → UMetric.Ultrametric.id-zero AM.ultrametricVec (reverse x)
    ; symmetric = λ x y → UMetric.Ultrametric.symmetric AM.ultrametricVec (reverse x) (reverse y)
    ; ultratriangle = λ x y z → UMetric.Ultrametric.ultratriangle AM.ultrametricVec (reverse x) (reverse y) (reverse z)
    }
