import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:input_sheet/components/IpsCard.dart';
import 'package:input_sheet/components/IpsError.dart';
import 'package:input_sheet/components/IpsIcon.dart';
import 'package:input_sheet/components/IpsLabel.dart';
import 'package:input_sheet/components/IpsPhoto.dart';
import 'package:input_sheet/components/IpsVideo.dart';
import 'package:input_sheet/components/IpsValue.dart';
import 'package:input_sheet/input_sheet.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:input_sheet/utils/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input Sheet Demo',
      theme: ThemeData(
        primarySwatch: IpsColors.dark,
      ),
      home: MyHomePage(title: 'Input Sheet Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _name;
  String _about;
  String _phone;
  double _currency;
  String _flavor;
  String _born_date;
  File _photo;
  File _video;
  Uint8List _thumbnailVideo;

  Map<String, dynamic> _errors = new Map<String, dynamic>();
  Map<String, String> _flavors = {
    "0": "Chocolate",
    "1": "Vanilla",
    "3": "Raspberry",
    "4": "Blackberry",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Text example:',
              ),
              SizedBox(height: 15),
              IpsCard(
                label: IpsLabel("Name"),
                value: IpsValue(_name ?? "Touch to edit..."),
                icon: IpsIcon(FeatherIcons.user),
                error: IpsError(_errors['name']),
                onClick: () => InputSheet(
                  context,
                  label: "Name",
                  cancelText: "Cancel",
                  doneText: "Confirm",
                ).text(
                  placeholder: "Type here...",
                  value: _name,
                  onDone: (dynamic value) => setState(() {
                    _name = value;
                  }),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Long text example:',
              ),
              SizedBox(height: 15),
              IpsCard(
                label: IpsLabel("Describe about you"),
                value: IpsValue(_about ?? "Touch to edit..."),
                icon: IpsIcon(FeatherIcons.fileText),
                error: IpsError(_errors['about']),
                onClick: () => InputSheet(
                  context,
                  label: "About you",
                  cancelText: "Cancel",
                  doneText: "Confirm",
                ).longtext(
                  placeholder: "Type here...",
                  value: _about,
                  onDone: (dynamic value) => setState(() {
                    _about = value;
                  }),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Mask example:',
              ),
              SizedBox(height: 15),
              IpsCard(
                label: IpsLabel("Phone"),
                value: IpsValue(_phone ?? "Touch to edit..."),
                icon: IpsIcon(FeatherIcons.phone),
                error: IpsError(_errors['phone']),
                onClick: () => InputSheet(
                  context,
                  label: "Phone",
                  cancelText: "Cancel",
                  doneText: "Confirm",
                ).mask(
                  textInputType: TextInputType.number,
                  placeholder: "Type here...",
                  masks: ["(00) 0000-0000", "(00) 0 0000-0000"],
                  value: _phone,
                  onDone: (dynamic value) => setState(() {
                    _phone = value;
                  }),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Number example:',
              ),
              SizedBox(height: 15),
              IpsCard(
                label: IpsLabel("Currency"),
                value: IpsValue(_currency?.toString() ?? "Touch to edit..."),
                icon: IpsIcon(FeatherIcons.dollarSign),
                error: IpsError(_errors['currency']),
                onClick: () => InputSheet(
                  context,
                  label: "Phone",
                  cancelText: "Cancel",
                  doneText: "Confirm",
                ).number(
                  placeholder: "Type here...",
                  value: _currency ?? 0,
                  onDone: (double value) => setState(() {
                    _currency = value;
                  }),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Options example:',
              ),
              SizedBox(height: 15),
              IpsCard(
                label: IpsLabel("Your preffered flavor"),
                value: IpsValue(_flavors.containsKey(_flavor)
                    ? _flavors[_flavor]
                    : "Touch to select..."),
                icon: IpsIcon(FeatherIcons.facebook),
                error: IpsError(_errors['currency']),
                onClick: () => InputSheet(
                  context,
                  label: "Choose a flavor",
                  cancelText: "Cancel",
                  doneText: "Confirm",
                ).options(
                  value: _flavor,
                  options: _flavors,
                  onDone: (String value) => setState(() {
                    _flavor = value;
                  }),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Options example:',
              ),
              SizedBox(height: 15),
              IpsCard(
                label: IpsLabel("Your born date"),
                value: IpsValue(_born_date ?? "Touch to pick..."),
                icon: IpsIcon(CupertinoIcons.down_arrow),
                error: IpsError(_errors['_born_date']),
                onClick: () => InputSheet(
                  context,
                  label: "Pick a date",
                  cancelText: "Cancel",
                  doneText: "Confirm",
                ).date(
                  value: _born_date,
                  format: "dd/MM/yyyy",
                  pickerFormat: "dd|MM|yyyy",
                  onDone: (String value) => setState(() {
                    _born_date = value;
                  }),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Media example:',
              ),
              SizedBox(height: 15),
              Row(
                children: <Widget>[
                  Expanded(
                    child: IpsPhoto(
                      file: _photo,
                      onClick: () => InputSheet(
                        context,
                        cancelText: "Cancel",
                        doneText: "Confirm",
                      ).photo(
                        file: _photo,
                        onDone: (File file, Uint8List thumbnail) => setState(() {
                          _photo = file;
                        }),
                      ),
                    ),
                  ),
                  Expanded(
                    child: IpsVideo(
                      thumbnail: _thumbnailVideo,
                      onClick: () => InputSheet(
                        context,
                        cancelText: "Cancel",
                        doneText: "Confirm",
                      ).video(
                        file: _video,
                        onDone: (File file, Uint8List thumbnail) => setState(() {
                          _video = file;
                          _thumbnailVideo = thumbnail;
                        }),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
