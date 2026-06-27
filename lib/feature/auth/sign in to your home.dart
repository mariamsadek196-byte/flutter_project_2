import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/create%20account.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),

              const SizedBox(height: 20),

              const Text(
                "Email address",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const CustomTextField(
                hint: "rebecca@home.io",
                icon: Icons.email_outlined,
              ),

              const SizedBox(height: 20),

              const Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              PasswordField(
                hidden: isHidden,
                onTap: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
              ),
              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?"),
                ),
              ),

              const SizedBox(height: 15),

              SignInButton(context),

              const SizedBox(height: 20),

              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("or continue with"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: SocialButton(
                      text: "Google",
                      icon: Icons.g_mobiledata,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: SocialButton(text: "Apple", icon: Icons.apple),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Center(
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff2F4F46),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CircleAvatar(
            backgroundColor: Colors.white24,
            child: Icon(Icons.home_outlined, color: Colors.white),
          ),
          Spacer(),
          Text("Welcome back", style: TextStyle(color: Colors.white70)),
          SizedBox(height: 5),
          Text(
            "Sign in to your home",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
//////////////////////////////////////////////////

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;

  const CustomTextField({super.key, required this.hint, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
//////////////////////////////////////////////////

class PasswordField extends StatelessWidget {
  final bool hidden;
  final VoidCallback onTap;

  const PasswordField({super.key, required this.hidden, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hidden,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.key_outlined),
        hintText: "Enter your password",
        filled: true,
        fillColor: Colors.grey.shade100,
        suffixIcon: IconButton(
          onPressed: onTap,
          icon: Icon(hidden ? Icons.visibility_off : Icons.visibility),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const SocialButton({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon), const SizedBox(width: 8), Text(text)],
      ),
    );
  }
}

Widget SignInButton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    height: 55,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff2F4F46),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const CreateAccount()),
        );
      },
      child: const Text(
        "Sign In",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}
