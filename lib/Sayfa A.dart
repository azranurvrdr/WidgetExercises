import 'package:flutter/material.dart';
import 'package:widget/Sayfa%20B.dart';
import 'package:widget/main.dart';


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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Menü',
                  style:
                  TextStyle(
                      fontSize: 40,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.pinkAccent.shade100,
              ),
            ),

            ElevatedButton(
              child: Text('Anasayfa'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AnaSayfa(title: 'AnaSayfa'))
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink.shade50),
              ),
            ),
            ElevatedButton(
              child: Text('Sayfa B'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaB())
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink.shade50),
              ),
            ),
          ],
        ),
      ),


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
