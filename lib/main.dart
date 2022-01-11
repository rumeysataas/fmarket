import 'package:flutter/material.dart';
import 'package:fmarket/sepet.dart';
import 'package:fmarket/urunler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Market',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _aktifIcerikNo = 0;
  late List _icerikler;

  @override
  void initState() {
    super.initState();
    _icerikler = [Urunler(), Sepet()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red[400]),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Uçarak Gelsin",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
      body: _icerikler[_aktifIcerikNo],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Selçuk Mert"),
              accountEmail: Text("selma@gmail.com"),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage("https://cdn.pixabay.com/photo/2021/06/15/16/11/man-6339003__340.jpg"),
                      fit: BoxFit.cover
                ),
                borderRadius:  BorderRadius.circular(50.0)
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red[400],
              ),
            ),
            ListTile(title: Text("Siparişlerim"),onTap: (){},),
            ListTile(title: Text("İndirimlerim"),onTap: (){},),
            ListTile(title: Text("Ayarlar"),onTap: (){},),
            ListTile(title: Text("Çıkış Yap"),onTap: (){
              Navigator.pop(context);
            },),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _aktifIcerikNo,
        selectedItemColor: Colors.red[400],
        unselectedItemColor: Colors.grey[600],
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("Ürünler")),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), title: Text("Sepetim")),
        ],
        onTap: (int tiklananButonPozisyonNo) {
          setState(() {
            _aktifIcerikNo = tiklananButonPozisyonNo;
          });
        },
      ),
    );
  }
}
