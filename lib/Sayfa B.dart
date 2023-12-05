import 'package:flutter/material.dart';
import 'package:widget/main.dart';

class SayfaB extends StatefulWidget {
  const SayfaB({super.key});

  @override
  State<SayfaB> createState() => _SayfaBState();
}

class _SayfaBState extends State<SayfaB> {

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
                child: Text('AnaSayfa'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AnaSayfa(title: 'Ana Sayfa'))
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink.shade50),
                ),
              ),
              ElevatedButton(
                child: Text('Sayfa A'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AnaSayfa(title: 'Madde Ekleme Sayfası'))
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
          title: Text("Sayfa B list"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Checkbox list starts here
              ListView(
                shrinkWrap: true,
                children: [
                  CheckboxListTile(
                    title: Text('Madde 1'),
                    value: false,
                    onChanged: (value) {
                      if(value != null) {
                      setState(() {
                        value = true;
                      });
                    }
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Madde 2'),
                    value: false,
                    onChanged: (value) {
                      if(value != null) {
                        setState(() {
                          value = true;
                        });
                      }
                    },
                   ),
                  CheckboxListTile(
                    title: Text('Madde 3'),
                    value: false,
                    onChanged: (value) {
                      if(value != null) {
                        setState(() {
                          value = true;
                        });
                      }
                    },
                  ),
                ],
              ),
              // Checkbox list ends here
              ElevatedButton(
                child: Text("Anasayfaya Dön"),
                onPressed: (){
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
              ElevatedButton(
                child: Text("Geldiği Sayfaya Dön"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: Text("Anasayfaya Geçiş Yap"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AnaSayfa(title: 'Ana Sayfa')));
                },
              ),
            ],
          ),
        ),
      );
    }
}
