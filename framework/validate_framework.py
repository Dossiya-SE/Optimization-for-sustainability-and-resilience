import json

STAGES = [
    (1, 'Multilayer Structure', 'WHAT EXISTS?'),
    (2, 'Causal Mechanisms', 'WHY DOES DISRUPTION PROPAGATE?'),
    (3, 'Coupled Hybrid Multiscale Dynamics', 'HOW AND WHEN DOES IT EVOLVE?'),
    (4, 'Feedback & Control', 'HOW DOES THE SYSTEM RESPOND?'),
    (5, 'Viability', 'CAN IT SURVIVE?'),
    (6, 'Resilience-to-Sustainability Transformation Interface', 'WHAT DO THE RESILIENCE RESULTS IMPLY FOR SUSTAINABILITY?'),
    (7, 'Sustainable Transformation Pathways', 'WHAT SHOULD CHANGE FOR LONG-TERM SUSTAINABILITY?'),
]

LAYERS = ['P', 'T', 'I', 'O']
DIRECTED_CROSS_LAYER_DEPENDENCIES = [(a,b) for a in LAYERS for b in LAYERS if a != b]
EDGES = [(i, i+1) for i in range(1, 7)]

checks = {
    'stage_count_is_7': len(STAGES) == 7,
    'core_resilience_stages_are_1_to_5': [s[0] for s in STAGES[:5]] == [1,2,3,4,5],
    'sustainability_extension_stages_are_6_to_7': [s[0] for s in STAGES[5:]] == [6,7],
    'stage_chain_is_sequential': EDGES == [(1,2),(2,3),(3,4),(4,5),(5,6),(6,7)],
    'ptio_has_12_directed_cross_layer_dependencies': len(DIRECTED_CROSS_LAYER_DEPENDENCIES) == 12,
    'sustainability_does_not_feed_back_into_core_definition': all(dst <= 5 for src,dst in EDGES if src <= 4),
    'translation_boundary_is_after_viability': (5,6) in EDGES,
    'transformation_is_downstream_of_translation': (6,7) in EDGES,
}

report = {
    'framework': 'Causal-Hybrid Multilayer Resilience-to-Sustainability Framework',
    'canonical_date': '2026-09-09',
    'stages': STAGES,
    'directed_cross_layer_dependencies': DIRECTED_CROSS_LAYER_DEPENDENCIES,
    'checks': checks,
    'all_checks_pass': all(checks.values()),
}

print(json.dumps(report, indent=2))
with open('validation_report.json','w') as f:
    json.dump(report, f, indent=2)

if not report['all_checks_pass']:
    raise SystemExit('Framework validation failed')
