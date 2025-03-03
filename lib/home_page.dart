import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController nimController = TextEditingController();
  TextEditingController kelasController = TextEditingController();
  String selectedMatakuliah = 'none';
  File? photo;
  final picker = ImagePicker();
  final GlobalKey _globalKey = GlobalKey();

  String savedName = '';
  String savedNim = '';
  String savedKelas = '';
  String savedMatakuliah = '';
  File? savedPhoto;

  List<String> mataKuliah = [
    'Administrasi Basis Data',
    'Proyek TI',
    'Pemrograman Mobile Dasar',
    'Pemrograman Web Lanjut',
    'Framework 1',
    'Komputasi Awan',
    'Communication Skill'
  ];

  Future<void> _saveLocalImage() async {
    // Implement the method to save the image locally
    setState(() {
      savedPhoto = photo;
    });
  }

  void _saveData() {
    setState(() {
      savedName = nameController.text;
      savedNim = nimController.text;
      savedKelas = kelasController.text;
      savedMatakuliah = selectedMatakuliah;
    });
  }

  BoxDecoration _inputBoxDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 3,
          offset: Offset(0, 2),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Biodata Mahasiswa',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 3,
        backgroundColor: Colors.lightBlue,
        actions: const [
          Icon(
            Icons.logout,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        leading: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RepaintBoundary(
                    key: _globalKey,
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      color: Colors.blue,
                      child:
                          photo == null ? const SizedBox() : Image.file(photo!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _saveLocalImage();
                      _saveData();
                    },
                    child: const Text(
                      'Save Data & Image',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: _inputBoxDecoration(),
                        child: TextField(
                          maxLength: 50,
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: const TextStyle(
                              color: Colors.blueGrey,
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: _inputBoxDecoration(),
                        child: TextField(
                          maxLength: 8,
                          controller: nimController,
                          decoration: InputDecoration(
                            labelText: 'NIM',
                            labelStyle: const TextStyle(
                              color: Colors.blueGrey,
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: _inputBoxDecoration(),
                        child: TextField(
                          maxLength: 20,
                          controller: kelasController,
                          decoration: InputDecoration(
                            labelText: 'Kelas',
                            labelStyle: const TextStyle(
                              color: Colors.blueGrey,
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: _inputBoxDecoration(),
                        child: DropdownButtonFormField<String>(
                          value: selectedMatakuliah,
                          items: [
                            DropdownMenuItem(
                              value: 'none',
                              child: Text('-'),
                            ),
                            ...mataKuliah.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ],
                          onChanged: (newValue) {
                            setState(() {
                              selectedMatakuliah = newValue!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Mata Kuliah',
                            labelStyle: const TextStyle(
                              color: Colors.blueGrey,
                            ),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              if (savedName.isNotEmpty ||
                  savedNim.isNotEmpty ||
                  savedKelas.isNotEmpty ||
                  savedMatakuliah.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (savedPhoto != null)
                        Center(
                          child: Image.file(
                            savedPhoto!,
                            height: 150,
                          ),
                        ),
                      const SizedBox(height: 8),
                      Text('Nama: $savedName'),
                      Text('NIM: $savedNim'),
                      Text('Kelas: $savedKelas'),
                      Text('Mata Kuliah: $savedMatakuliah'),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final pickedFile = await picker.pickImage(source: ImageSource.camera);
          if (pickedFile != null) {
            setState(() {
              photo = File(pickedFile.path);
            });
          }
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.camera),
      ),
    );
  }
}
