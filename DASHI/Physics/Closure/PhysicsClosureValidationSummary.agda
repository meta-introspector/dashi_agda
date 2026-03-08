module DASHI.Physics.Closure.PhysicsClosureValidationSummary where

-- Repo-facing validation summary entrypoint for the current Stage C snapshot.
-- Current explicit rigidity outcomes:
--   signed-permutation self-check      -> exactMatch
--   synthetic one-minus admissible case -> exactMatch
--   Bool inversion secondary case      -> signatureOnlyMatch
--   tail-permutation negative control  -> mismatch
-- This surface is intended to make the present validation state easy to cite
-- from the main closure entrypoints without drilling into the validation
-- implementation modules directly.

open import Agda.Builtin.Nat using (Nat; suc)
open import Agda.Builtin.Bool using (Bool)
open import Relation.Binary.PropositionalEquality using (_≡_)
open import DASHI.Geometry.ConeTimeIsotropy as CTI
import DASHI.Algebra.GaugeGroupContract as GGC
import DASHI.Physics.Constraints.ConcreteInstance as CI

open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosureValidation as MCPCV public
open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosureValidationShiftInstance as MCPCVS public
open import DASHI.Physics.Closure.MinimalCrediblePhysicsClosure as MCPC
open import DASHI.Physics.Closure.CanonicalStageCStatus as CSS public
  using (ClosureSurfaceStatus)
import DASHI.Physics.Closure.CanonicalStageC as CSC
open import DASHI.Physics.Closure.DynamicalClosure as DC
open import DASHI.Physics.Closure.DynamicalClosureWitness as DCW public
  using (DynamicalClosureWitness)
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
import DASHI.Physics.Closure.Validation.SyntheticOneMinusAdmissible as SOA
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
open import DASHI.Physics.Closure.CanonicalConstraintClosureStatus as CCCS public
  using (CanonicalConstraintClosureStatus; CanonicalConstraintClosureState)
open import DASHI.Physics.Closure.CanonicalConstraintClosureWitness as CCCW public
  using (CanonicalConstraintClosureWitness)
open import DASHI.Physics.Closure.CanonicalConstraintClosureTheorem as CCCT public
  using (CanonicalConstraintClosureTheorem)
open import DASHI.Physics.Closure.CanonicalGaugeContractTheorem as CGCT public
  using (canonicalGaugeAdmissible; canonicalGaugeContractTheorem; canonicalGaugeEmergence)
open import DASHI.Physics.Closure.CanonicalGaugeConstraintBridgeTheorem as CGCBT public
  using (CanonicalGaugeConstraintBridgeTheorem)
open import DASHI.Physics.Closure.CanonicalConstraintGaugePackage as CCGP public
  using (CanonicalConstraintGaugePackage)
open import DASHI.Physics.Closure.ParametricGaugeConstraintTheorem as PGCT public
  using (ParametricGaugeConstraintTheorem)
open import DASHI.Physics.Closure.KnownLimitsStatus as KLS public
  using
    ( KnownLimitsStatus
    ; LocalLorentzStatus
    ; PropagationLimitStatus
    ; GRLikeStatus
    ; QFTLikeStatus
    )
open import DASHI.Physics.Closure.KnownLimitsRecovery as KLR public
  using (KnownLimitsRecoveryWitness)
open import DASHI.Physics.Closure.KnownLimitsEffectiveGeometryTheorem as KLET public
  using (KnownLimitsEffectiveGeometryTheorem)
open import DASHI.Physics.Closure.KnownLimitsLocalRecoveryTheorem as KLRT public
  using (KnownLimitsLocalRecoveryTheorem)
open import DASHI.Physics.Closure.KnownLimitsRecoveryWitness as KLRW public
  using (KnownLimitsRecoveryWitnessPlus)
open import DASHI.Physics.Closure.KnownLimitsLocalRecoveryTheorem as KLRT public
  using (KnownLimitsLocalRecoveryTheorem)
open import DASHI.Physics.Closure.KnownLimitsRecoveryWitness as KLRW public
  using (KnownLimitsRecoveryWitnessPlus)
open import DASHI.Physics.Closure.CanonicalSpinDiracConsumer as CSDC public
  using (SpinDiracConsumerFromMinimal)
open import DASHI.Physics.Closure.SpinLocalLorentzBridgeTheorem as SLLB public
  using (SpinLocalLorentzBridge)
open import DASHI.Physics.Closure.KnownLimitsPropagationSpinTheorem as KLPST public
  using (KnownLimitsPropagationSpinTheorem)
open import DASHI.Physics.Closure.KnownLimitsRecoveryPackage as KLRP public
  using (KnownLimitsRecoveryPackage)
open import DASHI.Physics.Closure.KnownLimitsCausalPropagationTheorem as KLCPT public
  using (KnownLimitsCausalPropagationTheorem)

validationBundle : MCPCV.MinimalCrediblePhysicsClosureValidation
validationBundle = MCPCVS.minimumCredibleClosureValidationShift

canonicalStageCStatus : CSS.ClosureSurfaceStatus
canonicalStageCStatus = CSC.canonicalClosureStatus

canonicalDynamicsWitnessSummary : DCW.DynamicalClosureWitness
canonicalDynamicsWitnessSummary = CSC.canonicalDynamicsWitness

canonicalConstraintStatusSummary : CCCS.CanonicalConstraintClosureStatus
canonicalConstraintStatusSummary = CSC.canonicalConstraintStatus

canonicalConstraintWitnessSummary : CCCW.CanonicalConstraintClosureWitness
canonicalConstraintWitnessSummary = CSC.canonicalConstraintWitness

canonicalConstraintTheoremSummary : CCCT.CanonicalConstraintClosureTheorem
canonicalConstraintTheoremSummary = CSC.canonicalConstraintTheorem

canonicalGaugeContractTheoremSummary : GGC.UniquenessClaim CI.C
canonicalGaugeContractTheoremSummary = CSC.canonicalGaugeContractTheorem

canonicalGaugeConstraintBridgeTheoremSummary :
  CGCBT.CanonicalGaugeConstraintBridgeTheorem
canonicalGaugeConstraintBridgeTheoremSummary =
  CSC.canonicalGaugeConstraintBridgeTheorem

canonicalConstraintGaugePackageSummary :
  CCGP.CanonicalConstraintGaugePackage
canonicalConstraintGaugePackageSummary =
  CSC.canonicalConstraintGaugePackage

canonicalParametricGaugeConstraintTheoremSummary :
  PGCT.ParametricGaugeConstraintTheorem
    canonicalConstraintGaugePackageSummary
canonicalParametricGaugeConstraintTheoremSummary =
  CSC.canonicalParametricGaugeConstraintTheorem

canonicalKnownLimitsStatusSummary : KLS.KnownLimitsStatus
canonicalKnownLimitsStatusSummary = CSC.canonicalKnownLimitsStatus

canonicalKnownLimitsRecoverySummary : KLR.KnownLimitsRecoveryWitness
canonicalKnownLimitsRecoverySummary = CSC.canonicalKnownLimitsRecovery

canonicalKnownLimitsRecoveryWitnessSummary :
  KLRW.KnownLimitsRecoveryWitnessPlus
canonicalKnownLimitsRecoveryWitnessSummary =
  CSC.canonicalKnownLimitsRecoveryWitness

canonicalKnownLimitsLocalRecoveryTheoremSummary :
  KLRT.KnownLimitsLocalRecoveryTheorem
canonicalKnownLimitsLocalRecoveryTheoremSummary =
  CSC.canonicalKnownLimitsLocalRecoveryTheorem

canonicalKnownLimitsEffectiveGeometryTheoremSummary :
  KLET.KnownLimitsEffectiveGeometryTheorem
canonicalKnownLimitsEffectiveGeometryTheoremSummary =
  CSC.canonicalKnownLimitsEffectiveGeometryTheorem

canonicalKnownLimitsRecoveryPackageSummary :
  KLRP.KnownLimitsRecoveryPackage
canonicalKnownLimitsRecoveryPackageSummary =
  CSC.canonicalKnownLimitsRecoveryPackage

canonicalKnownLimitsCausalPropagationTheoremSummary :
  KLCPT.KnownLimitsCausalPropagationTheorem
canonicalKnownLimitsCausalPropagationTheoremSummary =
  CSC.canonicalKnownLimitsCausalPropagationTheorem

canonicalSpinLocalLorentzBridgeSummary :
  SLLB.SpinLocalLorentzBridge CSC.canonicalClosure
canonicalSpinLocalLorentzBridgeSummary =
  CSC.canonicalSpinLocalLorentzBridge

canonicalKnownLimitsPropagationSpinTheoremSummary :
  KLPST.KnownLimitsPropagationSpinTheorem
canonicalKnownLimitsPropagationSpinTheoremSummary =
  CSC.canonicalKnownLimitsPropagationSpinTheorem

canonicalSpinDiracConsumerSummary :
  CSDC.SpinDiracConsumerFromMinimal CSC.canonicalClosure
canonicalSpinDiracConsumerSummary = CSC.canonicalSpinDiracConsumer

selfSnapshotVerdict : RPR.RigidityVerdict
selfSnapshotVerdict = MCPCV.selfVerdict validationBundle

admissibleSnapshotVerdict : RPR.RigidityVerdict
admissibleSnapshotVerdict = MCPCV.admissibleVerdict validationBundle

boolInvSnapshotVerdict : RPR.RigidityVerdict
boolInvSnapshotVerdict = RPRS.boolInvVerdict

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

syntheticOneMinusBridgedOrientationTag : Nat
syntheticOneMinusBridgedOrientationTag =
  SOPB.SyntheticPromotionBridge.orientationTag SOPB.bridge

syntheticOneMinusBridgedSignature : CTI.Signature
syntheticOneMinusBridgedSignature =
  SOPB.SyntheticPromotionBridge.signature SOPB.bridge

lorentzDynamicCandidateStatus : LNDC.DynamicCandidateStatus
lorentzDynamicCandidateStatus =
  LNDC.LorentzNeighborhoodDynamicCandidate.status LNDC.syntheticReady

syntheticAdmissibleVerdict : RPR.RigidityVerdict
syntheticAdmissibleVerdict = SOA.syntheticAdmissibleVerdict

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
