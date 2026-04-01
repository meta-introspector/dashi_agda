from __future__ import annotations

import math
from dataclasses import dataclass
from typing import Any


@dataclass
class DashiStateSchema:
    trace_id: str
    delta: list[float]
    coarse_head: list[float]
    mdl_level: float
    photon_energy: float


@dataclass
class NumericObservables:
    trace_id: str
    delta_defect: float
    promoted_d0: float
    g_star: float
    q_s: float
    photon_energy: float
    mdl_level: float


def coerce_float_list(value: Any, name: str) -> list[float]:
    if not isinstance(value, list):
        raise ValueError(f"{name} must be a list")
    return [float(item) for item in value]


def load_state_schema(state: dict[str, Any]) -> DashiStateSchema:
    return DashiStateSchema(
        trace_id=str(state.get("trace_id", "anonymous-trace")),
        delta=coerce_float_list(state.get("delta", []), "delta"),
        coarse_head=coerce_float_list(state.get("coarse_head", []), "coarse_head"),
        mdl_level=float(state.get("mdl_level", 0.0)),
        photon_energy=float(state.get("photon_energy", state.get("omega_photon", 1.0))),
    )


def vector_norm(values: list[float]) -> float:
    return math.sqrt(sum(component * component for component in values))


def extract_numeric_observables(
    schema: DashiStateSchema,
    *,
    mdl_lambda: float,
    alpha_qs: float,
) -> NumericObservables:
    delta_defect = vector_norm(schema.delta)
    tau = float(schema.delta[0]) if schema.delta else 0.0
    aligned_spatial = sum(abs(component) for component in schema.coarse_head)

    promoted_d0 = abs(tau) + 0.5 * aligned_spatial
    g_star = promoted_d0 / (1.0 + mdl_lambda * max(schema.mdl_level, 0.0))
    q_s = max(g_star, 0.0) ** alpha_qs

    return NumericObservables(
        trace_id=schema.trace_id,
        delta_defect=delta_defect,
        promoted_d0=promoted_d0,
        g_star=g_star,
        q_s=q_s,
        photon_energy=schema.photon_energy,
        mdl_level=schema.mdl_level,
    )
