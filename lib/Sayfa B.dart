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
        appBar: AppBar(
          title: Text("Sayfa B"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
