import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/viewmodels/example_viewmodel.dart';
import 'presentation/views/example_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExampleViewModel()),
      ],
      child: const MaterialApp(
        title: 'Flutter MVVM Example',
        home:  ExampleView(),
      ),
    );
  }
}
