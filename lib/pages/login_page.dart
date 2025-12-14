import 'package:flutter/material.dart';
import 'package:w_phonics/pages/home_page.dart';
import 'package:w_phonics/repository/auth_repository.dart';
import 'package:w_phonics/widgets/password_textfield.dart';
import 'package:w_phonics/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButton(),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10.0,
            children: [
              Image.asset(
                "assets/images/mouse_nobg.png",
                width: 250,
                height: 250,
              ),
              Text("Welcome back! Let's return to your phonics learning journey", textAlign:TextAlign.center,style:  TextStyle(
                color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600, 
              ),),
              CustomTextField(label: "email"),
            
              CustomTextField(label: "password", suffixIcon: Icon(Icons.visibility,color: Colors.white,) ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),),
                ],
              ),
            
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loginUser() async {
    try {
      await AuthRepository().signIn(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,  this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(
              MediaQuery.sizeOf(context).width * 0.7,
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ),
            );
          },
                  
          child: Text("Sign In"),
        ),
      ),
    );
  }
}
