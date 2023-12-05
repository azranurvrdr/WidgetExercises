import 'package:flutter/material.dart';
import 'package:widget/Sayfa%20A.dart';
import 'package:widget/Sayfa%20B.dart';

void main() {
  runApp(const OgrenciApp());
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Öğrenci Uygulaması',
      debugShowCheckedModeBanner: false,  //bannerı kaldırmak için
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const AnaSayfa(title: 'Ana Sayfa'),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key, required this.title});

  final String title;

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
              child: Text('Sayfa A'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaA())
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

        title: Text(title),
      ),
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Sayfa A'ya git"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaA()));
              },
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
}
