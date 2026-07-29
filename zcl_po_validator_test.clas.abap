CLASS ltc_po_validator DEFINITION
  FINAL
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS valid_amount_is_accepted FOR TESTING.
    METHODS zero_amount_is_rejected FOR TESTING.
    METHODS negative_amount_is_rejected FOR TESTING.
    METHODS unauthorized_caller_is_rejected FOR TESTING.
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

  METHOD zero_amount_is_rejected.
    DATA(lo_cut) = NEW zcl_po_validator( ).

    DATA(lv_message) = lo_cut->validate(
      iv_ebeln  = '4500000001'
      iv_amount = '0.00' ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_message
      exp = 'Purchase order amount must be greater than zero' ).
  ENDMETHOD.

  METHOD negative_amount_is_rejected.
    DATA(lo_cut) = NEW zcl_po_validator( ).

    DATA(lv_message) = lo_cut->validate(
      iv_ebeln  = '4500000001'
      iv_amount = '-1.00' ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_message
      exp = 'Purchase order amount must be greater than zero' ).
  ENDMETHOD.

  METHOD unauthorized_caller_is_rejected.
    " Demo specification only: the real SAP test must provide an authorization
    " seam, test double, or dedicated test user for a deterministic negative case.
    DATA(lo_cut) = NEW zcl_po_validator( ).

    DATA(lv_message) = lo_cut->validate(
      iv_ebeln  = '4500000001'
      iv_amount = '100.00' ).

    cl_abap_unit_assert=>assert_not_initial( lv_message ).
  ENDMETHOD.
ENDCLASS.
