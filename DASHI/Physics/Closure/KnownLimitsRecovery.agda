module DASHI.Physics.Closure.KnownLimitsRecovery where

open import Relation.Binary.PropositionalEquality using (_≡_; refl)

open import DASHI.Physics.Closure.KnownLimitsStatus as KLS

record KnownLimitsRecoveryWitness : Set where
  field
    localLorentzRecovered :
      KLS.KnownLimitsStatus.localLorentz KLS.canonicalKnownLimitsStatus
      ≡ KLS.localLorentzTheoremBacked
    propagationLimitRecovered :
      KLS.KnownLimitsStatus.propagationLimit KLS.canonicalKnownLimitsStatus
      ≡ KLS.propagationLimitSeamBacked
    grLikeStillPrototype :
      KLS.KnownLimitsStatus.grLike KLS.canonicalKnownLimitsStatus
      ≡ KLS.grLikePrototypeOnly
    qftLikeStillPrototype :
      KLS.KnownLimitsStatus.qftLike KLS.canonicalKnownLimitsStatus
      ≡ KLS.qftLikePrototypeOnly

canonicalKnownLimitsRecovery : KnownLimitsRecoveryWitness
canonicalKnownLimitsRecovery =
  record
    { localLorentzRecovered = refl
    ; propagationLimitRecovered = refl
    ; grLikeStillPrototype = refl
    ; qftLikeStillPrototype = refl
    }
