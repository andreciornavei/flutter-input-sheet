import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:input_sheet/components/IpsCard.dart';
import 'package:input_sheet/components/IpsError.dart';
import 'package:input_sheet/components/IpsIcon.dart';
import 'package:input_sheet/components/IpsLabel.dart';
import 'package:input_sheet/components/IpsValue.dart';
import 'package:input_sheet/input_sheet.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:input_sheet/utils/colors.dart';

void main() => runApp(BottomBarApp());

class BottomBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keyboard Tree Demo',
      theme: ThemeData(
        primarySwatch: IpsColors.dark,
      ),
      home: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Keyboard Tree Demo"),
            ),
            body: TabBarView(
              children: [
                new FirstPage(),
                new Container(color: Color(0xffe5e5e5)),
                new Container(color: Color(0xffd5d5d5)),
                new Container(color: Color(0xffc5c5c5)),
              ],
            ),
            bottomNavigationBar: new TabBar(
              tabs: [
                Tab(icon: new Icon(Icons.home)),
                Tab(icon: new Icon(Icons.rss_feed)),
                Tab(icon: new Icon(Icons.perm_identity)),
                Tab(icon: new Icon(Icons.settings))
              ],
              labelColor: Colors.blue,
              unselectedLabelColor: Color(0xff3A3A3A),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  String _name;
  Map<String, dynamic> _errors = new Map<String, dynamic>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff5f5f5),
      child: SingleChildScrollView(
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
                error: IpsError(_errors['_name']),
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
            ],
          ),
        ),
      ),
    );
  }
}
