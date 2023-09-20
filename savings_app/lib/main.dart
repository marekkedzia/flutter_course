import 'package:flutter/services.dart';
import 'package:savings_app/widgets/savings.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => {
            runApp(MaterialApp(
              theme: ThemeData().copyWith(
                  primaryColor: Colors.green,
                  scaffoldBackgroundColor:
                      const Color.fromARGB(255, 211, 210, 210),
                  colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: Colors.green,
                  ).copyWith(
                    secondary: const Color.fromARGB(255, 0, 121, 51),
                  )),
              title: 'Savings Manager',
              home: const Savings(),
            ))
          });
}
