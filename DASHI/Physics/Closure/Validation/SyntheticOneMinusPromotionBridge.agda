module DASHI.Physics.Closure.Validation.SyntheticOneMinusPromotionBridge where

open import Agda.Builtin.Bool using (Bool; false)

open import DASHI.Physics.Closure.Validation.SyntheticOneMinusShellComparison as SOSC

data SyntheticOrientationStatus : Set where
  orientationBlocked : SyntheticOrientationStatus
  orientationJustified : SyntheticOrientationStatus

data SyntheticSignatureStatus : Set where
  signatureBlocked : SyntheticSignatureStatus
  signatureJustified : SyntheticSignatureStatus

data SyntheticPromotionBridgeStatus : Set where
  blockedOnOrientationAndSignature : SyntheticPromotionBridgeStatus
  blockedOnSignatureOnly : SyntheticPromotionBridgeStatus
  admissiblePromotionReady : SyntheticPromotionBridgeStatus

record SyntheticPromotionBridge : Set where
  field
    shell1Matches : Bool
    shell2Matches : Bool
    orientationStatus : SyntheticOrientationStatus
    signatureStatus : SyntheticSignatureStatus
    promotionStatus : SyntheticPromotionBridgeStatus

bridge : SyntheticPromotionBridge
bridge =
  record
    { shell1Matches = SOSC.SyntheticShellComparisonReport.shell1Matches SOSC.report
    ; shell2Matches = SOSC.SyntheticShellComparisonReport.shell2Matches SOSC.report
    ; orientationStatus = orientationBlocked
    ; signatureStatus = signatureBlocked
    ; promotionStatus = blockedOnOrientationAndSignature
    }

