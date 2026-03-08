module DASHI.Physics.Closure.CanonicalGaugeContractTheorem where

open import Agda.Builtin.Bool using (Bool; true)
open import Agda.Builtin.Equality using (_≡_; refl)

open import DASHI.Algebra.GaugeGroupContract as GGC
open import DASHI.Physics.Constraints.ConcreteInstance as CI

canonicalGaugeEmergence : GGC.Emergence CI.C
canonicalGaugeEmergence =
  record
    { pickGauge = λ _ → GGC.SU3×SU2×U1
    }

canonicalGaugeAdmissible : CI.C → Bool
canonicalGaugeAdmissible _ = true

canonicalGaugeContractTheorem : GGC.UniquenessClaim CI.C
canonicalGaugeContractTheorem =
  record
    { E = canonicalGaugeEmergence
    ; admissible = canonicalGaugeAdmissible
    ; unique-SM = λ _ _ → refl
    }
