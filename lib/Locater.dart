
import 'package:finalproject/Core/Servies/Api.dart';
import 'package:get_it/get_it.dart';

import 'UI/Views/AddProducts.dart';
import 'View_Models/OpreationModels.dart';

GetIt getIt = GetIt.instance;
SetUpLoacter(){
  getIt.registerLazySingleton(() => Api('products'));
  getIt.registerLazySingleton(() => Oprearations());


}