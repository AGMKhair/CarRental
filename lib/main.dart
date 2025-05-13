import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:carrental/architecture/app_state.dart';
import 'package:carrental/architecture/reducers/app_reducer.dart';
import 'package:carrental/architecture/routes/routes_action.dart';
import 'package:carrental/resourse/util/string_dictionary.dart';
import 'package:carrental/screen/splash/splash_screen.dart';

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

