import 'package:flutter/material.dart';
//import 'package:lottie/lottie.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

final _emailController = TextEditingController();
final _pwdController = TextEditingController();
final _firstNameController = TextEditingController();
final _lastNameController = TextEditingController();
final _confirmpwdController = TextEditingController();

class _SignupscreenState extends State<Signupscreen> {
  @override
  void signup() {
    Navigator.pushNamed(context, "/dashboard");
  }

  void login() {
    Navigator.pushNamed(context, "/loginscreen");
  }

  Widget customTextButton(
      String action, VoidCallback ontap, double buttonWidth) {
    return SizedBox(
      width: buttonWidth,
      child: TextButton(
        onPressed: ontap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.blue),
          padding:
              WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
        ),
        child: Text(
          action,
          style: const TextStyle(
              color: Color.fromARGB(249, 255, 255, 255), fontSize: 16),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.8;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
        title: const Text(
          "Welcome",
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _pwdController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _confirmpwdController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              customTextButton("Signup", signup, buttonWidth),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(onPressed: login, child: const Text("Login now")),
                ],
              )
            ],
          ),
        ),
      ),
      ),
      
    );
  }
}
