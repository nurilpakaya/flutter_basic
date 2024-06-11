import 'package:flutter/material.dart';
import 'package:flutter_basic/mahasiswa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Data Mahasiswa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = true;
  List<mahasiswa> listmahasiswa = [
  mahasiswa(nim: 001, nama: 'Nuril Pakaya', address: 'Panggulo'),
  mahasiswa(nim: 002, nama: 'Melis', address: 'Moutong'),
  mahasiswa(nim: 003, nama: 'Fia Ibrahim', address: 'Bongomeme'),
  mahasiswa(nim: 004, nama: 'Alintiya Abdullah', address: 'Batulayar'),
  mahasiswa(nim: 005, nama: 'Nahdaliya Pakaya', address: 'Gorut'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text('Data Mahasiswa'),
                    content: Column(children: [
                      Row(
                        mainAxisAlignment: 
                        MainAxisAlignment.spaceAround,
                        children: [
                        const Text('Name:'),
                      Text(listmahasiswa[index].nama) 
                      ],
                      ),
                    ]),
                  );
                });
            },



            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text('${listmahasiswa[index].nim}'),
              ),
              title: Text('${listmahasiswa[index].nama}'),
              subtitle: Text('${listmahasiswa[index].address}'),
            ),
          );
        },
        itemCount: listmahasiswa.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}