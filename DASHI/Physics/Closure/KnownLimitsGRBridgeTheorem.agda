module DASHI.Physics.Closure.KnownLimitsGRBridgeTheorem where

open import Agda.Primitive using (Setω)
open import Relation.Binary.PropositionalEquality using (_≡_)

open import DASHI.Physics.GR as GR
open import DASHI.Physics.Closure.KnownLimitsRecovery as KLR
open import DASHI.Physics.Closure.KnownLimitsStatus as KLS

record KnownLimitsGRBridgeTheorem : Setω where
  field
    grAdapter : GR.GRAdapter
    grRecovered :
      KLS.KnownLimitsStatus.grLike KLS.canonicalKnownLimitsStatus
      ≡ KLS.grLikeTheoremBacked
    recovery : KLR.KnownLimitsRecoveryWitness

canonicalKnownLimitsGRBridgeTheorem : KnownLimitsGRBridgeTheorem
canonicalKnownLimitsGRBridgeTheorem =
  record
    { grAdapter = GR.canonicalGRAdapter
    ; grRecovered =
        KLR.KnownLimitsRecoveryWitness.grLikeRecovered
          KLR.canonicalKnownLimitsRecovery
    ; recovery = KLR.canonicalKnownLimitsRecovery
    }
