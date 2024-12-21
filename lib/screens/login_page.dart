import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:sample_bank/common_widgets/index.dart';
import 'package:sample_bank/model/login_response.dart';
import 'package:sample_bank/screens/index.dart';
import 'package:sample_bank/stores/login_store.dart';
import 'package:sample_bank/utility/locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatelessWidget {
  final loginStore = locator<LoginStore>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReactionBuilder(
        builder: (context) => reaction(
          (_) => loginStore.loginResponse.value,
          (LoginResponse? response) async {
            if (response != null) {
              // Navigate to the next screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SendMoneyPage()),
              );
            }
          },
        ),
        child: Observer(
          builder: (context) => Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  CommonTextField(
                    textEditingController: loginStore.usernameController,
                    labelText: "Username",
                    prefixIcon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 16),
                  CommonTextField(
                    textEditingController: loginStore.passwordController,
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  CommonElevatedButton(
                    onPressed: () async {
                      loginStore.login();
                    },
                    buttonText:
                        loginStore.isLoading.value ? "Loading..." : "Login",
                  ),
                  if (loginStore.error.value != null)
                    Text(
                      loginStore.error.value!,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
