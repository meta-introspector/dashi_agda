module DASHI.Physics.RealOperatorStackShift where

open import Agda.Builtin.Equality using (_≡_)
open import Agda.Builtin.Nat using (Nat; _+_)
open import DASHI.Physics.TailCollapseProof as TCP
open import DASHI.Physics.RealTernaryCarrier as RTC
open import DASHI.Metric.FineAgreementUltrametric as FAM
open import DASHI.Geometry.StrictContractionComposition as SCC
open import DASHI.Geometry.FiberContraction as FC
open import Ultrametric as UMetric
open import Contraction using (_≢_)
open import Relation.Binary.PropositionalEquality using (sym; subst)
open import Data.Nat using (_<_)

C : ∀ {m k : Nat} → RTC.Carrier (m + k) → RTC.Carrier (m + k)
C x = x

P : ∀ {m k : Nat} → RTC.Carrier (m + k) → RTC.Carrier (m + k)
P {m} {k} = TCP.Pᵣ {m} {k}

R : ∀ {m k : Nat} → RTC.Carrier (m + k) → RTC.Carrier (m + k)
R {m} {k} = TCP.Rᵣ {m} {k}

postulate
  nonexpC : ∀ {m k : Nat} → SCC.NonExpansive (FAM.ultrametricVec {n = m + k}) (C {m} {k})
  nonexpR : ∀ {m k : Nat} → SCC.NonExpansive (FAM.ultrametricVec {n = m + k}) (R {m} {k})

strictP-fiber :
  ∀ {m k : Nat} →
  FC.ContractiveOnFibers (FAM.ultrametricVec {n = m + k}) (P {m} {k})
strictP-fiber {m} {k} =
  record
    { contractFiber = λ {x} {y} fd →
        let
          open UMetric.Ultrametric (FAM.ultrametricVec {n = m + k})
          open FC.FiberDistinct fd using (x≢y; sameFiber)
          d0 : d (P {m} {k} x) (P {m} {k} y) ≡ 0
          d0 = subst (λ z → d (P {m} {k} x) z ≡ 0) sameFiber (id-zero (P {m} {k} x))
        in
        subst (λ u → u < d x y) (sym d0) (FAM.dNatFine-positive x≢y)
    }
