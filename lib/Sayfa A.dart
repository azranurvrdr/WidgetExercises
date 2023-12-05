import 'package:flutter/material.dart';
import 'package:widget/Sayfa%20B.dart';


class SayfaA extends StatefulWidget {
  const SayfaA({super.key});

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {
  TextEditingController textEditingController = TextEditingController();
  List<ChecklistItem> checklistItems = [];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Check List"),
      ),
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Öge ekle',
                    ),
                ),
            ),

            ElevatedButton(
                onPressed: (){
                  setState(() {
                    String newItemText = textEditingController.text;
                    if(newItemText.isNotEmpty) {
                      checklistItems.add(ChecklistItem(text: newItemText));
                      textEditingController.clear();
                    }
                  });
                },
                child: Text('Ekle'),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: checklistItems.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                          title: Text(checklistItems[index].text),
                          value: checklistItems[index].isChecked,
                          onChanged: (value) {
                            checklistItems[index].isChecked = value!;
                          });
                    },
                )
            ),

            ElevatedButton(
              child: Text("Sayfa B'ye git"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaB()));
              },
            ),

          ],
        ),
     );
    }
  }


  class ChecklistItem {
    String text;
    bool isChecked;

    ChecklistItem({required this.text, this.isChecked = false});
  }
