import 'package:ecomm_firebase/constant/theme.dart';
import 'package:ecomm_firebase/firebase_helper/firebase_auth_helper/firebae_auth_helper.dart';
import 'package:ecomm_firebase/firebase_options.dart';
// import 'package:ecomm_firebase/myhomepage.dart';
import 'package:ecomm_firebase/screens/auth_ui/welcome/welocme.dart';
import 'package:ecomm_firebase/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce Shop',
        theme: themeData,
        home: StreamBuilder(
            stream: FirebaseAuthHelper.instance.getauthChanges,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const Home();
              }
              return const Welocome();
            }));
  }
}


// class MyHomePage extends StatefulWidget {
///   const MyHomePage({super.key, required this.title});

//   // This widget is a subclass of StatefulWidget and must implement the

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
