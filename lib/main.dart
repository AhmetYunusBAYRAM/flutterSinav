import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<String> txtList = ["Başlık", "Yazı1", "Yazı2", "Yazı3", "Yazı4"]; // Sınav başlayınca burayı dolduracaksınız.
String selectedTxt = txtList.first; // Uygulama ilk başlatıldığında ekrana liste'de bulununan ilk item yazılır.

//NOT : Listenin ilk item sadece uygulama ilk başlatıldığınına yazaılacak. Card widget'ına tıklandığında bir daha gelmeyecek.
//NOT : Sınav buna benzer çıkabilir. %100 bu sınav değildir.
//NOT : Sınavda kullancağınız widget'lar ve func'lar burada örnek ve açıklamalı şekilde kullanılmıştır.

//NOT : Sınavda kolaylık için kendimin ve ortağmın birlikte geliştirmiş oluğumuz flutter eklentisini kullanbilirsiniz.
//NOT : Eklenti bölümünden indirebilirsiniz. "One For Flutter" ilgili eklenti link : https://marketplace.visualstudio.com/items?itemName=one-for-flutter-extension.one-for-flutter

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Debug banner'ı kapat için bu alanı "false" yapıyoruz.
      home: Scaffold(
        appBar: AppBar(//AppBar widget.
          leading: IconButton( //AppBar widget'ının sol tarasınfa herhangi bir widget ekleme için "leading" kullanılır.
              onPressed: () {}, //Button tıklaınınca çalışan func
              icon: Icon(Icons
                  .ac_unit_outlined) // Buttın Icon
                  ), // AppBar sol tarafına button eklemek için kullanıyoruz.
          actions: [
            IconButton(onPressed: () {} ,//Button tıklaınınca çalışan func
             icon: Icon(Icons.percent) // Buttın Icon
             ) 
          ], // AppBar'ın sağ tarafına button eklemek için burayı kullanıyoruz.,
          backgroundColor: Colors
              .amber, // AppBar rengini değiştirmek için burayı değiştiriyoruz.
          title: Text(
              "Burda bir yazı olacak",
              style: TextStyle(color: Colors.black),//Belki ister istemez Text widget renk değiştirme.
              ), // App title Text yazarak yazı oluşturuyoruz.
          centerTitle:
              true, // Yazının ortada olaması için burayı "true" yapıyoruz.
        ),
        body: SafeArea(// Ekranın kullanışlı alanlarını kullanabilmek için bu widget'ı kullanıyoruz. Sınavda bunu yazmasınuza olur. Yazmanız takviye edilir.
          child: Column(
            children: [
              Row(),
              Padding(//Card ve CircleAvatar widget'ları arasında 20 pxl boşluk bırakmak için kullanılır.
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        "assets/charduck.png")),
              ), // Daire içinde resim göstermek için bu widget'ı kullanıyoruz.

              GestureDetector( // Card widget'ına tıklama işlevini kazandırmak için bu widget'ı kullanıyoruz.
                onTap: () { // Tıklaınınca çalışan func
                  Random rnd = Random(); // Random sınıfını oluşturma
                  int min = 1; // Minimum sayı
                  int max = txtList.length; // Maksimum sayı
                  var rndIndex = min + rnd.nextInt(max - min); // Min ve Max arasında rastgele sayı oluşturma
                  setState(() {//içinde yer alan kodlar tamamlanınca ekranı tekrar çizme (yenileme)
                    selectedTxt = txtList[rndIndex]; // Random oluşkan sayıyı kullanarak list'e sırarından o metni getirme
                  });
                },
                child: Card( // Card widget
                  child: Column( // Card widget'ın child'ına column ekleme
                    children: [
                      ListTile( // Card widget'ın içine yazı yazabilmek için List Title kullandım. Burası size kalmış kişiden kişite değişebilir.
                        tileColor: Colors.amber, // List tile rengini değiştirme
                        title: Center(child: Text('Yeni bir kelime')), // ListTitle ortasına yazı yazmak için bu satırı kullanıyoruz.
                      ),
                    ],
                  ),
                ),
              ),
              Text(selectedTxt), // Rastegele seçmiş olduğumuz yazısı ekrana yazdırmak için Text widget'ını kullanıyoruz.
            ],
            mainAxisAlignment: MainAxisAlignment
                .center, //Column içinde yer alan widget'ları ortalmak için kullanıyoruz.
          ),
        ),
      ),
    );
  }
}
//Creted By Ahmet Yunus BAYRAM
