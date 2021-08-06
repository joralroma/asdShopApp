import 'package:yaml/yaml.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AsdLocalization {

  final String localName;

  late YamlMap translations;

  static const LocalizationsDelegate<AsdLocalization> delegate = _AsdLocalizationDelegate();

  AsdLocalization(this.localName);

  Future load() async {
    String yamlString = await rootBundle.loadString('lib/app/i18n/langs/${localName}.yaml');
    translations = loadYaml(yamlString);
  }

  String translate(String key) {
    try {
      var keys = key.split('.');
      dynamic translated = translations;
      keys.forEach((k) => translated = translated[k]);
      return translated ?? '-';      
    } catch (e) {
      return '-';
    }
  }


  static AsdLocalization of(BuildContext context) {
    return Localizations.of(context, AsdLocalization);
  }

}

class _AsdLocalizationDelegate extends LocalizationsDelegate<AsdLocalization> {

  const _AsdLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['es', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AsdLocalization> load(Locale locale) async {
    final String languageCode = isSupported(locale) ? locale.languageCode : 'en';
    var t = AsdLocalization(languageCode);
    await t.load();
    return t;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AsdLocalization> old) {
    return false;
  }

}