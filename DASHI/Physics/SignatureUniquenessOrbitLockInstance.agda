module DASHI.Physics.SignatureUniquenessOrbitLockInstance where

open import Relation.Binary.PropositionalEquality using (_≡_)
open import DASHI.Geometry.ParallelogramLaw using (AdditiveSpace)
open import DASHI.Geometry.ConeMetricCompatibility as CMC
open import DASHI.Physics.OrbitProfileComputedSignedPermEvidence as OPCE
open import DASHI.Physics.SignatureUniquenessOrbitLock as SUL

-- Concrete instance: use the internally computed signed-permutation
-- orbit profile as the witness required by the cone+arrow→profile bridge.
coneArrowMeasuredProfileInstance : SUL.ConeArrowMeasuredProfileAxioms
coneArrowMeasuredProfileInstance =
  record
    { measuredFromConeArrow =
        λ {A} (QF : CMC.Quadratic A) (C : CMC.Cone A) compat iso fs arrow →
          OPCE.measuredProfileFromComputed
    }
