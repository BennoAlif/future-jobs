import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:future_jobs_clone/models/user_model.dart';
import 'package:future_jobs_clone/pages/sign_up_page.dart';
import 'package:future_jobs_clone/providers/auth_provider.dart';
import 'package:future_jobs_clone/providers/user_provider.dart';
import 'package:future_jobs_clone/theme.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isEmailValid = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProfider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: redColor,
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign In",
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Build Your Career",
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Image.asset(
                    "assets/image_sign_in.png",
                    width: 260,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email Address",
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: TextFormField(
                          onChanged: (value) {
                            bool isValid = EmailValidator.validate(value);
                            setState(() {
                              isEmailValid = isValid;
                            });
                          },
                          cursorColor: primaryColor,
                          controller: emailController,
                          style: isEmailValid
                              ? purpleTextStyle.copyWith()
                              : redTextStyle.copyWith(),
                          decoration: InputDecoration(
                            fillColor: inputFieldColor,
                            filled: true,
                            hintText: 'yourmail@example.com',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                  color:
                                      isEmailValid ? primaryColor : redColor),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: TextFormField(
                          obscureText: true,
                          cursorColor: primaryColor,
                          controller: passwordController,
                          style: purpleTextStyle.copyWith(),
                          decoration: InputDecoration(
                            fillColor: inputFieldColor,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 40),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : TextButton(
                          onPressed: () async {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              showError("Semua fields haris diisi!");
                            } else {
                              setState(() {
                                isLoading = true;
                              });

                              UserModel? user = await authProvider.login(
                                emailController.text,
                                passwordController.text,
                              );

                              setState(() {
                                isLoading = false;
                              });

                              if (user == null) {
                                showError("Email atau password salah");
                              } else {
                                userProvider.user = user;

                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/home',
                                  (route) => false,
                                );
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(66),
                            ),
                          ),
                          child: Text(
                            "Sign In",
                            style: whiteTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Create New Account",
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
