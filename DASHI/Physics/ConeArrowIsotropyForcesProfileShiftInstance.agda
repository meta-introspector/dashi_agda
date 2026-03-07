module DASHI.Physics.ConeArrowIsotropyForcesProfileShiftInstance where

open import DASHI.Geometry.ConeTimeIsotropy as CTI
open import DASHI.Geometry.ConeArrowIsotropyOrbitProfile as CAOP
open import DASHI.Geometry.Signature31FromConeArrowIsotropy as S31
open import DASHI.Physics.ConeArrowIsotropyForcesProfile as CAF
open import DASHI.Physics.ConeArrowIsotropyOrbitProfileAgreement as CAOPA
open import DASHI.Physics.OrbitSignatureDiscriminant as OSD
open import DASHI.Physics.Signature31InstanceShiftZ as S31Z

-- Shift instance witness only:
-- this packages the concrete computed profile used by the signature theorem.
-- It should not be read as a completed proof that arbitrary cone/arrow/isotropy
-- data intrinsically force that profile.
shiftForcesProfile :
  CAF.ConeArrowIsotropyForcesProfile
    (S31.SignatureAxioms.ConeS S31Z.sigAxioms)
    (S31.SignatureAxioms.Arrow S31Z.sigAxioms)
    (S31.SignatureAxioms.Iso S31Z.sigAxioms)
    OSD.Profile
shiftForcesProfile =
  record
    { measuredProfile = CAOP.toProfile CAOPA.abstractProfile
    ; forcedProfile = OSD.ProfileOf OSD.sig31
    ; measured≡forced = CAOPA.abstractMeasured≡ProfileOfSig31
    }
