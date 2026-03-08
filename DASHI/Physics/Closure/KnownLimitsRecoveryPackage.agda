module DASHI.Physics.Closure.KnownLimitsRecoveryPackage where

open import Agda.Primitive using (Setω)
open import Agda.Builtin.Nat using (Nat)
open import Agda.Builtin.Equality using (_≡_)

open import DASHI.Geometry.OrthogonalityFromPolarization as OP
open import DASHI.Physics.Closure.DynamicalClosureStatus as DCS
open import DASHI.Physics.Closure.KnownLimitsEffectiveGeometryTheorem as KLET
open import DASHI.Physics.Closure.KnownLimitsLocalRecoveryTheorem as KLRT
open import DASHI.Physics.Closure.OrthogonalityZLift as OZ
open import DASHI.Physics.Closure.ShiftSeamCertificates as SSC
open import DASHI.Physics.QuadraticEmergenceShiftInstance as QES

record KnownLimitsRecoveryPackage : Setω where
  field
    localRecovery : KLRT.KnownLimitsLocalRecoveryTheorem
    effectiveGeometry : KLET.KnownLimitsEffectiveGeometryTheorem
    propagationSeams : ∀ {m k : Nat} → SSC.ShiftSeams {m} {k}
    causalAdmissibility : ∀ {m k : Nat} → SSC.ShiftSeams {m} {k}
    causalStatus : DCS.CausalAdmissibilityStatus
    effectiveOrthogonality : ∀ {m : Nat} → OZ.OrthogonalityZLift {m}
    effectivePolarization :
      ∀ {m : Nat} →
      OP.Polarization (QES.AdditiveVecℤ {m}) QES.ScalarFieldℤ
    causalStatusRecovered :
      causalStatus ≡ DCS.seamBackedCausalAdmissibility

open KnownLimitsRecoveryPackage public
