import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'screens/homepage.dart';

void main()
{
  runApp(MyApp());
}
// void main() => runApp(
//   DevicePreview(
//     enabled: true,
//     builder: (context) => MyApp(), // Wrap your app
//   ),
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}