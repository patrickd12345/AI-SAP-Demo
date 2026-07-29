# Purchase Order Validation Requirement

## Objective

Validate a purchase order before approval while preserving the existing public method signature.

## Acceptance criteria

1. Reject total amounts less than or equal to zero.
2. Reject callers without approval authorization.
3. Accept valid purchase orders.
4. Do not perform database access inside an item loop.
5. Preserve the public method signature `validate`.
6. Return clear validation messages.
7. Include tests for valid amount, zero amount, negative amount, and unauthorized caller.
8. Document checks that still require a real SAP environment.
9. Clearly distinguish static demo evidence from real SAP execution.

## Demo authorization placeholder

The demo uses the fictional authorization object `Z_DEMO_PO` with activity `02` only to demonstrate a bounded authorization check. It is not claimed to exist in any SAP system and must be replaced with the client-approved authorization object and fields before real use.

## Real SAP checks still required

- Replace the fictional `Z_DEMO_PO` object with the approved client authorization object and fields
- Syntax check and class activation
- ATC or Code Inspector execution
- ABAP Unit execution in the target system
- Authorization-object confirmation and negative testing
- DDIC type and database-object validation
- Transport dependency and import-sequence review
- QA regression testing

## Evidence limitation

The repository evaluator performs simulated/static checks only. It does not prove SAP syntax, activation, ATC, authorization behaviour, ABAP Unit execution, transport readiness, or QA acceptance.
