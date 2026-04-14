module DASHI.Arithmetic.DeltaInteraction where

open import Agda.Builtin.Equality using (_≡_)
open import Agda.Builtin.Nat using (Nat; _+_; _*_)
open import Data.Empty using (⊥)
open import Data.Nat.Base using (NonZero)
open import Data.Nat using (_≤_)
open import Data.Nat.Divisibility using (_∣_; ∣⇒≤)

open import MonsterOntos using (SSP; toNat)

open import DASHI.Arithmetic.ArithmeticIntegerEmbedding using (deltaAt)
open import DASHI.Arithmetic.DeltaGrowth using
  ( pow
  ; deltaPowerDividesSum
  ; deltaPower≤sum
  )

------------------------------------------------------------------------
-- Two-prime interaction over the tracked carrier.
--
-- The honest local surface is:
--   * single-lane divisibility / size bounds, already proved in DeltaGrowth
--   * one distinct-lane product divisibility helper, isolated here
--   * the corresponding shared-size budget corollary
--
-- The distinct-lane product step is the only missing arithmetic helper.

_≢_ : SSP → SSP → Set
p ≢ q = p ≡ q → ⊥

singlePrimePowerDividesSum :
  ∀ p x y →
  pow (toNat p) (deltaAt p x y) ∣ (x + y)
singlePrimePowerDividesSum = deltaPowerDividesSum

singlePrimePowerBound :
  ∀ p x y →
  .{{_ : NonZero (x + y)}} →
  pow (toNat p) (deltaAt p x y) ≤ (x + y)
singlePrimePowerBound = deltaPower≤sum

postulate
  distinctPrimePowerProductDividesSum :
    ∀ p q x y →
    p ≢ q →
    (pow (toNat p) (deltaAt p x y) * pow (toNat q) (deltaAt q x y)) ∣ (x + y)

twoPrimeInteractionBudget :
  ∀ p q x y →
  .{{_ : NonZero (x + y)}} →
  p ≢ q →
  (pow (toNat p) (deltaAt p x y) * pow (toNat q) (deltaAt q x y)) ≤ (x + y)
twoPrimeInteractionBudget p q x y p≢q =
  ∣⇒≤ (distinctPrimePowerProductDividesSum p q x y p≢q)

record DeltaInteractionSurface : Set₁ where
  field
    oneLaneDivides :
      ∀ p x y →
      pow (toNat p) (deltaAt p x y) ∣ (x + y)
    oneLaneBound :
      ∀ p x y →
      .{{_ : NonZero (x + y)}} →
      pow (toNat p) (deltaAt p x y) ≤ (x + y)
    twoLaneDivides :
      ∀ p q x y →
      p ≢ q →
      (pow (toNat p) (deltaAt p x y) * pow (toNat q) (deltaAt q x y)) ∣ (x + y)
    twoLaneBound :
      ∀ p q x y →
      .{{_ : NonZero (x + y)}} →
      p ≢ q →
      (pow (toNat p) (deltaAt p x y) * pow (toNat q) (deltaAt q x y)) ≤ (x + y)

open DeltaInteractionSurface public

deltaInteractionSurface : DeltaInteractionSurface
deltaInteractionSurface = record
  { oneLaneDivides = singlePrimePowerDividesSum
  ; oneLaneBound = singlePrimePowerBound
  ; twoLaneDivides = distinctPrimePowerProductDividesSum
  ; twoLaneBound = twoPrimeInteractionBudget
  }
