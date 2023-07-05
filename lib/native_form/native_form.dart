import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

/// flutter original form demo page
///
/// https://flutter.dev/docs/cookbook/forms
class NativeFormDemo extends StatelessWidget {
  const NativeFormDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('基于原生的表单'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: '用户名',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: '手机号',
              ),
            ),
            // DropdownButtonFormField(items: items, onChanged: onChanged),
            // FormField
          ],
        ),
      ).paddingAll(10),
    );
  }
}
