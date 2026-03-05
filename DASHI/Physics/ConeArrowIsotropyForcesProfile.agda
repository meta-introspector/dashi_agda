module DASHI.Physics.ConeArrowIsotropyForcesProfile where

open import Agda.Primitive using (Setω)
open import Relation.Binary.PropositionalEquality using (_≡_)
open import DASHI.Geometry.ConeTimeIsotropy as CTI

-- A single seam: cone+arrow+isotropy forces a profile.
record ConeArrowIsotropyForcesProfile {X : Set} (C : CTI.ConeStructure X)
  (A : CTI.TimeArrow X) (I : CTI.IsotropyAction X) (Profile : Set) : Setω where
  field
    measuredProfile : Profile
    forcedProfile   : Profile
    measured≡forced : measuredProfile ≡ forcedProfile

open ConeArrowIsotropyForcesProfile public
