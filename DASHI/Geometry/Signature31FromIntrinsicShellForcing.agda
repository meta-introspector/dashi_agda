module DASHI.Geometry.Signature31FromIntrinsicShellForcing where

open import Level using (_⊔_; suc)
open import Relation.Binary.PropositionalEquality using (_≡_)

open import DASHI.Geometry.QuadraticForm
open import DASHI.Geometry.ProjectionDefect using (Additive)
open import DASHI.Geometry.ConeTimeIsotropy as CTI
open import DASHI.Geometry.SignatureUniqueness31 as SU using (Signature31Theorem)
open import DASHI.Geometry.ConeArrowIsotropyOrbitProfile as CAOP
open import DASHI.Geometry.ConeArrowIsotropyShellAction as CAS
open import DASHI.Geometry.ConeArrowShellStratification as CASS
open import DASHI.Geometry.ConeArrowOrbitStructure as CAOS
open import DASHI.Geometry.ConeArrowOrientationAsymmetry as CAOA
open import DASHI.Geometry.SignatureExclusionFromOrbitProfile as SEFP
open import DASHI.Physics.OrbitSignatureDiscriminant as OSD

record IntrinsicSignatureAxioms : Set where
  field
    shellStratification : CASS.IntrinsicShellStratification
    orientation : CAOA.IntrinsicOrientation
    profileMatches31 :
      CAOP.toProfile
        (CAOS.buildAbstractOrbitProfile
          (CAOA.IntrinsicOrientation.orientationTag orientation)
          (CAOS.buildIntrinsicOrbitStructure shellStratification))
      ≡ OSD.ProfileOf OSD.sig31

open IntrinsicSignatureAxioms public

profileEqFromIntrinsic :
  (ax : IntrinsicSignatureAxioms) →
  CAOP.toProfile
    (CAOS.buildAbstractOrbitProfile
      (CAOA.IntrinsicOrientation.orientationTag
        (IntrinsicSignatureAxioms.orientation ax))
      (CAOS.buildIntrinsicOrbitStructure
        (IntrinsicSignatureAxioms.shellStratification ax)))
  ≡ OSD.ProfileOf OSD.sig31
profileEqFromIntrinsic ax = IntrinsicSignatureAxioms.profileMatches31 ax

signature31-theoremFromIntrinsic :
  IntrinsicSignatureAxioms →
  Signature31Theorem
signature31-theoremFromIntrinsic ax = record
  { prove = λ QF C compat iso fs arrow →
      SEFP.signatureLawFromProfileEq _ (profileEqFromIntrinsic ax)
  }

signature31FromIntrinsic :
  IntrinsicSignatureAxioms →
  CTI.Signature
signature31FromIntrinsic ax =
  SEFP.signatureFromProfileEq _ (profileEqFromIntrinsic ax)
