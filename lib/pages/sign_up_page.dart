import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:future_jobs_clone/models/user_model.dart';
import 'package:future_jobs_clone/pages/sign_in_page.dart';
import 'package:future_jobs_clone/providers/auth_provider.dart';
import 'package:future_jobs_clone/providers/user_provider.dart';
import 'package:future_jobs_clone/theme.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController goalController = TextEditingController(text: '');

  bool isEmailValid = true;
  bool isUploaded = true;
  bool isLoading = false;

  Widget uploadImages() {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            isUploaded = !isUploaded;
          });
        },
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(96),
          ),
          child: Center(
            child: Image.asset(
              "assets/image_profile.png",
              width: 108,
            ),
          ),
        ),
      ),
    );
  }

  Widget showedImages() {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            isUploaded = !isUploaded;
          });
        },
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(96),
          ),
          child: Center(
            child: Image.asset(
              "assets/icon_upload.png",
              width: 108,
            ),
          ),
        ),
      ),
    );
  }

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
                  "Sign Up",
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Begin Your Journey",
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                isUploaded ? showedImages() : uploadImages(),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Full Name",
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: TextFormField(
                          cursorColor: primaryColor,
                          controller: nameController,
                          style: purpleTextStyle.copyWith(),
                          decoration: InputDecoration(
                            fillColor: inputFieldColor,
                            filled: true,
                            hintText: 'John Doe',
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
                const SizedBox(
                  height: 20,
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
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Goal",
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: TextFormField(
                          cursorColor: primaryColor,
                          controller: goalController,
                          style: purpleTextStyle.copyWith(),
                          decoration: InputDecoration(
                            fillColor: inputFieldColor,
                            filled: true,
                            hintText: 'Become softwere engineer',
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
                                passwordController.text.isEmpty ||
                                nameController.text.isEmpty ||
                                goalController.text.isEmpty) {
                              showError("Semua field wajib diisi, cok!");
                            } else {
                              setState(() {
                                isLoading = true;
                              });

                              UserModel? user = await authProvider.register(
                                emailController.text,
                                passwordController.text,
                                nameController.text,
                                goalController.text,
                              );

                              setState(() {
                                isLoading = false;
                              });

                              if (user == null) {
                                showError("Email sudah tardaftar");
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
                            "Sign Up",
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
                            builder: (context) => const SignInPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Back to Sign In",
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
