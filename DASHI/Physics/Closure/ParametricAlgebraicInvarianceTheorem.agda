module DASHI.Physics.Closure.ParametricAlgebraicInvarianceTheorem where

open import Agda.Primitive using (Setω)
open import Agda.Builtin.Bool using (true)
open import Agda.Builtin.Equality using (_≡_)

open import DASHI.Physics.Closure.CanonicalConstraintGaugePackage as CCGP
open import DASHI.Physics.Closure.ParametricAlgebraicPersistenceTheorem as PACTP

record ParametricAlgebraicInvarianceTheorem
  (P : CCGP.CanonicalConstraintGaugePackage) : Setω where
  field
    algebraicPersistence : PACTP.ParametricAlgebraicPersistenceTheorem P
    admissibleInvariant :
      ∀ c →
      CCGP.admissible P c ≡ true →
      PACTP.ParametricAlgebraicPersistenceTheorem.persistenceOnAdmissible
        algebraicPersistence c
      ≡
      CCGP.admissible P c ≡ true

parametricAlgebraicInvarianceTheorem :
  (P : CCGP.CanonicalConstraintGaugePackage) →
  ParametricAlgebraicInvarianceTheorem P
parametricAlgebraicInvarianceTheorem P =
  record
    { algebraicPersistence = PACTP.parametricAlgebraicPersistenceTheorem P
    ; admissibleInvariant = λ c a → refl
    }
