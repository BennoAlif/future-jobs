import 'package:flutter/material.dart';
import 'package:future_jobs_clone/pages/home_page.dart';
import 'package:future_jobs_clone/pages/onboarding_page.dart';
import 'package:future_jobs_clone/pages/sign_in_page.dart';
import 'package:future_jobs_clone/pages/sign_up_page.dart';
import 'package:future_jobs_clone/pages/splash_page.dart';
import 'package:future_jobs_clone/providers/auth_provider.dart';
import 'package:future_jobs_clone/providers/category_provider.dart';
import 'package:future_jobs_clone/providers/job_provider.dart';
import 'package:future_jobs_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProfider>(
          create: (context) => AuthProfider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<JobProvider>(
          create: (context) => JobProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/register': (context) => const SignUpPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
