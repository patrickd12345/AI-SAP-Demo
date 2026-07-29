CLASS zcl_po_validator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS validate
      IMPORTING
        iv_ebeln  TYPE ebeln
        iv_amount TYPE wrbtr
      RETURNING
        VALUE(rv_message) TYPE string.
ENDCLASS.

CLASS zcl_po_validator IMPLEMENTATION.
  METHOD validate.
    DATA: lt_items   TYPE STANDARD TABLE OF ekpo,
          ls_item    TYPE ekpo,
          lv_bukrs   TYPE ekko-bukrs.

    " Demo-only placeholder. Replace with the client-approved authorization
    " object and fields before any real SAP use.
    AUTHORITY-CHECK OBJECT 'Z_DEMO_PO'
      ID 'ACTVT' FIELD '02'.
    IF sy-subrc <> 0.
      rv_message = 'Not authorized to approve purchase order'.
      RETURN.
    ENDIF.

    IF iv_amount <= 0.
      rv_message = 'Purchase order amount must be greater than zero'.
      RETURN.
    ENDIF.

    SELECT SINGLE bukrs
      FROM ekko
      INTO lv_bukrs
      WHERE ebeln = iv_ebeln.

    IF lv_bukrs IS INITIAL.
      rv_message = 'Invalid purchase order'.
      RETURN.
    ENDIF.

    SELECT *
      FROM ekpo
      INTO TABLE lt_items
      WHERE ebeln = iv_ebeln.

    LOOP AT lt_items INTO ls_item.
      IF ls_item-menge <= 0.
        rv_message = 'Purchase order item quantity must be greater than zero'.
        RETURN.
      ENDIF.
    ENDLOOP.

    rv_message = 'OK'.
  ENDMETHOD.
ENDCLASS.
