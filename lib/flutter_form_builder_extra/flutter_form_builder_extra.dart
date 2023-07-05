import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:get/get.dart';

/// flutter_form_builder_extra demo page
///
/// https://pub.dev/packages/form_builder_extra_fields
class FlutterFormBuilderExtraDemo extends StatefulWidget {
  const FlutterFormBuilderExtraDemo({super.key});

  @override
  State<FlutterFormBuilderExtraDemo> createState() =>
      _FlutterFormBuilderExtraDemoState();
}

class _FlutterFormBuilderExtraDemoState
    extends State<FlutterFormBuilderExtraDemo> {
  final local_list = [
    'Paris',
    'Lyon',
    'Marseille',
    'Toulouse',
    'Lille',
    'Bordeaux',
    'Nantes',
    'Strasbourg',
    'Nice',
    'Montpellier',
    'Rennes',
    'Le Havre',
    'Reims',
    'Saint-Étienne',
    'Toulon',
    'Grenoble',
    'Dijon',
    'Nîmes',
    'Angers',
    'Villeurbanne',
    'Le Mans',
    'Aix-en-Provence',
    'Clermont-Ferrand',
    'Brest'
  ];
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: const Text('flutter_form_builder_extra'),
        ),
        body: FormBuilder(
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              FormBuilderPhoneField(
                name: 'phone',
                decoration: const InputDecoration(
                  labelText: '手机号(Phone Field)',
                ),
              ),
              FormBuilderRatingBar(
                name: 'rating',
                ratingWidget: RatingWidget(
                  empty: Icon(Icons.star, color: Colors.grey), // 设置未选中的星星颜色为灰色
                  half: Icon(Icons.star_half,
                      color: Colors.yellow), // 设置半选中的星星颜色为黄色
                  full: Icon(Icons.star, color: Colors.yellow), // 设置选中的星星颜色为黄色
                ),
                glowColor: Colors.yellow, // 设置星星的发光颜色为黄色
                unratedColor: Colors.grey, // 设置星星的未选中颜色为灰色
                decoration: const InputDecoration(
                  labelText: '评分(Rating Bar)',
                  prefixIcon: Icon(Icons.star),
                ),
              ),
              FormBuilderSearchableDropdown(
                name: 'city',
                dropdownSearchDecoration: InputDecoration(
                  hintText: '搜索', // 设置搜索框内的提示文本
                ),
                items: local_list,
              ),
              FormBuilderTouchSpin(
                name: 'touch_spin',
              ),
              FormBuilderTypeAhead(
                name: 'type_ahead',
                decoration: const InputDecoration(
                  labelText: '自动完成(Type Ahead)',
                ),
                itemBuilder: (context, country) {
                  return ListTile(
                    title: Text('${country}'),
                  );
                },
                suggestionsCallback: (query) {
                  if (query.isNotEmpty) {
                    var lowercaseQuery = query.toLowerCase();
                    return local_list.where((country) {
                      return country.toLowerCase().contains(lowercaseQuery);
                    }).toList(growable: false)
                      ..sort((a, b) => a
                          .toLowerCase()
                          .indexOf(lowercaseQuery)
                          .compareTo(b.toLowerCase().indexOf(lowercaseQuery)));
                  } else {
                    return local_list;
                  }
                },
              ),
              ExpansionTile(
                title: PlatformText('更多(More)'),
                children: [
                  FormBuilderSignaturePad(
                    name: 'signature',
                    decoration: InputDecoration(labelText: '签名(Signature Pad)'),
                  ),
                ],
              ),
            ],
          ),
        ).paddingAll(10));
  }
}
