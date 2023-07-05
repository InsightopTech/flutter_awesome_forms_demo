import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

import 'form.dart'; //基于原生的表单
import 'card_settings.dart'; //基于card_settings的表单
import 'fast_forms/fast_forms.dart'; //基于flutter_fast_forms的表单
import 'form_builder.dart'; //基于flutter_form_builder的表单
import 'form_builder_extra.dart'; //基于flutter_form_builder的表单

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var platformProvider = PlatformProvider(
      builder: (context) => const PlatformApp(
        title: 'Form Demo',
        home: MyHomePage(),
      ),
    );
    return defaultTargetPlatform == TargetPlatform.android
        ? GetMaterialApp(home: platformProvider)
        : GetCupertinoApp(home: platformProvider);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Get.snackbar('提示', '加载中', duration: const Duration(seconds: 1));
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text('Form Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlatformElevatedButton(
                child: const Text('原生'),
                onPressed: () {
                  Get.to(const FormDemo());
                }),
            PlatformElevatedButton(
              child: const Text('card_settings'),
              onPressed: () {
                Get.to(const CardSettingsDemo());
              },
            ),
            PlatformElevatedButton(
              child: const Text('flutter_fast_forms'),
              onPressed: () {
                Get.to(const FastFormsDemo());
              },
            ),
            PlatformElevatedButton(
              child: const Text('flutter_form_builder'),
              onPressed: () {
                Get.to(const FormBuilderDemo());
              },
            ),
            PlatformElevatedButton(
              child: const Text('flutter_form_builder_extra'),
              onPressed: () {
                Get.to(const FormBuilderExtraDemo());
              },
            ),
          ],
        ),
      ),
    );
  }
}
