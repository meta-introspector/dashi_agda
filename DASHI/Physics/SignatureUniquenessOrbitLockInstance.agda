module DASHI.Physics.SignatureUniquenessOrbitLockInstance where

open import Relation.Binary.PropositionalEquality using (_≡_)
open import DASHI.Geometry.ParallelogramLaw using (AdditiveSpace)
open import DASHI.Geometry.ConeMetricCompatibility as CMC
open import DASHI.Physics.OrbitSignatureDiscriminant as OSD
open import DASHI.Physics.SignatureUniquenessOrbitLock as SUL
open import DASHI.Physics.Signature31InstanceShiftZ as S31Z

-- Concrete instance: uses the measured profile evidence (from CSV)
-- as the witness required by the cone+arrow→profile bridge.
coneArrowMeasuredProfileInstance : SUL.ConeArrowMeasuredProfileAxioms
coneArrowMeasuredProfileInstance =
  record
    { measuredFromConeArrow =
        λ {A} (QF : CMC.Quadratic A) (C : CMC.Cone A) compat iso fs arrow →
          S31Z.measuredFromConeArrowShift
    }
