import 'dart:async';
import 'package:ecommer_ui/widgets/addPage.dart';
import 'package:ecommer_ui/widgets/detailsPage.dart';
import 'package:ecommer_ui/models/product_list_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:ecommer_ui/widgets/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => const App()),
  ));
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const HomePage();
    },
    routes: <RouteBase>[
      GoRoute(
        path: 'sign-in',
        builder: (BuildContext context, GoRouterState state) {
          return SignInScreen(
            actions: [
              ForgotPasswordAction(((context, email) {
                Navigator.of(context)
                    .pushNamed('forgot-password', arguments: {'email': email});
              })),
              AuthStateChangeAction(((context, state) {
                if (state is SignedIn || state is UserCreated) {
                  var user = (state is SignedIn)
                      ? state.user
                      : (state as UserCreated).credential.user;
                  if (user == null) {
                    return;
                  }
                  if (user is UserCreated) {
                    user.updateDisplayName(user.email!.split('@')[0]);
                  }
                  if (!user.emailVerified) {
                    user.sendEmailVerification();
                    const snackBar = SnackBar(
                        content: Text(
                            'Please check your email to verify your email address'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    user.updateDisplayName(user.email!.split('@')[0]);
                    Navigator.pop(context);
                  }
                }
              })),
            ],
          );
        },
      ),
      GoRoute(
        path: 'forgot-password',
        builder: (BuildContext context, GoRouterState state) {
          final arguments = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>?;

          return ForgotPasswordScreen(
            email: arguments?['email'] as String,
            headerMaxExtent: 200,
          );
        },
      ),
      GoRoute(
          path: 'add',
          builder: (BuildContext context, GoRouterState state) {
            return AddPage();
          })
    ],
  )
]);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  StreamSubscription<QuerySnapshot>? _productListSubscription;
  List<ProductList> _productList = [];
  List<ProductList> get productList => _productList;

  Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
        print('name*******: ${user.displayName}');
        _productListSubscription = FirebaseFirestore.instance
            .collection('product_list')
            .snapshots()
            .listen((snapshot) {
          _productList = [];
          for (final document in snapshot.docs) {
            _productList.add(ProductList(
                imagePath: document.data()['image_path'] as String,
                name: document.data()['name'] as String,
                price: document.data()['price'] as int,
                weight: document.data()['WEIGHT'] as List<dynamic>,
                calories: document.data()['CALORIES'] as List<dynamic>,
                vitamins: document.data()['VITAMINS'] as List<dynamic>,
                avail: document.data()['AVAIL'] as List<dynamic>));
          }
          notifyListeners();
        });
      } else {
        _loggedIn = false;
        _productList = [];
        _productListSubscription?.cancel();
      }
      notifyListeners();
    });
  }
}
