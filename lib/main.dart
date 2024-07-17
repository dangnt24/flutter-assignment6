import 'package:assignment6/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.storage.request();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game for kids',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent, // Thay đổi màu status bar nếu cần
          statusBarIconBrightness: Brightness.dark, // Đặt icon màu tối
          statusBarBrightness: Brightness.light,
        ),
        child: WelcomeScreen(),
      ),
    );
  }
}
