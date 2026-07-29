CLASS ltc_po_validator DEFINITION
  FINAL
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS valid_amount_is_accepted FOR TESTING.
ENDCLASS.

CLASS ltc_po_validator IMPLEMENTATION.
  METHOD valid_amount_is_accepted.
    DATA(lo_cut) = NEW zcl_po_validator( ).

    DATA(lv_message) = lo_cut->validate(
      iv_ebeln  = '4500000001'
      iv_amount = '100.00' ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_message
      exp = 'OK' ).
  ENDMETHOD.
ENDCLASS.
