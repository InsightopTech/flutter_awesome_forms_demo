import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

import 'samples/add_dynamic_controls_sample.dart';
import 'samples/array_sample.dart';
import 'samples/complex_sample.dart';
import 'samples/date_picker_sample.dart';
import 'samples/disable_form_sample.dart';
import 'samples/login_sample.dart';
import 'samples/simple_sample.dart';

class ReactiveFormsDemo extends StatelessWidget {
  const ReactiveFormsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText('reactive_forms'),
      ),
      body: Center(
        child: Column(
          children: [
            PlatformElevatedButton(
                child: PlatformText('Complex Sample'),
                onPressed: () => Get.to(ComplexSample())),
            PlatformElevatedButton(
                child: PlatformText('Simple Sample'),
                onPressed: () => Get.to(SimpleSample())),
            PlatformElevatedButton(
                child: PlatformText('Add Dynamic Controls Sample'),
                onPressed: () => Get.to(AddDynamicControlsSample())),
            PlatformElevatedButton(
                child: PlatformText('Disable Form Sample'),
                onPressed: () => Get.to(DisableFormSample())),
            PlatformElevatedButton(
                child: PlatformText('Array Sample'),
                onPressed: () => Get.to(ArraySample())),
            PlatformElevatedButton(
                child: PlatformText('Login Sample'),
                onPressed: () => Get.to(LoginSample())),
            PlatformElevatedButton(
                child: PlatformText('Date Picker Sample'),
                onPressed: () => Get.to(DatePickerSample())),
            // PlatformElevatedButton(
            //   child: PlatformText('Reactive Form Widgets Sample'),
            //   onPressed: () => Get.to(ReactiveFormWidgetsSample())
            // ),
          ],
        ),
      ),
    );
  }
}
