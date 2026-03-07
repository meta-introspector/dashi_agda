module DASHI.Physics.ConeArrowIsotropyShiftOrbitEnumeration where

open import Data.List using (List)
open import Data.Vec using (Vec)
open import Relation.Nullary using (Dec)
open import Relation.Binary.PropositionalEquality using (_≡_; refl)

open import DASHI.Algebra.Trit using (Trit)
open import DASHI.Geometry.ConeArrowIsotropyShellAction as CAS
open import DASHI.Geometry.ConeArrowIsotropyShellEnumeration as CASE
open import DASHI.Geometry.ConeArrowIsotropyOrbitProfile as CAOP
open import DASHI.Geometry.ConeTimeIsotropy as CTI
open import DASHI.Physics.OrbitProfileComputedSignedPerm as OPCSP
open import DASHI.Physics.OrbitSignatureDiscriminant as OSD
open import DASHI.Physics.QuadraticEmergenceShiftInstance as QES
open import DASHI.Physics.Signature31OrbitActionAgreement as OAA
open import DASHI.Physics.Signature31InstanceShiftZ as S31Z
open import DASHI.Physics.SignedPerm4 as SP

-- Concrete shift-instance orbit enumeration bridge.
-- This module is the single place where the Stage B shell/action story is
-- identified with the existing 4D signed-permutation orbit computation.

shiftShellAction : CAS.AbstractShellAction (QES.AdditiveVecℤ {S31Z.m}) QES.ScalarFieldℤ S31Z.QF
shiftShellAction =
  CAS.buildShellAction
    (QES.AdditiveVecℤ {S31Z.m})
    QES.ScalarFieldℤ
    S31Z.QF
    S31Z.sigAxioms

shiftCarrierDerivation :
  CASE.FiniteCarrierShellDerivation
    shiftShellAction
    (Vec Trit 4)
    SP.SignedPerm4
shiftCarrierDerivation =
  record
    { decEq = OPCSP.decEqVec
    ; carrierPoints = OPCSP.allVecTrit 4
    ; shell1Pred = OPCSP.isShell 1
    ; shell2Pred = OPCSP.isShell 2
    ; actions = OPCSP.allSignedPerm4
    ; act = OAA.actIso4Trit
    }

shiftFiniteEnumerationDerivation :
  CASE.FiniteShellEnumerationDerivation
    shiftShellAction
    (Vec Trit 4)
    SP.SignedPerm4
shiftFiniteEnumerationDerivation =
  CASE.buildFiniteShellEnumeration shiftCarrierDerivation

shiftEnumeration : CTI.ShellOrbitEnumeration
shiftEnumeration =
  CASE.buildShellOrbitEnumerationFromFinite shiftFiniteEnumerationDerivation

shell1Derived : List _
shell1Derived = CTI.ShellOrbitEnumeration.shell1OrbitSizes shiftEnumeration

shell2Derived : List _
shell2Derived = CTI.ShellOrbitEnumeration.shell2OrbitSizes shiftEnumeration

shell1Derived≡computed : shell1Derived ≡ OPCSP.shell1_p3_q1_computed
shell1Derived≡computed = refl

shell2Derived≡computed : shell2Derived ≡ OPCSP.shell2_p3_q1_computed
shell2Derived≡computed = refl

shiftEnumeration-shell1≡computed :
  CTI.ShellOrbitEnumeration.shell1OrbitSizes shiftEnumeration
  ≡ OPCSP.shell1_p3_q1_computed
shiftEnumeration-shell1≡computed = shell1Derived≡computed

shiftEnumeration-shell2≡computed :
  CTI.ShellOrbitEnumeration.shell2OrbitSizes shiftEnumeration
  ≡ OPCSP.shell2_p3_q1_computed
shiftEnumeration-shell2≡computed = shell2Derived≡computed

orientationTagDerived : 31 ≡ OSD.OrientationTag OSD.sig31
orientationTagDerived = S31Z.orientationTagFromArrow S31Z.sigAxioms

shiftOrbitProfileDerivation :
  CAOP.OrbitProfileDerivation shiftShellAction
shiftOrbitProfileDerivation =
  record
    { orientationTag = 31
    ; enumeration = shiftEnumeration
    }
