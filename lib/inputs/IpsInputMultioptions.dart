import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'IpsInput.dart';

class IpsInputMultioptions extends IpsInput {
  final Function(List<String>) _onDone;
  final Map<String, String> options;
  final List<String> value;
  final TextStyle optionTextStyle;
  final Icon optionSelectedIcon;
  final Icon optionUnselectedIcon;

  final _IpsInputMultioptions ipsInputMultioptions =
      new _IpsInputMultioptions();

  IpsInputMultioptions(
    this._onDone, {
    this.value,
    this.options = const {},
    this.optionTextStyle,
    this.optionSelectedIcon,
    this.optionUnselectedIcon,
  });

  @override
  onDone() {
    if (_onDone != null) {
      this.ipsInputMultioptions.done();
    }
  }

  @override
  State<StatefulWidget> createState() => this.ipsInputMultioptions;
}

class _IpsInputMultioptions extends State<IpsInputMultioptions> {
  final List<String> _selectedOptions = new List<String>();

  void done() {
    this.widget._onDone(_selectedOptions);
  }

  void _toggleOption(String option) {
    if (_selectedOptions.contains(option)) {
      setState(() {
        _selectedOptions.remove(option);
      });
    } else {
      setState(() {
        _selectedOptions.add(option);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedOptions.addAll(this.widget.value ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      height: 210,
      decoration: BoxDecoration(color: Colors.white),
      child: ListView.separated(
        itemCount: this.widget.options.length,
        separatorBuilder: (_, __) => Divider(
          height: 1,
        ),
        itemBuilder: (_, index) {
          String key = this.widget.options.keys.toList().elementAt(index);
          return ListTile(
            onTap: () => _toggleOption(key),
            dense: true,
            title: Text(
              this.widget.options[key],
              style: this.widget.optionTextStyle ??
                  TextStyle(
                    fontSize: 14,
                  ),
            ),
            trailing: Visibility(
              visible: _selectedOptions.contains(key),
              replacement: this.widget.optionSelectedIcon ??
                  Icon(
                    FeatherIcons.square,
                    size: 21,
                  ),
              child: this.widget.optionUnselectedIcon ??
                  Icon(FeatherIcons.checkSquare, size: 21),
            ),
          );
        },
      ),
    );
  }
}
