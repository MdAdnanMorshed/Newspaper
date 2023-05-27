import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newspaper_app/app/data/utils/app_space.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication '),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.green,
                  child: Text('Logo')),
              AppSpace.spaceH20,
              const Text('User Authentication'),
              AppSpace.spaceH10,
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      AppSpace.spaceH20,
                      TextFormField(
                        controller: controller.userMailAddressController,
                        style: const TextStyle(color: Colors.green),
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue)),
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              bottom: 10.0, left: 10.0, right: 10.0),
                          labelText: 'User Mail Address',
                        ),
                        validator: (val) {
                          if (val == '') return 'Enter valid email';
                        },
                      ),
                      AppSpace.spaceH20,
                      TextFormField(
                        obscureText: true,
                        controller: controller.userPasswordController,
                        style: const TextStyle(color: Colors.green),
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue)),
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              bottom: 10.0, left: 10.0, right: 10.0),
                          labelText: 'Password',
                        ),
                        validator: (val) {
                          if (val == '' && val!.length < 7)
                            return 'Enter valid password';
                        },
                      )
                    ],
                  ),
                ),
              ),
              Obx(() => ElevatedButton(
                    onPressed: () {
                      print(
                          'AuthenticationView.build ${controller.isRegister.value}');
                      if (controller.formKey.currentState!.validate()) {
                        if (controller.isRegister.value) {
                          controller
                              .signUpByFirebaseAPI(); //controller.signUp()
                        } else {
                          controller
                              .signInByFirebaseAPI(); //controller.signIn();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 5),
                        textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    child: controller.isRegister.value
                        ? const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          )
                        : const Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                  )),
              AppSpace.spaceH20,
              Obx(() => InkWell(
                  onTap: () {
                    if (controller.isRegister.value) {
                      controller.auth.value = 'Sign Up';
                      controller.isRegister.value = false;
                    } else {
                      controller.auth.value = 'Sign In';
                      controller.isRegister.value = true;
                    }
                  },
                  child: Text(
                      '''Don't have an account ? ${controller.auth.value} '''))),
              AppSpace.spaceH40,
            ],
          ),
        ),
      ),
    );
  }
}
