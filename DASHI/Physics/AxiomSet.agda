module DASHI.Physics.AxiomSet where

open import Agda.Primitive using (Level; _⊔_; lsuc)
open import Agda.Builtin.Nat using (Nat)

-- Split into carriers vs laws to avoid dishonest ⊤/tt placeholders.

record AxiomCarrier
  {ℓΩ ℓD : Level}
  : Set (lsuc (ℓΩ ⊔ ℓD)) where
  field
    Ω : Set ℓΩ
    D : Set ℓD
    d : Ω → Ω → D
    T : Ω → Ω

open AxiomCarrier public

record AxiomLaws
  {ℓΩ ℓD ℓV ℓA ℓB : Level}
  (C : AxiomCarrier {ℓΩ} {ℓD})
  : Set (lsuc (ℓΩ ⊔ ℓD ⊔ ℓV ⊔ ℓA ⊔ ℓB)) where
  field
    -- A2: canonical quotient
    π        : Ω C → D C

    -- A3: cone + arrow (emergent)
    V        : Set ℓV
    Cone     : V → Set ℓV
    Arrow    : V → V → Set ℓV

    -- A4: isotropy action (abstract)
    Iso      : Set ℓV

    -- A5: quadratic emergence
    B        : Set ℓB
    Q        : V → B

    -- A6: signature lock
    sig31    : Set ℓV

    -- B0/B1: Clifford gate + Dirac operator (structure-only)
    Clifford : Set ℓV
    Dirac    : Set ℓV

    -- C0–C5: almost-commutative / finite algebra classification hooks
    AF       : Set ℓV
    HF       : Set ℓV
    DF       : Set ℓV

open AxiomLaws public

------------------------------------------------------------------------
-- Honest bridge: just the carrier data from an existing closure kit.
-- Anything beyond this should be provided as an AxiomLaws instance.

open import Ultrametric as UMetric
open import DASHI.Physics.RealClosureKit as RCK
open import DASHI.Physics.TOperator as TOp

carrierFromClosure :
  (k : RCK.RealClosureKit) →
  AxiomCarrier
carrierFromClosure k =
  record
    { Ω = RCK.S k
    ; D = Nat
    ; d = UMetric.Ultrametric.d (RCK.U k)
    ; T = TOp.TOperator.T (record { C = RCK.C k ; P = RCK.P k ; R = RCK.R k })
    }
