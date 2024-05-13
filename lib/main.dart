import 'package:flutter/material.dart';
import 'package:flutter_test_/router.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

extension on GoRouter {
  void popUntil(String routePath) {
    while (routerDelegate.currentConfiguration.matches.last.matchedLocation != routePath) {
      if (!canPop()) {
        return;
      }
      pop();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              router.goNamed(Pages.second);
            },
            child: const Text('next page')),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                router.popUntil(Pages.home);
              },
              child: const Text('return'))),
    );
  }
}
