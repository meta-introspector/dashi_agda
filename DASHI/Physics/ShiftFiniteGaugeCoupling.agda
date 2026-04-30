module DASHI.Physics.ShiftFiniteGaugeCoupling where

open import Agda.Builtin.Equality using (_≡_; refl)
open import Agda.Builtin.Sigma using (Σ; _,_)
open import Agda.Builtin.String using (String)
open import Data.Integer using (-[1+_])
open import Data.List.Base using (List; _∷_; [])

open import DASHI.Physics.Closure.ShiftObservableSignaturePressureTestInstance as SPTI
open import DASHI.Physics.ShiftDiscreteWaveStep as SDWS
open import DASHI.Physics.ShiftFiniteGaugeSymmetry as SFGS
open import DASHI.Physics.ShiftPhaseTableInterference as SPTI4
open import DASHI.Physics.ShiftSpatialLaplacian as SSL

------------------------------------------------------------------------
-- First finite matter+gauge lift over the current shift-wave lane.
--
-- Gauge data stays bounded and static in this lane: one Phase4 link phase per
-- coarse carrier point, interpreted as the phase transport toward the right
-- neighbor. The result is a theorem-thin covariant operator/update surface,
-- not a full lattice gauge theory or dynamic-gauge package.

cong :
  {A B : Set} →
  (f : A → B) →
  {x y : A} →
  x ≡ y →
  f x ≡ f y
cong f refl = refl

GaugeField : Set
GaugeField = SPTI.ShiftPressurePoint → SPTI4.Phase4

vacuumGaugeField : GaugeField
vacuumGaugeField _ = SPTI4.φ0

leftGaugePhase :
  GaugeField →
  SPTI.ShiftPressurePoint →
  SPTI4.Phase4
leftGaugePhase A s =
  SFGS.phaseInv4 (A (SSL.leftNeighbor s))

rightGaugePhase :
  GaugeField →
  SPTI.ShiftPressurePoint →
  SPTI4.Phase4
rightGaugePhase A s = A s

covariantLaplacian :
  GaugeField →
  SSL.ShiftWaveField →
  SPTI.ShiftPressurePoint →
  SDWS.DiscreteWave
covariantLaplacian A ψ s =
  SDWS.waveAdd
    (SFGS.phaseAct (leftGaugePhase A s) (ψ (SSL.leftNeighbor s)))
    (SDWS.waveAdd
      (SFGS.phaseAct (rightGaugePhase A s) (ψ (SSL.rightNeighbor s)))
      (SDWS.scaleWave (-[1+ 1 ]) (ψ s)))

waveNeg : SDWS.DiscreteWave → SDWS.DiscreteWave
waveNeg ψ =
  SDWS.scaleWave (-[1+ 0 ]) ψ

gaugeHamiltonian :
  GaugeField →
  SSL.ShiftWaveField →
  SPTI.ShiftPressurePoint →
  SDWS.DiscreteWave
gaugeHamiltonian A ψ s =
  waveNeg (covariantLaplacian A ψ s)

gaugeSchrodingerStep :
  GaugeField →
  SSL.ShiftWaveField →
  SPTI.ShiftPressurePoint →
  SDWS.DiscreteWave
gaugeSchrodingerStep A ψ s =
  SDWS.waveAdd
    (ψ s)
    (SDWS.mulI (gaugeHamiltonian A ψ s))

gaugeGlobalUpdate :
  GaugeField →
  SSL.ShiftWaveField →
  SSL.ShiftWaveField
gaugeGlobalUpdate A ψ s =
  gaugeSchrodingerStep A ψ s

transformGauge :
  SFGS.GaugeTransform →
  GaugeField →
  GaugeField
transformGauge g A s =
  SFGS.phaseAdd4
    (SFGS.phaseInv4 (g (SSL.rightNeighbor s)))
    (SFGS.phaseAdd4 (A s) (g s))

VacuumGaugeCompatibility : Set
VacuumGaugeCompatibility =
  (ψ : SSL.ShiftWaveField) →
  (s : SPTI.ShiftPressurePoint) →
  covariantLaplacian vacuumGaugeField ψ s
    ≡
  SSL.shiftSpatialLaplacian ψ s

vacuumGaugeCompatibility : VacuumGaugeCompatibility
vacuumGaugeCompatibility ψ SPTI.shiftStartPoint = refl
vacuumGaugeCompatibility ψ SPTI.shiftNextPoint = refl
vacuumGaugeCompatibility ψ SPTI.shiftHeldExitPoint = refl

ConstantGaugePreservesVacuum : Set
ConstantGaugePreservesVacuum =
  (φ : SPTI4.Phase4) →
  (s : SPTI.ShiftPressurePoint) →
  transformGauge (SFGS.constantGaugeTransform φ) vacuumGaugeField s
    ≡
  vacuumGaugeField s

constantGaugePreservesVacuum : ConstantGaugePreservesVacuum
constantGaugePreservesVacuum SPTI4.φ0 s = refl
constantGaugePreservesVacuum SPTI4.φ1 SPTI.shiftStartPoint = refl
constantGaugePreservesVacuum SPTI4.φ1 SPTI.shiftNextPoint = refl
constantGaugePreservesVacuum SPTI4.φ1 SPTI.shiftHeldExitPoint = refl
constantGaugePreservesVacuum SPTI4.φ2 SPTI.shiftStartPoint = refl
constantGaugePreservesVacuum SPTI4.φ2 SPTI.shiftNextPoint = refl
constantGaugePreservesVacuum SPTI4.φ2 SPTI.shiftHeldExitPoint = refl
constantGaugePreservesVacuum SPTI4.φ3 SPTI.shiftStartPoint = refl
constantGaugePreservesVacuum SPTI4.φ3 SPTI.shiftNextPoint = refl
constantGaugePreservesVacuum SPTI4.φ3 SPTI.shiftHeldExitPoint = refl

ConstantPhaseVacuumCovarianceTarget : Set
ConstantPhaseVacuumCovarianceTarget =
  (φ : SPTI4.Phase4) →
  (ψ : SSL.ShiftWaveField) →
  (s : SPTI.ShiftPressurePoint) →
  covariantLaplacian
    (transformGauge (SFGS.constantGaugeTransform φ) vacuumGaugeField)
    (SFGS.transformMatter (SFGS.constantGaugeTransform φ) ψ)
    s
    ≡
  SFGS.phaseAct φ (covariantLaplacian vacuumGaugeField ψ s)

LocalGaugeCovarianceTarget : Set
LocalGaugeCovarianceTarget =
  (g : SFGS.GaugeTransform) →
  (A : GaugeField) →
  (ψ : SSL.ShiftWaveField) →
  (s : SPTI.ShiftPressurePoint) →
  covariantLaplacian
    (transformGauge g A)
    (SFGS.transformMatter g ψ)
    s
    ≡
  SFGS.phaseAct (g s) (covariantLaplacian A ψ s)

record ShiftFiniteGaugeCoupling : Set₁ where
  field
    MatterField : Set
    StaticGaugeField : Set
    gaugeVacuum : StaticGaugeField
    gaugePotential :
      SPTI.ShiftPressurePoint → StaticGaugeField → SPTI4.Phase4
    gaugeAction :
      SFGS.GaugeTransform → StaticGaugeField → StaticGaugeField
    covariantOperator :
      StaticGaugeField →
      MatterField →
      SPTI.ShiftPressurePoint →
      SDWS.DiscreteWave
    covariantUpdate :
      StaticGaugeField → MatterField → MatterField
    vacuumCompatibilityLaw : VacuumGaugeCompatibility
    constantGaugeVacuumPreservation : ConstantGaugePreservesVacuum
    constantPhaseCovarianceTarget : Set
    localGaugeCovarianceTarget : Set
    nonClaimBoundary : List String

shiftFiniteGaugeCoupling : ShiftFiniteGaugeCoupling
shiftFiniteGaugeCoupling =
  record
    { MatterField = SSL.ShiftWaveField
    ; StaticGaugeField = GaugeField
    ; gaugeVacuum = vacuumGaugeField
    ; gaugePotential = λ s A → A s
    ; gaugeAction = transformGauge
    ; covariantOperator = covariantLaplacian
    ; covariantUpdate = gaugeGlobalUpdate
    ; vacuumCompatibilityLaw = vacuumGaugeCompatibility
    ; constantGaugeVacuumPreservation = constantGaugePreservesVacuum
    ; constantPhaseCovarianceTarget = ConstantPhaseVacuumCovarianceTarget
    ; localGaugeCovarianceTarget = LocalGaugeCovarianceTarget
    ; nonClaimBoundary =
        "Finite matter-plus-static-gauge package only"
        ∷ "Gauge field is a bounded Phase4 link assignment on the current coarse carrier"
        ∷ "Covariant Laplacian is a nearest-neighbor transport operator with reflected boundaries"
        ∷ "Full local and constant-phase covariance are exposed as target law surfaces, not solved in this lane"
        ∷ "Only vacuum compatibility and constant-gauge preservation of the vacuum link field are witnessed explicitly"
        ∷ "No dynamic gauge field, continuum connection, Yang-Mills, or full U(1) claim is implied"
        ∷ []
    }
