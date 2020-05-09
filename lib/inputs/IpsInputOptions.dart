import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'IpsInput.dart';

class IpsInputOptions implements IpsInput {
  FixedExtentScrollController scrollCtrl;
  //ValueChanged<int> valueChanged;

  Function(String) _onDone;
  Map<String, String> options;
  String value;

  IpsInputOptions(
    this._onDone, {
    this.value,
    this.options,
  }) {
    if (this.options == null) {
      this.options = {};
    }
    scrollCtrl = FixedExtentScrollController(
      initialItem:
          this.value == null ? 0 : options.keys.toList().indexOf(this.value),
    );
  }

  @override
  onDone() {
    if (_onDone != null) {
      _onDone(
        options.length > 0
            ? options.keys.toList()[scrollCtrl.selectedItem]
            : null,
      );
    }
  }

  @override
  Widget widget() {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 210,
      decoration: BoxDecoration(color: Colors.white),
      child: CupertinoPicker.builder(
        backgroundColor: Colors.white,
        scrollController: scrollCtrl,
        itemExtent: 36,
        //onSelectedItemChanged: valueChanged,
        childCount: options.length,
        itemBuilder: (context, index) => Container(
          height: 36,
          alignment: Alignment.center,
          child: Text(
            options[options.keys.toList()[index]],
            style: TextStyle(
              color: Color(0xFF000046),
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
