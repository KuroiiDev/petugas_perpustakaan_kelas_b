import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_book_controller.dart';

class AddBookView extends GetView<AddBookController> {
  const AddBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddBookView'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.judulController,
                  decoration: InputDecoration(hintText: "Masukan Judul"),
                  validator: (value){
                    if (value!.isEmpty){
                      return "Judul tidak Boleh Kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.penulisController,
                  decoration: InputDecoration(hintText: "Masukan Nama Penulis"),
                  validator: (value){
                    if (value!.isEmpty){
                      return "Penulis Tidak Boleh Kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.penerbitController,
                  decoration: InputDecoration(hintText: "Masukan Penerbit Buku"),
                  validator: (value){
                    if (value!.isEmpty){
                      return "Penerbit Tidak Boleh Kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.tahunTerbitController,
                  decoration: InputDecoration(hintText: "Masukan Tahun Terbit Buku"),
                  validator: (value){
                    if (value!.isEmpty){
                      return "tahun Tidak Boleh Kosong";
                    }
                    return null;
                  },
                ),
                Obx(() => controller.loading.value?
                CircularProgressIndicator():
                ElevatedButton(onPressed: (){
                  controller.post();
                },child: Text("Add buku"))
                )
              ],
            ),
          )
      ),
    );
  }
}
