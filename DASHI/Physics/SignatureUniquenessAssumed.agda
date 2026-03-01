module DASHI.Physics.SignatureUniquenessAssumed where

open import DASHI.Geometry.SignatureUniqueness31
  using (AdditiveSpace; Quadratic; Cone; ConeMetricCompat
       ; Signature; sig31
       ; SignatureLaw; Signature31Theorem)

-- Explicit dependency on isolated assumption packs.
open import DASHI.Physics.OrbitFingerprintAssumptionsPostulates as OFP
open import DASHI.Physics.DimensionBoundAssumptionsPostulates as DBP

-- Bridge hook: in the full proof, this would extract orbit/profile premises
-- from (QF, C, compat, iso, fs, arrow) and then apply OFP/DBP.
postulate
  orbitPremises :
    ∀ {A : AdditiveSpace}
    (QF     : Quadratic A)
    (C      : Cone A)
    (compat : ConeMetricCompat A C QF)
    (iso fs arrow : Set)
    → Set

-- Assumption-based signature law for the closure harness.
signature31-assumed : Signature31Theorem
signature31-assumed = record
  { prove = λ {A} QF C compat iso fs arrow →
      let
        _ : Set
        _ = orbitPremises QF C compat iso fs arrow
      in
      record { forced = sig31 }
  }
