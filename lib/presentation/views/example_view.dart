import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/example_viewmodel.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example View'),
      ),
      body: Consumer<ExampleViewModel>(
        builder: (context, viewModel, child) {
          // Construa a UI baseada no estado do ViewModel
          return const Center(
            child: Text('Hello, MVVM!'),
          );
        },
      ),
    );
  }
}
