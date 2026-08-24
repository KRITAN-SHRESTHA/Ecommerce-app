import 'package:ecommerceapp/config/routes/routes.dart';
import 'package:ecommerceapp/core/services/injector.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(MainApp(appRouter: getIt<AppRouter>()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
