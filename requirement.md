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

## Real SAP checks still required

- Syntax check and class activation
- ATC or Code Inspector execution
- ABAP Unit execution in the target system
- Authorization-object confirmation and negative testing
- DDIC type and database-object validation
- Transport dependency and import-sequence review
- QA regression testing
