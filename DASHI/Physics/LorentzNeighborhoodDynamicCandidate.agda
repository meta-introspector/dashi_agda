module DASHI.Physics.LorentzNeighborhoodDynamicCandidate where

open import Agda.Builtin.Bool using (Bool; false; true)
open import Agda.Builtin.String using (String)

open import DASHI.Physics.ShellNeighborhoodClass as SNC
import DASHI.Physics.SyntheticOneMinusShellRealization as SOM

data DynamicCandidateStatus : Set where
  prototypeScaffoldOnly : DynamicCandidateStatus
  shellProfileBacked : DynamicCandidateStatus
  admissibleDynamicReady : DynamicCandidateStatus

record LorentzNeighborhoodDynamicCandidate : Set where
  field
    label : String
    shellNeighborhood : SNC.ShellNeighborhoodClass
    hasIndependentDynamics : Bool
    hasShell2Structure : Bool
    hasOrientation : Bool
    hasSignature : Bool
    status : DynamicCandidateStatus

prototype : LorentzNeighborhoodDynamicCandidate
prototype =
  record
    { label = "lorentz-neighborhood-dynamic-prototype"
    ; shellNeighborhood = SOM.shellNeighborhood
    ; hasIndependentDynamics = false
    ; hasShell2Structure = true
    ; hasOrientation = false
    ; hasSignature = false
    ; status = prototypeScaffoldOnly
    }
