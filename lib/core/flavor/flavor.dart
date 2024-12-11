class FlavorConfig {

  FlavorConfig({required this.baseUrl, required this.flavor});
  final AppFlavor flavor;
  final String baseUrl;

}

enum AppFlavor{dev, prod}