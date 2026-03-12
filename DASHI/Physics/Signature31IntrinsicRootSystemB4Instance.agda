module DASHI.Physics.Signature31IntrinsicRootSystemB4Instance where

open import Data.Unit using (tt)
open import Agda.Builtin.String using (String)

open import DASHI.Geometry.Signature31FromIntrinsicShellForcing as S31ISF
open import DASHI.Physics.Closure.ContractionForcesQuadraticStrong as CFQS

b4IntrinsicCoreAxioms :
  S31ISF.IntrinsicSignatureCoreAxioms
b4IntrinsicCoreAxioms =
  record
    { strengthenedContraction = CFQS.canonicalIdentityInvariantStrong 4
    ; causalSymmetry =
        record
          { coneNontrivial = tt
          ; arrowOrientation = tt
          ; isotropyWitness = tt
          ; finiteSpeedWitness = tt
          ; involutionWitness = tt
          ; nondegenerateQuadratic = tt
          ; quotientContractionWitness = tt
          }
    }

b4Label : String
b4Label = "root-system-b4-intrinsic-core"
