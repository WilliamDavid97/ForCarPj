import 'package:chocholay_car/view/widget/app_bar.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class PriceProperty {
  int id;
  String name;
  PriceProperty(this.id, this.name);

  static List<PriceProperty> getProperty() {
    return <PriceProperty>[
      PriceProperty(1, 'Kyat'),
      PriceProperty(2, 'Lakh'),
      PriceProperty(3, 'Million'),
    ];
  }
}

class _AddItemState extends State<AddItem> {
  List<PriceProperty> _property = PriceProperty.getProperty();
  List<DropdownMenuItem<PriceProperty>> _dropdownMenuItems;
  PriceProperty _selectedProperty;
  int radioValue = 0;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_property);
    _selectedProperty = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<PriceProperty>> buildDropdownMenuItems(
      List properties) {
    List<DropdownMenuItem<PriceProperty>> items = List();
    for (PriceProperty property in properties) {
      items.add(DropdownMenuItem(
        value: property,
        child: Text(property.name),
      ));
    }
    return items;
  }

  onChangeDropdownItem(PriceProperty selectedProperty) {
    setState(() {
      _selectedProperty = selectedProperty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            CustomAppBar(),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Product Name'),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Enter Price'),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: DropdownButton(
                    value: _selectedProperty,
                    items: _dropdownMenuItems,
                    onChanged: onChangeDropdownItem,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 180),
              child: Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: radioValue,
                    onChanged: (t) {
                      setState(() {
                        radioValue = t;
                      });
                    },
                  ),
                  Text("Old"),
                  Radio(
                    value: 1,
                    groupValue: radioValue,
                    onChanged: (t) {
                      setState(() {
                        radioValue = t;
                      });
                    },
                  ),
                  Text("New")
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Detail of your product'),
              maxLines: 7,
              maxLength: 500,
            ),
            RaisedButton(
              onPressed: () {
                print("Submit Product");
              },
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              color: Colors.purple[200],
            ),
            Divider(
              thickness: 2,
              color: Colors.black54,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/facebook.png',
                  width: 35,
                  height: 35,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Share On My Wall",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/pages-icon.png',
                  width: 35,
                  height: 35,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Share On Facebook Page",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
