import 'package:app_agendamento/core/flavor/flavor.dart';

import 'app.dart';

void main(){
  bootstrap(
      FlavorConfig(
          baseUrl: 'https://parseapi.back4app.com/functions',
          flavor: AppFlavor.dev,
          appId: 'jAy4H6m42cTR9NsizOFvny60mBM9MAKTjsMVB6kT',
          restKey: 'pMllsmZ1qgGlpPx9yUU5Aaas5HLugAvl65B7XJRb'
      )
  );
}