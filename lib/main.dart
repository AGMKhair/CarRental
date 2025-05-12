import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:tilmaame/architecture/app_state.dart';
import 'package:tilmaame/architecture/reducers/app_reducer.dart';
import 'package:tilmaame/architecture/routes/routes_action.dart';
import 'package:tilmaame/resourse/util/string_dictionary.dart';
import 'package:tilmaame/screen/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key, store});

  final store = Store<AppState>(appReducer, initialState: AppState.initial(), middleware: [thunkMiddleware]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: StringDictionary.APP_NAME,
        theme: ThemeData(
          cardColor: Colors.orangeAccent,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
        // routes: RoutesAction.getRoutesPath(context),
        home:  SplashScreen(),
        // initialRoute: Routes.mainScreen,
        onGenerateRoute: RoutesAction.generateRoute,
      ),
    );
  }
}

