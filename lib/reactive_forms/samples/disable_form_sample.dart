import 'package:flutter/material.dart';
import '../sample_screen.dart';

class DisableFormSample extends StatefulWidget {
  @override
  State<DisableFormSample> createState() => _DisableFormSampleState();
}

class _DisableFormSampleState extends State<DisableFormSample> {
  @override
  Widget build(BuildContext context) {
    return SampleScreen(
      title: const Text('Disable form sample'),
      body: Container(),
    );
  }
}
