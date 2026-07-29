import fs from 'node:fs';

const source = fs.readFileSync('zcl_po_validator.clas.abap', 'utf8').toLowerCase();
const tests = fs.readFileSync('zcl_po_validator_test.clas.abap', 'utf8').toLowerCase();
const requirement = fs.readFileSync('requirement.md', 'utf8').toLowerCase();

const loopStart = source.indexOf('loop at');
const loopEnd = source.indexOf('endloop');
const selectInsideLoop = loopStart >= 0 && loopEnd > loopStart && source.slice(loopStart, loopEnd).includes('select');

const checks = [
  ['public method signature exists', source.includes('methods validate') && source.includes('iv_ebeln') && source.includes('iv_amount')],
  ['amount less than or equal to zero is handled', source.includes('iv_amount <= 0') || source.includes('iv_amount le 0')],
  ['authorization handling exists', source.includes('authority-check')],
  ['no select occurs inside loop', !selectInsideLoop],
  ['valid amount test exists', tests.includes('valid_amount_is_accepted')],
  ['zero amount test exists', tests.includes('zero_amount')],
  ['negative amount test exists', tests.includes('negative_amount')],
  ['unauthorized caller test exists', tests.includes('unauthorized')],
  ['manual sap validation is documented', requirement.includes('real sap checks still required')],
];

console.log('Evaluation Summary');
console.log('(simulated / static analysis - not real SAP execution)\n');

let passed = true;
checks.forEach(([label, ok], index) => {
  console.log(`Acceptance criterion ${index + 1}: ${ok ? 'PASS' : 'FAIL'} - ${label}`);
  if (!ok) passed = false;
});

console.log(`\nOverall: ${passed ? 'PASS' : 'FAIL'}`);
process.exitCode = passed ? 0 : 1;
