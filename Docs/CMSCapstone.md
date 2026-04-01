## CMS Capstone Bridge

This note ties the full Dashi bridge stack to the CMS/MIT near-miss photonuclear result described in Physical Review Letters. Each doc in `Docs/` contributes:

- `PhotonBridge.md` supplies the defect/near-miss geometry and the equivalent-photon projection that turns boundary field interactions into an observable channel.
- `CMSPhotonuclearBridge.md` registers how `D0` production underlies the clean near-miss probe that the paper reports.
- `CharmPhotoproduction.md` turns that photon-induced channel into a promoted observable and maps it to the Dashi inverse/MDL selection problem.
- `SaturationLayer.md` embeds the resulting `Y_{D0}` observable into concrete gluon-saturation/numerical model families.

In Dashi terms the CMS observation is now this composite pipeline:

1. The LHC near-miss is the defect channel `Δ` (the flattened photon halo) rather than a full head-on collision.
2. The photon flux is the projection of that defect channel into an effective probe—this is the equivalent-photon bridge.
3. The `D0` yield is the promoted observable extracted from that projection and treated as the MDL-inferred clean measurement in `CharmPhotoproduction.md`.
4. The gluon-density variable `g⋆` induced by `Y_{D0}` is mapped into saturation-scale variables via `SaturationLayer.md`, so Dashi observables now live directly on the model layer used by the LHC analysis.

What remains external to Dashi is the detailed Standard Model physics:

- the explicit QED/photon-flux formulas used to estimate the equivalent-photon spectrum aside from the general projection argument,
- the perturbative QCD photoproduction cross-sections for `γ + A → D0 + X`, and
- the numerical values in CMS's dataset and their statistical uncertainties.

Closing this lane means Dashi can now state precisely: the CMS near-miss measurement is an instance of the projection–defect–observable chain we formalized, and `Y_{D0}` can be interpreted as a Dashi observable that feeds into the same saturation-scale inference we already packaged. Turning that statement into a quantitative comparison still requires the external physics layers listed above, but the measurement geometry has been fully integrated into the codebase's story.
