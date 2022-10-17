import 'en_US/en_US_translation.dart';
import 'pt_BR/pt_BR_translation.dart';

abstract class AppTranslations{
  static Map<String, Map<String, String>>
  translations = {
    "pt_BR" : ptBR,
    "en_US" : enUS,
  };
}