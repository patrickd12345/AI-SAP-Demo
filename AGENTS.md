# Agent Rules

1. Inspect before editing.
2. Produce a plan before implementation.
3. Wait for explicit approval before changing ABAP files.
4. Preserve the public method signature.
5. Modify only files required by the approved plan.
6. Prefer the smallest valid change.
7. Do not invent SAP tables, authorization objects, APIs, or function modules.
8. Separate observed facts, inferred risks, proposed changes, and unresolved SAP dependencies.
9. Never claim real SAP execution.
10. Label all local results as simulated or static analysis.
11. Stop when context is insufficient.
12. End every pass with this copyable block:

```text
STATUS: COMPLETE | BLOCKED
MODE: CURSOR CLOUD AGENT
FILES_CHANGED:
STATIC_EVALUATION:
REAL_SAP_EXECUTION: NOT ATTEMPTED
UNRESOLVED_SAP_CHECKS:
BLOCKERS:
NEXT_STEP:
```
