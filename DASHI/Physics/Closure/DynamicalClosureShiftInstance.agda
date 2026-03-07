module DASHI.Physics.Closure.DynamicalClosureShiftInstance where

open import DASHI.Physics.Closure.DynamicalClosure as DC
open import DASHI.Physics.Closure.ShiftSeamCertificates as SSC
open import DASHI.Physics.Closure.MDLLyapunovShiftInstance as MDLL
open import DASHI.Physics.Closure.MDLFejerAxiomsShift as MDLFA

shiftDynamics : DC.DynamicalClosure
shiftDynamics =
  record
    { seams = λ {m} {k} → SSC.shiftSeams {m} {k}
    ; lyapunovShift = λ {m} {k} → MDLL.lyapunovShift {m} {k}
    ; mdlFejerWitness = MDLFA.mdlFejerShift
    }
