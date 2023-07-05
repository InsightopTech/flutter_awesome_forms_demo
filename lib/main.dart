import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

import 'native_form/native_form.dart'; //基于原生的表单
import 'card_settings/card_settings.dart'; //基于card_settings的表单
// import 'form_builder.dart'; //基于flutter_form_builder的表单
import 'flutter_form_builder_extra/flutter_form_builder_extra.dart'; //基于flutter_form_builder的表单
import 'flutter_fast_forms/flutter_fast_forms.dart'; //基于flutter_fast_forms的表单
import 'reactive_forms/reactive_forms.dart'; //基于reactive_forms的表单
import 'flutter_form_builder/flutter_form_builder.dart'; //基于flutter_form_builder的表单

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
        title: 'Flutter Awesome Form Demo',
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
        title: PlatformText('Form Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlatformElevatedButton(
                child: PlatformText('Native Form'),
                onPressed: () => Get.to(const NativeFormDemo())),
            PlatformElevatedButton(
              child: PlatformText('card_settings'),
              onPressed: () => Get.to(const CardSettingsDemo()),
            ),
            PlatformElevatedButton(
              child: PlatformText('reactive_forms'),
              onPressed: () => Get.to(const ReactiveFormsDemo()),
            ),
            PlatformElevatedButton(
              child: PlatformText('flutter_fast_forms'),
              onPressed: () => Get.to(const FlutterFastFormsDemo()),
            ),
            PlatformElevatedButton(
              child: PlatformText('flutter_form_builder'),
              onPressed: () => Get.to(const FlutterFormBuilderDemo()),
            ),
            PlatformElevatedButton(
              child: PlatformText('flutter_form_builder_extra'),
              onPressed: () => Get.to(const FlutterFormBuilderExtraDemo()),
            ),
          ],
        ),
      ),
    );
  }
}
