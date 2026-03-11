module DASHI.Physics.Closure.ContractionForcesQuadraticStrong where

open import Agda.Primitive using (Setω)
open import Agda.Builtin.Nat using (Nat)
open import Agda.Builtin.Equality using (_≡_; refl)
open import Data.Product using (Σ; proj₁)

open import DASHI.Geometry.ProjectionDefect as PD
open import DASHI.Geometry.QuadraticForm as QF
open import DASHI.Geometry.QuadraticFormEmergence as QFE
open import DASHI.Geometry.ProjectionDefectToParallelogram as PDP
open import DASHI.Physics.QuadraticEmergenceShiftInstance as QES

record ContractionForcesQuadraticStrong : Setω where
  field
    dimension : Nat
    projection : PD.ProjectionDefect (QES.AdditiveVecℤ {dimension})
    emergenceAxioms :
      QFE.QuadraticEmergenceAxioms
        (QES.AdditiveVecℤ {dimension}) QES.ScalarFieldℤ projection
    projectionParallelogram :
      PDP.ProjectionDefectParallelogramPackage
        (QES.AdditiveVecℤ {dimension}) QES.ScalarFieldℤ
    derivedQuadratic :
      QF.QuadraticForm (QES.AdditiveVecℤ {dimension}) QES.ScalarFieldℤ
    dynamicsMap :
      PD.Additive.Carrier (QES.AdditiveVecℤ {dimension}) →
      PD.Additive.Carrier (QES.AdditiveVecℤ {dimension})
    invariantQuadraticWitness :
      ∀ x →
        QF.QuadraticForm.Q derivedQuadratic (dynamicsMap x)
        ≡
        QF.QuadraticForm.Q derivedQuadratic x
    -- Remaining mathematical bottleneck.
    uniqueUpToScaleSeam : Set

buildContractionForcesQuadraticStrong :
  (m : Nat) →
  (dynamics :
    PD.Additive.Carrier (QES.AdditiveVecℤ {m}) →
    PD.Additive.Carrier (QES.AdditiveVecℤ {m})) →
  (invariantQ :
    ∀ x →
      QF.QuadraticForm.Q
        (proj₁
          (PDP.quadraticFromProjectionDefect
            (QES.AdditiveVecℤ {m}) QES.ScalarFieldℤ
            (PDP.fromEmergenceAxioms
              (QES.AdditiveVecℤ {m}) QES.ScalarFieldℤ
              (QES.PDzero {m}) (QES.QuadraticEmergenceShiftAxioms {m}))))
        (dynamics x)
      ≡
      QF.QuadraticForm.Q
        (proj₁
          (PDP.quadraticFromProjectionDefect
            (QES.AdditiveVecℤ {m}) QES.ScalarFieldℤ
            (PDP.fromEmergenceAxioms
              (QES.AdditiveVecℤ {m}) QES.ScalarFieldℤ
              (QES.PDzero {m}) (QES.QuadraticEmergenceShiftAxioms {m}))))
        x) →
  (uniqueness : Set) →
  ContractionForcesQuadraticStrong
buildContractionForcesQuadraticStrong m dynamics invariantQ uniqueness =
  let
    proj = QES.PDzero {m}
    ax = QES.QuadraticEmergenceShiftAxioms {m}
    pkg = PDP.fromEmergenceAxioms (QES.AdditiveVecℤ {m}) QES.ScalarFieldℤ proj ax
    q = proj₁
          (PDP.quadraticFromProjectionDefect
             (QES.AdditiveVecℤ {m}) QES.ScalarFieldℤ pkg)
  in
  record
    { dimension = m
    ; projection = proj
    ; emergenceAxioms = ax
    ; projectionParallelogram = pkg
    ; derivedQuadratic = q
    ; dynamicsMap = dynamics
    ; invariantQuadraticWitness = invariantQ
    ; uniqueUpToScaleSeam = uniqueness
    }

canonicalIdentityInvariantStrong :
  (m : Nat) →
  (uniqueness : Set) →
  ContractionForcesQuadraticStrong
canonicalIdentityInvariantStrong m uniqueness =
  buildContractionForcesQuadraticStrong
    m
    (λ x → x)
    (λ _ → refl)
    uniqueness
