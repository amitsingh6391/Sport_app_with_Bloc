import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sports/bloc/sportservices_bloc.dart';

import 'ui/splash/splash_screen.dart';
import 'ui/theme/apptheme.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Apptheme.cardColorlight,
    systemNavigationBarColor: Apptheme.backgroundColor,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    SportsApp(),
  );
}

class SportsApp extends StatelessWidget {
  const SportsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          SportservicesBloc()..add(const SportservicesEvent.getSportsData()),
      child: Provider(
        create: (BuildContext context) =>
            SportservicesBloc()..add(const SportservicesEvent.getSportsData()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Apptheme.theme,
          title: "SportsApp",
          home: SplashScreen(),
        ),
      ),
    );
  }
}
