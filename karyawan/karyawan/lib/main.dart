import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karyawan/models/karyawan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daftar Karyawan",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // Membuat method untuk membaca data json **
  // jangan lupa pada pubspect.yaml tambahkan assets: - assets/karyawan.json
  // membuat method untuk membaca data json
  Future<List<Karyawan>> _readJsonData() async {
    String response = await rootBundle.loadString('assets/karyawan.json');

    // menconvert json dari string json menggunakan json.decode
    // menggunakan list dynamic karena data json berbentuk array
    final List<dynamic> data = json.decode(response);

    // membuat list karyawan dengan menconvert string diatas menjadi list karyawan
    return data.map((json) => Karyawan.fromJson(json)).toList();
  }

//buat tampilan disini
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Daftar Karyawan"),
        ),
        body: FutureBuilder<List<Karyawan>>(
            future: _readJsonData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // mengambil data dari snapshot
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          snapshot.data![index].nama,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Umur: ${snapshot.data![index].umur} Tahun"),
                            Text(
                                "Alamat: ${snapshot.data![index].alamat.jalan}, ${snapshot.data![index].alamat.kota}, ${snapshot.data![index].alamat.provinsi}"),
                            Text(
                                "Hobi: ${snapshot.data![index].hobi.join(", ")}"),
                            // Panggil hobi index ke 0
                            if (snapshot.data![index].hobi.length > 1)
                              Text("Hobi: ${snapshot.data![index].hobi[0]}"),
                          ],
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
