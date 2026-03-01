module DASHI.Physics.DimensionBoundAssumptionsPostulates where

open import Agda.Builtin.Equality using (_≡_)
open import Agda.Builtin.Nat using (Nat; zero; suc)
open import Data.Nat using (_≤_)
open import Data.Nat.Properties as NatP using (≤-refl)
open import Data.Product using (_×_; _,_)

open import DASHI.Physics.RealTernaryCarrier as RTC
open import DASHI.Physics.DimensionBoundAssumptions as DBA
open import DASHI.Physics.OrbitProfileExternal as OPE
open import DASHI.Physics.ShellOrbitProfileGenerator as SOPG
open import Relation.Binary.PropositionalEquality using (subst)

-- Dimension-bound theorem seam (assumption module).
isotropyShellProfile :
  ∀ {m : Nat}
  (B : RTC.Carrier m → RTC.Carrier m → Nat)
  (S : DBA.IndefiniteSignature B)
  → DBA.ShellOrbitProfile m
isotropyShellProfile {m} _ _ with m
... | zero = SOPG.profileFromSorted {m = zero} []
... | suc zero = SOPG.profileFromSorted {m = suc zero} []
... | suc (suc zero) = OPE.orbitProfile-m2
... | suc (suc (suc zero)) = OPE.orbitProfile-m3
... | suc (suc (suc (suc zero))) = OPE.orbitProfile-m4
... | suc (suc (suc (suc (suc zero)))) = OPE.orbitProfile-m5
... | suc (suc (suc (suc (suc (suc zero))))) = OPE.orbitProfile-m6
... | suc (suc (suc (suc (suc (suc (suc zero)))))) = OPE.orbitProfile-m7
... | suc (suc (suc (suc (suc (suc (suc (suc zero))))))) = OPE.orbitProfile-m8
... | m' = SOPG.profileFromSorted {m = m'} []

postulate
  OrbitProfile-24-6-2→m≡4 :
    ∀ {m : Nat}
    (B : RTC.Carrier m → RTC.Carrier m → Nat)
    (S : DBA.IndefiniteSignature B)
    → DBA.ShellOrbitProfile.orbitCount (isotropyShellProfile B S) ≡ 3
    → DBA.ShellOrbitProfile.top1       (isotropyShellProfile B S) ≡ 24
    → DBA.ShellOrbitProfile.top2       (isotropyShellProfile B S) ≡ 6
    → DBA.ShellOrbitProfile.top3       (isotropyShellProfile B S) ≡ 2
    → m ≡ 4

  m≡4→sig≡1+3-up-to-swap :
    ∀ (B : RTC.Carrier 4 → RTC.Carrier 4 → Nat)
      (S : DBA.IndefiniteSignature B)
    → (DBA.IndefiniteSignature.sig S ≡ (1 , 3)) × (DBA.IndefiniteSignature.sig S ≡ (3 , 1))

OrbitProfile-24-6-2→m≤4 :
  ∀ {m : Nat}
  (B : RTC.Carrier m → RTC.Carrier m → Nat)
  (S : DBA.IndefiniteSignature B)
  → DBA.ShellOrbitProfile.orbitCount (isotropyShellProfile B S) ≡ 3
  → DBA.ShellOrbitProfile.top1       (isotropyShellProfile B S) ≡ 24
  → DBA.ShellOrbitProfile.top2       (isotropyShellProfile B S) ≡ 6
  → DBA.ShellOrbitProfile.top3       (isotropyShellProfile B S) ≡ 2
  → m ≤ 4
OrbitProfile-24-6-2→m≤4 {m} B S oc t1 t2 t3 =
  subst (λ k → k ≤ 4) (OrbitProfile-24-6-2→m≡4 B S oc t1 t2 t3) NatP.≤-refl
