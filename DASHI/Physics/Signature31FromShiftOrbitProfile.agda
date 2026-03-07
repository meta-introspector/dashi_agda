module DASHI.Physics.Signature31FromShiftOrbitProfile where

open import Relation.Binary.PropositionalEquality using (_≡_; trans)

open import DASHI.Geometry.ConeTimeIsotropy as CTI using (Signature)
open import DASHI.Geometry.SignatureUniqueness31 as SU using (SignatureLaw; Signature31Theorem; sig31)
open import DASHI.Physics.OrbitSignatureDiscriminant as OSD
open import DASHI.Physics.ConeArrowIsotropyOrbitProfileAgreement as CAOPA

-- Headline theorem module for the current repo state.
-- Finished result:
--   computed shift orbit profile -> unique selection of sig31 in 4D.
-- Open result:
--   cone + arrow + isotropy -> that orbit profile.
-- This module intentionally anchors the first statement only.

profileEq : OSD.MeasuredProfile ≡ OSD.ProfileOf OSD.sig31
profileEq = CAOPA.abstractMeasured≡ProfileOfSig31

signature31-theorem : Signature31Theorem
signature31-theorem = record
  { prove = λ QF C compat iso fs arrow →
      let _ = OSD.SignatureFromMeasuredProfileUnique OSD.sig31 profileEq in
      record { forced = sig31 }
  }

-- Concrete signature value consumed by the closure path.
signature31 : CTI.Signature
signature31 = CTI.sig31
