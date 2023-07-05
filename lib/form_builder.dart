import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

/// flutter_form_builder demo page
///
/// https://pub.dev/packages/flutter_form_builder

class FormBuilderDemo extends StatefulWidget {
  const FormBuilderDemo({super.key});

  @override
  State<FormBuilderDemo> createState() => _FormBuilderDemoState();
}

class _FormBuilderDemoState extends State<FormBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: const Text('flutter_form_builder'),
        ),
        body: FormBuilder(
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              FormBuilderTextField(
                name: 'username',
                decoration: const InputDecoration(
                  labelText: '用户名(Text Field)',
                ),
              ),
            ],
          ),
        ).paddingAll(10));
  }
}
