import 'utils/export_files/export.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProviderController>(
            create: (context) => PostProviderController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Networking and API Integration',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
        primarySwatch: Colors.pink,
      ),
      initialRoute: RoutesName.homeView,
      onGenerateRoute: Routes.generatedRoute,
    );
  }
}
