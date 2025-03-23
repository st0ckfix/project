import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:project/bloc/authenticate/authenticate_cubit.dart';
import 'package:project/config/di.dart';
import 'package:project/pages/authen_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializedDI();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthenticateCubit(sl(), sl(), sl(), sl()),
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayWidgetBuilder: (progress) {
        return Center(
          child: SpinKitFoldingCube(
            color: Colors.blue,
            size: 30.0,
          ),
        );
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthenPage(),
      ),
    );
  }
}
