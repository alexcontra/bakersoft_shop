import 'package:flutter/material.dart';

import '../application/app.dart';
import '../dependency_injection/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initContainer();
  runApp(const MyApp());
}
