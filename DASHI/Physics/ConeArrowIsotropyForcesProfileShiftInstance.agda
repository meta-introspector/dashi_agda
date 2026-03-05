module DASHI.Physics.ConeArrowIsotropyForcesProfileShiftInstance where

open import DASHI.Geometry.ConeTimeIsotropy as CTI
open import DASHI.Geometry.Signature31FromConeArrowIsotropy as S31
open import DASHI.Physics.ConeArrowIsotropyForcesProfile as CAF
open import DASHI.Physics.OrbitSignatureDiscriminant as OSD
open import DASHI.Physics.Signature31InstanceShiftZ as S31Z

-- Shift instance: measured profile is the computed profile.
shiftForcesProfile :
  CAF.ConeArrowIsotropyForcesProfile
    (S31.SignatureAxioms.ConeS S31Z.sigAxioms)
    (S31.SignatureAxioms.Arrow S31Z.sigAxioms)
    (S31.SignatureAxioms.Iso S31Z.sigAxioms)
    OSD.Profile
shiftForcesProfile =
  record
    { measuredProfile = OSD.MeasuredProfile
    ; forcedProfile = OSD.ProfileOf OSD.sig31
    ; measured≡forced = S31Z.measuredFromConeArrowShift
    }
