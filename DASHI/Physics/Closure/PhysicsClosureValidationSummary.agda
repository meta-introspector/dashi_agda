module DASHI.Physics.Closure.PhysicsClosureValidationSummary where

-- Repo-facing validation summary entrypoint for the current Stage C snapshot.
-- Current explicit rigidity outcomes:
--   signed-permutation self-check      -> exactMatch
--   Bool inversion admissible case     -> signatureOnlyMatch
--   tail-permutation negative control  -> mismatch
-- This surface is intended to make the present validation state easy to cite
-- from the main closure entrypoints without drilling into the validation
-- implementation modules directly.

open import Agda.Builtin.Nat using (Nat; suc)
open import Agda.Builtin.Bool using (Bool)
open import Relation.Binary.PropositionalEquality using (_≡_)

open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosureValidation as MCPCV public
open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosureValidationShiftInstance as MCPCVS public
open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosure as MCPC
open import DASHI.Physics.Closure.CanonicalStageCStatus as CSS public
  using (ClosureSurfaceStatus)
open import DASHI.Physics.Closure.CanonicalStageC as CSC
open import DASHI.Physics.Closure.DynamicalClosure as DC
open import DASHI.Physics.Closure.Validation.FejerOverChiSquared as FCS public
  using (Chi2FalsifierStatus; FejerBenchmarkVerdict)
open import DASHI.Physics.Closure.Validation.FejerOverChiSquaredReport as FCSR
open import DASHI.Physics.Closure.Validation.FejerOverChiSquaredShift as FCSS
open import DASHI.Physics.Closure.Validation.Chi2BoundaryShiftLibrary as CBSL
open import DASHI.Physics.Closure.Validation.ObservableCollapse as OC public
  using (ObservableCollapseVerdict)
open import DASHI.Physics.Closure.Validation.ObservableCollapseReport as OCR
open import DASHI.Physics.Closure.Validation.ObservableCollapseShift as OCS
open import DASHI.Physics.Closure.Validation.SnapThresholdLaw as STL public
  using (SnapThresholdVerdict)
open import DASHI.Physics.Closure.Validation.SnapThresholdLawReport as STLR
open import DASHI.Physics.Closure.Validation.SnapThresholdLawShift as STLS
open import DASHI.Physics.Closure.Validation.SyntheticOneMinusShellComparison as SOSC public
  using (SyntheticPromotionStatus)
open import DASHI.Physics.Closure.Validation.SyntheticOneMinusPromotionBridge as SOPB public
  using
    ( SyntheticOrientationStatus
    ; SyntheticSignatureStatus
    ; SyntheticPromotionBridgeStatus
    )
open import DASHI.Physics.Closure.Validation.RootSystemB4ShellComparison as B4C public
  using (B4ShellComparisonVerdict; B4PromotionStatus)
open import DASHI.Physics.Closure.Validation.OrbitShellSeriesComparison as OSSC public
  using (OrbitShellSeriesVerdict)
open import DASHI.Physics.Closure.Validation.RealizationProfileRigidity as RPR public
  using (RigidityVerdict)
open import DASHI.Physics.Closure.Validation.RealizationProfileRigidityReport as RPRR
open import DASHI.Physics.Closure.Validation.RealizationProfileRigidityShift as RPRS
open import DASHI.Physics.OrbitShellGeneratingSeries as OSG public
  using (OrbitShellSeries; SizeMultiplicity)
open import DASHI.Physics.OrbitShellGeneratingSeriesShift as OSGS
open import DASHI.Physics.OrbitShellGeneratingSeriesRootSystemB4 as OSGB4
open import DASHI.Physics.ShellNeighborhoodClass as SNC public
  using (ShellNeighborhoodClass)
open import DASHI.Physics.OneMinusShellFamilyParametric as OMSFP
open import DASHI.Physics.LorentzNeighborhoodDynamicCandidate as LNDC public
  using (DynamicCandidateStatus)
open import DASHI.Physics.Closure.DynamicalClosureStatus as DCS public
  using
    ( DynamicalClosureStatus
    ; PropagationStatus
    ; CausalAdmissibilityStatus
    ; MonotoneQuantityStatus
    ; EffectiveGeometryStatus
    )
open import DASHI.Physics.OrbitProfileData as OPD

validationBundle : MCPCV.MinimalCrediblePhysicsClosureValidation
validationBundle = MCPCVS.minimumCredibleClosureValidationShift

canonicalStageCStatus : CSS.ClosureSurfaceStatus
canonicalStageCStatus = CSC.canonicalClosureStatus

selfSnapshotVerdict : RPR.RigidityVerdict
selfSnapshotVerdict = MCPCV.selfVerdict validationBundle

admissibleSnapshotVerdict : RPR.RigidityVerdict
admissibleSnapshotVerdict = MCPCV.admissibleVerdict validationBundle

negativeControlSnapshotVerdict : RPR.RigidityVerdict
negativeControlSnapshotVerdict = MCPCV.negativeControlVerdict validationBundle

fejerShiftVerdict : FCS.FejerBenchmarkVerdict
fejerShiftVerdict = FCSS.shiftVerdict

canonicalDynamicsStatus : DCS.DynamicalClosureStatus
canonicalDynamicsStatus =
  DC.DynamicalClosure.status
    (MCPC.authoritativeDynamics
      (MCPCV.MinimalCrediblePhysicsClosureValidation.closure validationBundle))

fejerShiftChi2Status : FCS.Chi2FalsifierStatus
fejerShiftChi2Status =
  FCS.FejerOverChi2Harness.chi2FalsifierStatus
    (FCSR.FejerOverChi2Report.harness FCSS.shiftReport)

chi2BoundaryCaseCount : Nat
chi2BoundaryCaseCount = CBSL.caseCount

observableCollapseShiftVerdict : OC.ObservableCollapseVerdict
observableCollapseShiftVerdict =
  OCR.ObservableCollapseReport.verdict OCS.shiftReport

snapThresholdShiftVerdict : STL.SnapThresholdVerdict
snapThresholdShiftVerdict =
  STLR.SnapThresholdReport.verdict STLS.shiftReport

syntheticOneMinusShellMatch : Bool
syntheticOneMinusShellMatch =
  SOSC.SyntheticShellComparisonReport.shell1Matches SOSC.report

syntheticOneMinusProfileMatch : Bool
syntheticOneMinusProfileMatch =
  SOSC.SyntheticShellComparisonReport.shell2Matches SOSC.report

syntheticOneMinusPromotionStatus : SOSC.SyntheticPromotionStatus
syntheticOneMinusPromotionStatus =
  SOSC.SyntheticShellComparisonReport.promotionStatus SOSC.report

syntheticOneMinusOrientationStatus : SOPB.SyntheticOrientationStatus
syntheticOneMinusOrientationStatus =
  SOPB.SyntheticPromotionBridge.orientationStatus SOPB.bridge

syntheticOneMinusSignatureStatus : SOPB.SyntheticSignatureStatus
syntheticOneMinusSignatureStatus =
  SOPB.SyntheticPromotionBridge.signatureStatus SOPB.bridge

syntheticOneMinusBridgeStatus : SOPB.SyntheticPromotionBridgeStatus
syntheticOneMinusBridgeStatus =
  SOPB.SyntheticPromotionBridge.promotionStatus SOPB.bridge

lorentzDynamicCandidateStatus : LNDC.DynamicCandidateStatus
lorentzDynamicCandidateStatus =
  LNDC.LorentzNeighborhoodDynamicCandidate.status LNDC.prototype

b4ShellComparisonVerdict : B4C.B4ShellComparisonVerdict
b4ShellComparisonVerdict =
  B4C.B4ShellComparisonReport.verdict B4C.report

b4PromotionStatus : B4C.B4PromotionStatus
b4PromotionStatus =
  B4C.B4ShellComparisonReport.promotionStatus B4C.report

shiftShellNeighborhood : SNC.ShellNeighborhoodClass
shiftShellNeighborhood =
  SNC.classifyShell1Neighborhood OPD.shell1_p3_q1

shiftMatchesParametricOneMinus :
  shiftShellNeighborhood ≡ SNC.oneMinusShellNeighborhood
shiftMatchesParametricOneMinus = OMSFP.shiftMatchesParametricFamily

parametricOneMinusFamilyTheorem :
  ∀ m →
  OMSFP.familyFormulaNeighborhood (suc (suc m))
  ≡ SNC.oneMinusShellNeighborhood
parametricOneMinusFamilyTheorem = OMSFP.familyFormulaNeighborhood-theorem

b4ShellNeighborhood : SNC.ShellNeighborhoodClass
b4ShellNeighborhood =
  B4C.B4ShellComparisonReport.shellNeighborhood B4C.report

shiftOrbitShellSeries : OSG.OrbitShellSeries
shiftOrbitShellSeries = OSGS.shiftSeries

b4OrbitShellSeries : OSG.OrbitShellSeries
b4OrbitShellSeries = OSGB4.b4Series

b4SeriesVerdict : OSSC.OrbitShellSeriesVerdict
b4SeriesVerdict =
  B4C.B4ShellComparisonReport.seriesVerdict B4C.report
