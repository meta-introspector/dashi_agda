module DASHI.Physics.Closure.KnownLimitsQFTBridgeTheorem where

open import Agda.Primitive using (Setω)
open import Relation.Binary.PropositionalEquality using (_≡_)

open import DASHI.Physics.QFT as QFT
open import DASHI.Physics.Closure.KnownLimitsRecovery as KLR
open import DASHI.Physics.Closure.KnownLimitsStatus as KLS

record KnownLimitsQFTBridgeTheorem : Setω where
  field
    qftAdapter : QFT.QFTAdapter
    qftRecovered :
      KLS.KnownLimitsStatus.qftLike KLS.canonicalKnownLimitsStatus
      ≡ KLS.qftLikeTheoremBacked
    recovery : KLR.KnownLimitsRecoveryWitness

canonicalKnownLimitsQFTBridgeTheorem : KnownLimitsQFTBridgeTheorem
canonicalKnownLimitsQFTBridgeTheorem =
  record
    { qftAdapter = QFT.canonicalQFTAdapter
    ; qftRecovered =
        KLR.KnownLimitsRecoveryWitness.qftLikeRecovered
          KLR.canonicalKnownLimitsRecovery
    ; recovery = KLR.canonicalKnownLimitsRecovery
    }
