// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: GetData(),
  ));
}

class GetData extends StatelessWidget {
  final String apiUrl =
      "https://gms.perikananlestari.id/api/api.php?function=get_data";

  const GetData({super.key});

  //static const _url = 'https://gms.perikananlestari.id/stock/img-qrcode/';

  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse(apiUrl));

    return json.decode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        //icon: const Icon(Icons.add_alert),
        title: const Center(
          child: Text('Nugraha-EdSpert'),
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(snapshot.data[index]['url']),
                        ),
                        title: Text(snapshot.data[index]['kode_barcode']),
                        subtitle: Text(snapshot.data[index]['jenis'] +
                            " | " +
                            snapshot.data[index]['target']),
                        trailing: const Icon(Icons.more_vert),
                        onTap: () => print("ListTile")
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       new MaterialPageRoute(
                        //           builder: (context) =>
                        //               DetailPage(snapshot.data[index])));
                        // },
                        );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade900,
        mouseCursor: SystemMouseCursors.grab,
        selectedFontSize: 20,
        selectedIconTheme:
            const IconThemeData(color: Colors.amberAccent, size: 25),
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water),
            label: 'Histori',
          ),
        ],
      ),
    );
  }
}

// class DetailPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var nama= ;
//     return Scaffold(
//         appBar: AppBar(
//       title: Text(context.nama),
//     ));
//   }
// }
