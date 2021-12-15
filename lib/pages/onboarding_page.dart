import 'package:flutter/material.dart';
import 'package:future_jobs_clone/pages/home_page.dart';
import 'package:future_jobs_clone/pages/sign_in_page.dart';
import 'package:future_jobs_clone/theme.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/onboarding.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 30,
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Build Your Next\nFuture Career Like\na Master",
                    style: whiteTextStyle.copyWith(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "18,000 jobs available",
                    style: whiteTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 45,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(66),
                            ),
                          ),
                          child: Text(
                            "Get Started",
                            style: purpleTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 45,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInPage(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: transparentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(66),
                                side: BorderSide(color: whiteColor),
                              )),
                          child: Text(
                            "Sign In",
                            style: whiteTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
