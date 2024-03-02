import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/pages/home_page/bindings/home_page_binding.dart';
import 'package:todo/pages/home_page/views/home_page_view.dart';

import 'pages/modify_page/bindings/modify_page_binding.dart';
import 'pages/modify_page/views/modify_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomePageView.pageRoute,
      getPages: [
        GetPage(
            name: HomePageView.pageRoute,
            page: HomePageView.new,
            binding: HomePageBinding(),
            children: [
              GetPage(
                name: ModifyPageView.pageRoute,
                page: ModifyPageView.new,
                binding: ModifyPageBinding(),
              ),
            ]),
      ],
    );
  }
}
