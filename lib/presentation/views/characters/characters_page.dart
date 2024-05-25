import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/my_theme.dart';
import '../../viewmodels/character_view_model.dart';
import '../../widgets/card_character.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<CharacterViewModel>(context, listen: false);
      viewModel.fetchCharacters();
    });

    _scrollController.addListener(() {
      final viewModel = Provider.of<CharacterViewModel>(context, listen: false);

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        viewModel.loadMoreCharacters();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CharacterViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: ThemeColors.iconThemeData,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Characters',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: AppColors.gradient,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Expanded(
              child: viewModel.isLoading && viewModel.characters.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollInfo) {
                        if (!viewModel.isLoading &&
                            scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent) {
                          viewModel.loadMoreCharacters();
                        }
                        return true;
                      },
                      child: GridView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(8.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 182,
                        ),
                        itemCount: viewModel.characters.length +
                            (viewModel.isLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == viewModel.characters.length) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          final character = viewModel.characters[index];
                          return CharacterCard(character: character);
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
