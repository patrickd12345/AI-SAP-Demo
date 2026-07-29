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
    DATA: lt_items TYPE STANDARD TABLE OF ekpo,
          ls_item  TYPE ekpo,
          lv_x     TYPE ekko-bukrs.

    SELECT *
      FROM ekpo
      INTO TABLE lt_items
      WHERE ebeln = iv_ebeln.

    LOOP AT lt_items INTO ls_item.
      SELECT SINGLE bukrs
        FROM ekko
        INTO lv_x
        WHERE ebeln = ls_item-ebeln.

      IF ls_item-menge = 0.
        rv_message = 'Item quantity is invalid'.
      ENDIF.

      IF lv_x IS INITIAL.
        rv_message = 'Invalid purchase order'.
      ENDIF.
    ENDLOOP.

    IF iv_amount = 0.
      rv_message = 'Invalid amount'.
    ENDIF.

    IF rv_message IS INITIAL.
      rv_message = 'OK'.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
