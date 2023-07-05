import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

import 'form_array_item.dart';
import 'custom_form_field.dart';

import 'package:get/get.dart';

/// flutter_fast_forms demo page
///
/// https://pub.dev/packages/flutter_fast_forms
class FastFormsDemo extends StatefulWidget {
  const FastFormsDemo({super.key});

  @override
  State<FastFormsDemo> createState() => _FastFormsDemoState();
}

class _FastFormsDemoState extends State<FastFormsDemo> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text('flutter_fast_forms'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FastForm(
                formKey: _formKey,
                inputDecorationTheme: InputDecorationTheme(
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[700]!, width: 1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[500]!, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                children: _buildForm(context),
                onChanged: (value) {
                  // ignore: avoid_print
                  print('Form changed: ${value.toString()}');
                },
              ),
              ElevatedButton(
                child: const Text('Reset'),
                onPressed: () => _formKey.currentState?.reset(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildForm(BuildContext context) {
    return [
      FastFormSection(
        padding: const EdgeInsets.all(16.0),
        header: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Form Example Section',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        children: [
          FastAutocomplete<String>(
            name: 'autocomplete',
            labelText: 'Autocomplete',
            options: const ['Alaska', 'Alabama', 'Connecticut', 'Delaware'],
          ),
          FastFormArray<String>(
            name: 'form_array',
            reorderable: true,
            labelText: 'Form Array',
            initialValue: const ['One', 'Two', 'Three'],
            itemBuilder: (key, index, field) =>
                FastFormArrayItem(key, index, field),
          ),
          FastDatePicker(
            name: 'date_picker',
            labelText: 'Date Picker',
            firstDate: DateTime(1970),
            lastDate: DateTime(2040),
          ),
          FastDateRangePicker(
            name: 'date_range_picker',
            labelText: 'Date Range Picker',
            firstDate: DateTime(1970),
            lastDate: DateTime(2040),
          ),
          const FastTimePicker(
            name: 'time_picker',
            labelText: 'Time Picker',
          ),
          const FastChipsInput(
            name: 'input_chips',
            labelText: 'Input Chips',
            options: ['Angular', 'React', 'Vue', 'Svelte', 'Flutter'],
            initialValue: [
              'HTML',
              'CSS',
              'React',
              'Dart',
              'TypeScript',
              'Angular',
            ],
          ),
          FastChoiceChips(
            name: 'choice_chips',
            labelText: 'Choice Chips',
            alignment: WrapAlignment.center,
            chipPadding: const EdgeInsets.all(8.0),
            chips: [
              FastChoiceChip(
                avatar: const FlutterLogo(),
                selected: true,
                value: 'Flutter',
              ),
              FastChoiceChip(
                avatar: const Icon(Icons.android_sharp, size: 16.0),
                value: 'Android',
              ),
              FastChoiceChip(
                selected: true,
                value: 'Chrome OS',
              ),
            ],
            validator: (value) => value == null || value.isEmpty
                ? 'Please select at least one chip'
                : null,
          ),
          const FastSwitch(
            name: 'switch',
            labelText: 'Switch',
            titleText: 'This is a switch',
            contentPadding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
          ),
          FastTextField(
            name: 'text_field',
            labelText: 'Text Field',
            placeholder: 'MM/JJJJ',
            keyboardType: TextInputType.datetime,
            maxLength: 7,
            prefix: const Icon(Icons.calendar_today),
            buildCounter: inputCounterWidgetBuilder,
            inputFormatters: const [],
            validator: Validators.compose([
              Validators.required((value) => 'Field is required'),
              Validators.minLength(
                  7,
                  (value, minLength) =>
                      'Field must contain at least $minLength characters')
            ]),
          ),
          const FastDropdown<String>(
            name: 'dropdown',
            labelText: 'Dropdown Field',
            items: ['Norway', 'Sweden', 'Finland', 'Denmark', 'Iceland'],
            initialValue: 'Finland',
          ),
          FastRadioGroup<String>(
            name: 'radio_group',
            labelText: 'Radio Group Model',
            options: const [
              FastRadioOption(title: Text('Option 1'), value: 'option-1'),
              FastRadioOption(title: Text('Option 2'), value: 'option-2'),
              FastRadioOption(title: Text('Option 3'), value: 'option-3'),
            ],
          ),
          FastSlider(
            name: 'slider',
            labelText: 'Slider',
            helperText: 'A Slider with prefix and suffix widgets',
            min: 0,
            max: 10,
            prefixBuilder: (field) {
              final enabled = field.widget.enabled;
              return IconButton(
                icon: const Icon(Icons.volume_off),
                onPressed:
                    enabled ? () => field.didChange(field.widget.min) : null,
              );
            },
            suffixBuilder: (field) {
              final enabled = field.widget.enabled;
              return IconButton(
                icon: const Icon(Icons.volume_up),
                onPressed:
                    enabled ? () => field.didChange(field.widget.max) : null,
              );
            },
            validator: (value) => value! > 8 ? 'Volume is too high' : null,
          ),
          FastRangeSlider(
            name: 'range_slider',
            labelText: 'Range Slider',
            min: 0,
            max: 10,
            divisions: 10,
            labelsBuilder: rangeSliderLabelsBuilder,
            prefixBuilder: rangeSliderPrefixBuilder,
            suffixBuilder: rangeSliderSuffixBuilder,
          ),
          const FastCustomField(
            name: 'custom_form_field',
            labelText: 'Custom Form Field',
            helperText: "Optionally add some extras",
            title: Text('Extras'),
            options: [
              FastCustomOption(label: 'Cheese', name: 'cheese'),
              FastCustomOption(label: 'Bacon', name: 'bacon'),
            ],
          ),
          FastCalendar(
            name: 'calendar',
            labelText: 'Calendar',
            firstDate: DateTime(1970),
            lastDate: DateTime(2040),
          ),
          const FastCheckbox(
            name: 'checkbox',
            labelText: 'Checkbox',
            titleText: 'I accept',
            contentPadding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
          ),
        ],
      ),
    ];
  }
}
