import 'package:flutter/material.dart';
import 'package:sample_bank/common_widgets/common_elevated_button.dart';
import 'package:sample_bank/common_widgets/index.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                textEditingController: _usernameController,
                labelText: "Username",
              ),
              const SizedBox(height: 16),
              CommonTextField(
                textEditingController: _passwordController,
                labelText: "Password",
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              CommonElevatedButton(
                onPressed: () {
                  final username = _usernameController.text;
                  final password = _passwordController.text;

                  // Simple login validation
                  if (username.isNotEmpty && password.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Logged in as $username")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Please fill in all fields")),
                    );
                  }
                },
                buttonText: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
