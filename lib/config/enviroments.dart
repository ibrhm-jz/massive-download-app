import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroments {
  static final String apiUrl = dotenv.get('API_URL');
  static final String appEnv = dotenv.get('APP_ENV');
  static final bool isDebug = dotenv.get('APP_ENV') == 'debug' ? true : false;
}