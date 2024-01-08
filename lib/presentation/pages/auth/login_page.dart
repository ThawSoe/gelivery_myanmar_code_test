import 'package:flutter/material.dart';
import 'package:gelivery_myanmar_code_test/presentation/controllers/auth/auth_controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset("assets/gelivery_myanmar_logo.png"),
              const SizedBox(height: 50),
              TextFormField(
                controller: controller.userNameCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                    hintText: "User Name/Phone Number/Email"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                  controller: controller.pswCtrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.star),
                      hintText: "Password")),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 48, 48, 175),
                      minimumSize: Size(Get.width, 40)),
                  onPressed: () {
                    controller.login();
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
