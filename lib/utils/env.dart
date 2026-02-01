enum EnvType { dev, prod }

class Env {
  static const EnvType envType = EnvType.dev;

  static String get apiBaseUrl {
    switch (envType) {
      case EnvType.dev:
        return "https://jsonplaceholder.typicode.com";
      case EnvType.prod:
        return "";
    }
  }
}
