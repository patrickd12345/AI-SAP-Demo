# Five-Minute Interview Demo

## Setup

Open `patrickd12345/AI-SAP-Demo` in Cursor Mobile and start a Cloud Agent on the demo branch.

## Live sequence

1. Show `requirement.md` and the acceptance criteria.
2. Show the intentionally defective `zcl_po_validator.clas.abap`.
3. Show the happy-path-only `zcl_po_validator_test.clas.abap`.
4. Run `node evaluate.mjs` and show the intentional FAIL result.
5. Send this inspection prompt:

```text
Act as a senior SAP ABAP engineer embedded with a product team.

Inspect requirement.md, zcl_po_validator.clas.abap, zcl_po_validator_test.clas.abap, and AGENTS.md.
Do not edit files.

Separate your response into:
1. Observed facts
2. Inferred risks
3. Smallest proposed changes
4. Tests to add
5. Unresolved SAP dependencies
6. Approval request

Preserve the public method signature. Do not invent SAP objects. End with the status block from AGENTS.md.
```

6. Review the categorized findings and point out that the agent has not edited anything.
7. Approve only the smallest plan:

```text
Approved. Implement only the proposed plan.

After editing:
1. Run node evaluate.mjs.
2. Review the diff.
3. Do not claim real SAP activation, ATC, transport validation, authorization execution, or ABAP Unit execution.
4. Report each acceptance criterion as PASS or FAIL.
5. List all checks still requiring a real SAP environment.
```

8. Show the resulting diff and deterministic evaluation.
9. Close with: “The value is bounded execution, evaluation, repeatability, and preserved SAP governance—not uncontrolled code generation.”

## Required disclosure

This demo uses static files and deterministic checks. It does not connect to SAP. A real implementation would require approved interfaces, the developer’s SAP identity and authorizations, logged tool calls, human approval for writes, and normal SAP transport, QA, and production controls.
