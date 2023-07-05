import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:card_settings/card_settings.dart';

/// card_settings demo page
///
/// https://pub.dev/packages/card_settings
class CardSettingsDemo extends StatefulWidget {
  const CardSettingsDemo({super.key});

  @override
  State<CardSettingsDemo> createState() => _CardSettingsDemoState();
}

class _CardSettingsDemoState extends State<CardSettingsDemo> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        //平台风格的AppBar
        title: Text('card_settings'),
      ),
      body: CardSettings(
        children: [
          CardSettingsSection(
            header: CardSettingsHeader(
              label: '基本信息',
            ),
            divider: Divider(
              thickness: 1.0,
            ),
            children: [
              CardSettingsText(
                label: '用户名',
                initialValue: '张三',
                icon: Icon(Icons.person),
              ),
              CardSettingsText(
                label: '手机号',
                initialValue: '13888888888',
                icon: Icon(Icons.phone),
              ),
            ],
          ),
          CardSettingsSection(
            header: CardSettingsHeader(
              label: '其他信息',
              // child: Icon(Icons.info),
            ),
            children: [
              CardSettingsText(
                label: '邮箱',
                initialValue: '',
                icon: Icon(Icons.email),
              ),
              CardSettingsText(
                label: '地址',
                initialValue: '',
                icon: Icon(Icons.location_on),
              ),
            ],
          ),
          CardSettingsSection(
            children: [
              CardSettingsButton(onPressed: () {}, label: '保存'),
            ],
          )
        ],
      ),
    );
  }
}
