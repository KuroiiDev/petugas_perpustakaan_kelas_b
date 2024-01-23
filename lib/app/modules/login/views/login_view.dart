import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(hintText: "Masukan Username"),
                validator: (value){
                  if (value!.isEmpty){
                    return "Username tidak Boleh Kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(hintText: "Masukan Password"),
                validator: (value){
                  if (value!.isEmpty){
                    return "Password Tidak Boleh Kosong";
                  }
                  return null;
                },
                obscureText: true,
              ),
              Obx(() => controller.loading.value?
              CircularProgressIndicator():
                ElevatedButton(onPressed: (){
                  controller.login();
                },child: Text("Login"))
              )
            ],
          ),
        )
      ),
    );
  }
}