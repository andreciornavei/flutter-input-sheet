import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'IpsInput.dart';

class IpsInputOptions extends IpsInput {
  final Function(String) _onDone;
  final Map<String, String> options;
  final String value;

  final _IpsInputOptions ipsInputOptions = new _IpsInputOptions();

  IpsInputOptions(
    this._onDone, {
    this.value,
    this.options = const {},
  });

  @override
  onDone() {
    if (_onDone != null) {
      this.ipsInputOptions.done();
    }
  }

  @override
  State<StatefulWidget> createState() => this.ipsInputOptions;
}

class _IpsInputOptions extends State<IpsInputOptions> {
  FixedExtentScrollController scrollCtrl;

  void done() {
    this.widget._onDone(
          this.widget.options.length > 0
              ? this.widget.options.keys.toList()[scrollCtrl.selectedItem]
              : null,
        );
  }

  @override
  void initState() {
    super.initState();
    scrollCtrl = FixedExtentScrollController(
      initialItem: this.widget.value == null
          ? 0
          : this.widget.options.keys.toList().indexOf(this.widget.value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 210,
      decoration: BoxDecoration(color: Colors.white),
      child: CupertinoPicker.builder(
        backgroundColor: Colors.white,
        scrollController: this.scrollCtrl,
        itemExtent: 36,
        onSelectedItemChanged: (int) => {},
        childCount: this.widget.options.length,
        itemBuilder: (context, index) => Container(
          height: 36,
          alignment: Alignment.center,
          child: Text(
            this.widget.options[this.widget.options.keys.toList()[index]],
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
