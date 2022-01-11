import 'dart:ffi';

import 'package:flutter/material.dart';

class urunDetay extends StatelessWidget {

  final String isim;
  final String fiyat;
  final String resimYolu;
  final bool mevcut;

  const urunDetay({Key? key, required this.isim, required this.fiyat, required this.resimYolu, required this.mevcut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            Hero(
              tag: resimYolu,
              child: Image.network(
                  resimYolu),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.red[400],
                  size: 40.0,
                ))
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              isim,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              fiyat,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[400]),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Text(
                "Bu Bölümde ürün açıklaması bulunacak. Ürünün ne kadar kaliteli olduğu hakkında bilgiler verecek.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: mevcut ? Colors.red[400]:Colors.black,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Text(
                  mevcut ? "Sepete Ekle" : "Stokta Yok",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
