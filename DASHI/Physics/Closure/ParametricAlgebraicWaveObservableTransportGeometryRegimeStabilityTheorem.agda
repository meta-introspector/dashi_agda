module DASHI.Physics.Closure.ParametricAlgebraicWaveObservableTransportGeometryRegimeStabilityTheorem where

open import Agda.Primitive using (Setω)
open import Agda.Builtin.Bool using (true)
open import Relation.Binary.PropositionalEquality using (_≡_)

open import DASHI.Physics.Closure.CanonicalConstraintGaugePackage as CCGP
open import DASHI.Physics.Closure.ParametricAlgebraicWaveObservableTransportGeometryRegimeCoherenceTheorem as PAWOTGRC
open import DASHI.Physics.Closure.ParametricAlgebraicStabilityTheorem as PACTS

record ParametricAlgebraicWaveObservableTransportGeometryRegimeStabilityTheorem
         (pkg : CCGP.CanonicalConstraintGaugePackage) : Setω where
  constructor parametricAlgebraicWaveObservableTransportGeometryRegimeStabilityTheorem
  field
    waveObservableTransportGeometryRegimeCoherence :
      PAWOTGRC.ParametricAlgebraicWaveObservableTransportGeometryRegimeCoherenceTheorem pkg
    algebraicStability :
      PACTS.ParametricAlgebraicStabilityTheorem pkg
    stableOnAdmissible :
      ∀ c → CCGP.admissible pkg c ≡ true → CCGP.admissible pkg c ≡ true

buildParametricAlgebraicWaveObservableTransportGeometryRegimeStabilityTheorem :
  (pkg : CCGP.CanonicalConstraintGaugePackage) →
  ParametricAlgebraicWaveObservableTransportGeometryRegimeStabilityTheorem pkg
buildParametricAlgebraicWaveObservableTransportGeometryRegimeStabilityTheorem pkg =
  parametricAlgebraicWaveObservableTransportGeometryRegimeStabilityTheorem
    (PAWOTGRC.buildParametricAlgebraicWaveObservableTransportGeometryRegimeCoherenceTheorem pkg)
    (PACTS.parametricAlgebraicStabilityTheorem pkg)
    (λ _ pf → pf)
