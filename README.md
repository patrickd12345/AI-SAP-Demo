# AI-SAP-Demo

Interview-ready, fixture-based demonstration of bounded AI-assisted SAP ABAP engineering from Cursor Mobile / Cloud Agent.

## What it demonstrates

- RTCC-style bounded commands: role, task, context, constraints
- Inspect-before-edit workflow
- Explicit approval before implementation
- ABAP code review across correctness, performance, security, maintainability, and testing
- Deterministic evaluation without AI
- Clear separation between static demo evidence and real SAP execution

## Files

- `requirement.md` — business requirement and acceptance criteria
- `zcl_po_validator.clas.abap` — intentionally defective initial ABAP class
- `zcl_po_validator_test.clas.abap` — intentionally incomplete ABAP Unit tests
- `AGENTS.md` — repository rules for the coding agent
- `evaluate.mjs` — deterministic evaluator
- `expected-results.json` — expected initial failing state
- `DEMO_SCRIPT.md` — five-minute interview flow

## Run

```bash
node evaluate.mjs
```

The initial result must be `Overall: FAIL`. That failure is intentional and provides the before-state for the live demo.

## What is simulated

The evaluator performs local static checks only. It does not connect to SAP and does not prove activation, ATC results, ABAP Unit execution, authorization behavior, transport integrity, or production readiness.

## Real SAP path

In a client environment, an approved integration layer could expose read-only SAP capabilities to an MCP-capable coding agent. Normal SAP identity, authorization, ATC, testing, transport, QA, and production controls remain mandatory.
