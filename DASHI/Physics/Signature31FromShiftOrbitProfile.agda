module DASHI.Physics.Signature31FromShiftOrbitProfile where

open import Relation.Binary.PropositionalEquality using (_≡_)

open import DASHI.Geometry.ConeTimeIsotropy as CTI using (Signature)
open import DASHI.Geometry.SignatureUniqueness31 as SU using (Signature31Theorem)
open import DASHI.Physics.OrbitSignatureDiscriminant as OSD
import DASHI.Physics.Signature31IntrinsicShiftInstance as S31I

-- Headline theorem module for the current repo state.
-- The 4D shift instance now discharges an intrinsic shell-forcing theorem, and
-- the computed signed-permutation profile appears as a compatibility corollary.

profileEq : OSD.MeasuredProfile ≡ OSD.ProfileOf OSD.sig31
profileEq = S31I.profileEq

signature31-theorem : Signature31Theorem
signature31-theorem = S31I.signature31-theorem

-- Concrete signature value consumed by the closure path.
signature31 : CTI.Signature
signature31 = S31I.signature31
