module DASHI.Physics.SeverityGuardShiftConcrete where

open import Agda.Builtin.Nat using (Nat; _+_)
open import Relation.Binary.PropositionalEquality using (_≡_; refl)
open import Relation.Nullary using (yes; no)
open import Data.Vec using (Vec)
open import Data.Vec.Base using (lookup)
open import Data.Fin using (Fin; fromℕ<)
open import Data.Nat.Properties as NatP using (_≤?_)
open import Data.Nat using (_<_ ; _≤_; z≤n; suc)

open import DASHI.Algebra.Trit using (Trit; zer)
open import DASHI.Physics.RealTernaryCarrier as RTC
open import DASHI.Physics.TailCollapseProof as TCP
open import DASHI.Physics.SeverityMapping as SM
open import DASHI.Physics.MaassRestorationShift as MR using (restoreᵣ; restore-fixes; restore-idem; tailOf-restore)
open import DASHI.Physics.SeverityGuardShiftWiring as W
open import DASHI.Physics.SeverityGuard as SG
open import DASHI.Geometry.LCP.Stream using (Stream; lcp≥)
open import UFTC_Lattice using (Code; normal; severity)
open import DASHI.Physics.Closure.MDLTradeoffShiftInstance as MSI

-- Stream view for LCP: constant stream from severity code.
-- Replace with a true coordinate stream if you want LCP to reflect tail structure.
tritCode : Trit → Code
tritCode zer = normal 0
tritCode _   = normal 1

projᵣ : ∀ {m k : Nat} → RTC.Carrier (m + k) → Stream Code
projᵣ {m} {k} x i with NatP._≤?_ (suc i) k
... | yes i<k = tritCode (lookup (TCP.tailOf m k x) (fromℕ< i<k))
... | no _    = normal 0

policyᵣ : ∀ {m k : Nat} → SG.SeverityPolicy (RTC.Carrier (m + k))
policyᵣ {m} {k} = record
  { code = SM.codeᵣ {m} {k}
  ; safeThreshold = SM.safeThresholdᵣ
  ; brokenThreshold = SM.brokenThresholdᵣ
  }

-- Guarded strictness for Pᵣ under severity guard.
-- This is the remaining seam: replace with a proof using your LCP lemmas.
postulate
  P-strict-on :
    ∀ {m k : Nat} {x y : RTC.Carrier (m + k)} {k′ : Nat} →
    SG.Guard (policyᵣ {m} {k}) x →
    SG.Guard (policyᵣ {m} {k}) y →
    lcp≥ (projᵣ {m} {k} x) (projᵣ {m} {k} y) k′ →
    lcp≥ (projᵣ {m} {k} (TCP.Pᵣ {m} {k} x)) (projᵣ {m} {k} (TCP.Pᵣ {m} {k} y)) (k′ + 1)

restore-normal-form'' :
  ∀ {m k : Nat} (x : RTC.Carrier (m + k)) →
  SG.Broken (policyᵣ {m} {k}) x →
  SG.Guard (policyᵣ {m} {k}) (MR.restoreᵣ {m} {k} x)
restore-normal-form'' {m} {k} x _ rewrite MR.tailOf-restore {m} {k} x | MSI.countNZ-replicate-zer {k} =
  -- Guard is severity ≤ safeThreshold; for restored state severity is 0.
  z≤n

-- reuse restoration laws from MaassRestorationShift
-- reuse restoration laws from MaassRestorationShift directly

-- Concrete wiring bundle.
shiftWiring : ∀ {m k : Nat} → W.ShiftSeverityGuardWiring {m} {k}
shiftWiring {m} {k} = record
  { policyᵣ' = policyᵣ {m} {k}
  ; Pᵣ' = TCP.Pᵣ {m} {k}
  ; Restoreᵣ' = MR.restoreᵣ {m} {k}
  ; projᵣ' = projᵣ {m} {k}
  ; κ' = 1
  ; P-strict-on' = P-strict-on {m} {k}
  ; restore-normal-form' = restore-normal-form'' {m} {k}
  ; restore-idem' = MR.restore-idem {m} {k}
  ; restore-fixes' = MR.restore-fixes {m} {k}
  }
