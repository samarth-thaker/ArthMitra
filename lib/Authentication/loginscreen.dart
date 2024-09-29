import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

final _emailController = TextEditingController();
final _pwdController = TextEditingController();

void login(BuildContext context) {
  Navigator.pushNamed(context, "/dashboard");
}
void signup(BuildContext context){
  Navigator.pushNamed(context, "/signupscreen"); 
}
class _LoginscreenState extends State<Loginscreen> {
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

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.8;
    return PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Welcome back"),
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
                  customTextButton(
                    "Login",
                    () => login(context),
                    buttonWidth,
                  ),
                   Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(onPressed: ()=>signup(context), child: const Text("Signup now")),
                ],
              )
                ],
              ),
            ),
          ),
        ));
  }
}
