import 'package:app_agendamento/core/flavor/flavor.dart';

import 'app.dart';

void main(){
  bootstrap(
      FlavorConfig(
          baseUrl: 'www.apple.com.br',
          flavor: AppFlavor.dev
      )
  );
}