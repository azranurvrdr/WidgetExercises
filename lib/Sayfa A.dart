import 'package:flutter/material.dart';
import 'package:widget/Sayfa%20B.dart';


class SayfaA extends StatefulWidget {
  const SayfaA({super.key});

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {
  String _inputText = "";
  List<String> _checkedItems = [];


  @override
  Widget build(BuildContext context) {
    String item;

    return Scaffold(
      appBar: AppBar(
        title: Text("Check List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter Text',
              ),
              onChanged: (text) {
                setState(() {
                  _inputText = text;
                });
              },
            ),

            ElevatedButton(
              child: Text('List'),
              onPressed: _generateCheckList,
            ),

            ListView(
              children: _checkedItems.map((item) => CheckboxListTile(
                  value: _checkedItems.contains(item),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        _checkedItems.add(item);
                      } else {
                        _checkedItems.remove(item);
                      }
                    });
                  },
                  title: Text(item))).toList(),
            ),

            ElevatedButton(
              child: Text("Sayfa B'ye git"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaB()));

              },
            ),
          ],
        ),
      ),
    );
  }

  void _generateCheckList() {
    if (_inputText != null) {
      _checkedItems.clear();
      _inputText.split(" ").forEach((item) {
        _checkedItems.add(item);
      });
    }
  }
}
