module DASHI.Physics.Closure.KnownLimitsStatus where

data LocalLorentzStatus : Set where
  localLorentzTheoremBacked : LocalLorentzStatus
  localLorentzPending : LocalLorentzStatus

data PropagationLimitStatus : Set where
  propagationLimitSeamBacked : PropagationLimitStatus
  propagationLimitPending : PropagationLimitStatus

data GRLikeStatus : Set where
  grLikePrototypeOnly : GRLikeStatus
  grLikePending : GRLikeStatus

data QFTLikeStatus : Set where
  qftLikePrototypeOnly : QFTLikeStatus
  qftLikePending : QFTLikeStatus

record KnownLimitsStatus : Set where
  field
    localLorentz : LocalLorentzStatus
    propagationLimit : PropagationLimitStatus
    grLike : GRLikeStatus
    qftLike : QFTLikeStatus

canonicalKnownLimitsStatus : KnownLimitsStatus
canonicalKnownLimitsStatus =
  record
    { localLorentz = localLorentzTheoremBacked
    ; propagationLimit = propagationLimitSeamBacked
    ; grLike = grLikePrototypeOnly
    ; qftLike = qftLikePrototypeOnly
    }
