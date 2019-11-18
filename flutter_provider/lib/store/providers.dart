import 'package:provider/provider.dart';
import 'package:flutter_provider/store/models/index.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

// 独立的model
List<SingleChildCloneableWidget> independentServices = [
  ChangeNotifierProvider<CounterModel>(
    builder: (_) => CounterModel(),
  ),
  ChangeNotifierProvider<ConfigModel>(
    builder: (_) => ConfigModel(),
  ),
  ChangeNotifierProvider<UserModel>(
    builder: (_) => UserModel(),
  ),
];

// 需要依赖的model
List<SingleChildCloneableWidget> dependentServices = [

];
