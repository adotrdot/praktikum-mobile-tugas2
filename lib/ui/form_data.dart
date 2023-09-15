import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tugas_2/ui/tampil_data.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Input Data"),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Field Nama
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Siapa namamu?",
                      labelText: "Nama"),
                  validator: (String? value) {
                    return (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[a-z  A-Z]+$').hasMatch(value))
                        ? "Bukan sebuah nama"
                        : null;
                  },
                ),

                // Field NIM
                TextFormField(
                  controller: _nimController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.numbers),
                    hintText: "Berapa NIM-mu?",
                    labelText: "NIM",
                  ),
                  validator: (String? value) {
                    return (value == null ||
                            value.isEmpty ||
                            !RegExp(r'[A-Z]{1}[0-9]{1}[A-Z]{1}[0-9]{6}')
                                .hasMatch(value))
                        ? "Bukan format NIM UNSOED"
                        : null;
                  },
                ),

                // Field Tahun Lahir
                TextFormField(
                  controller: _tahunController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_month),
                    hintText: "Kapan kamu lahir?",
                    labelText: "Tahun Lahir",
                  ),
                  validator: (String? value) {
                    return (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[0-9]+$').hasMatch(value))
                        ? "Bukan sebuah tahun"
                        : null;
                  },
                ),

                // Tombol Submit
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String nama = _namaController.text;
                      String nim = _nimController.text;
                      int tahun = int.parse(_tahunController.text);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              TampilData(nama: nama, nim: nim, tahun: tahun)));
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ));
  }
}
