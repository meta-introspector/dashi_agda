module DASHI.Arithmetic.PartialResult where

open import Agda.Builtin.Equality using (_≡_)
open import Agda.Builtin.Nat using (Nat)
open import Data.Nat using (_≤_)

open import DASHI.Arithmetic.GlobalPressure using
  ( GlobalPressureStructure
  ; globalPressureStructure
  ; totalPressure
  ; wallPressure
  ; totalPressure≡wallPressure
  )
open import DASHI.Arithmetic.TrackedSupport using
  ( TrackedSupportStructure
  ; trackedSupportStructure
  ; trackedSupport
  ; totalPressure≤trackedSupport
  )
open import DASHI.Arithmetic.WeightedPressure using
  ( WeightedPressureStructure
  ; weightedPressureStructure
  ; weightedPressure
  ; weightedSupport
  ; weightedPressure≤weightedSupport
  )
open import DASHI.Arithmetic.ActiveWallStructure using
  ( ActiveWallStructure
  ; activeWallStructure
  ; activeWallCount
  ; supportPrimeCount
  ; activeWallCount≤supportPrimeCount
  )
open import DASHI.Arithmetic.ActiveWallBounds using
  ( ActiveWallBoundStructure
  ; activeWallBoundStructure
  ; activeWallScaledPressure
  ; totalPressure≤activeWallScaledPressure
  )
open import DASHI.Arithmetic.DeltaGrowth using
  ( DeltaGrowthStructure
  ; deltaGrowthStructure
  )
open import DASHI.Arithmetic.DeltaRarity using
  ( DeltaRarityStructure
  ; deltaRarityStructure
  ; largeDeltaCount2
  ; largeDeltaCount2≤supportPrimeCount
  )

------------------------------------------------------------------------
-- Strongest honest partial result currently supported by the repo.
--
-- This packages the already-landed theorem family:
--   - totalPressure ≡ wallPressure
--   - totalPressure ≤ trackedSupport
--   - weightedPressure ≤ weightedSupport
--
-- It does not mention the radical comparison, which remains the open gap.

record PartialResultSurface : Set₁ where
  field
    wallStructure : GlobalPressureStructure
    trackedStructure : TrackedSupportStructure
    weightedStructure : WeightedPressureStructure
    activeWallStructure' : ActiveWallStructure
    activeWallBounds : ActiveWallBoundStructure
    deltaGrowth : DeltaGrowthStructure
    deltaRarity : DeltaRarityStructure
    wallDecomposition :
      ∀ x y →
      totalPressure x y ≡ wallPressure x y
    activeWallSubset :
      ∀ x y →
      activeWallCount x y ≤ supportPrimeCount x y
    activeWallScaledBound :
      ∀ x y →
      totalPressure x y ≤ activeWallScaledPressure x y
    largeDeltaThreshold2Subset :
      ∀ x y →
      largeDeltaCount2 x y ≤ supportPrimeCount x y
    trackedGlobalBound :
      ∀ x y →
      totalPressure x y ≤ trackedSupport x y
    weightedGlobalBound :
      ∀ x y →
      weightedPressure x y ≤ weightedSupport x y

open PartialResultSurface public

partialResultSurface : PartialResultSurface
partialResultSurface = record
  { wallStructure = globalPressureStructure
  ; trackedStructure = trackedSupportStructure
  ; weightedStructure = weightedPressureStructure
  ; activeWallStructure' = activeWallStructure
  ; activeWallBounds = activeWallBoundStructure
  ; deltaGrowth = deltaGrowthStructure
  ; deltaRarity = deltaRarityStructure
  ; wallDecomposition = totalPressure≡wallPressure
  ; activeWallSubset = activeWallCount≤supportPrimeCount
  ; activeWallScaledBound = totalPressure≤activeWallScaledPressure
  ; largeDeltaThreshold2Subset = largeDeltaCount2≤supportPrimeCount
  ; trackedGlobalBound = totalPressure≤trackedSupport
  ; weightedGlobalBound = weightedPressure≤weightedSupport
  }

------------------------------------------------------------------------
-- Convenience re-exports for consumers that want the theorem bundle
-- without unpacking the record.

wallOnlyDecomposition :
  ∀ x y →
  totalPressure x y ≡ wallPressure x y
wallOnlyDecomposition = totalPressure≡wallPressure

trackedUnweightedBound :
  ∀ x y →
  totalPressure x y ≤ trackedSupport x y
trackedUnweightedBound = totalPressure≤trackedSupport

weightedBound :
  ∀ x y →
  weightedPressure x y ≤ weightedSupport x y
weightedBound = weightedPressure≤weightedSupport

activeWallSubsetSupport :
  ∀ x y →
  activeWallCount x y ≤ supportPrimeCount x y
activeWallSubsetSupport = activeWallCount≤supportPrimeCount

activeWallScaledGlobalBound :
  ∀ x y →
  totalPressure x y ≤ activeWallScaledPressure x y
activeWallScaledGlobalBound = totalPressure≤activeWallScaledPressure

largeDeltaThreshold2Support :
  ∀ x y →
  largeDeltaCount2 x y ≤ supportPrimeCount x y
largeDeltaThreshold2Support = largeDeltaCount2≤supportPrimeCount
