import 'package:client/core/widgets/custom_appbar.dart';
import 'package:client/core/widgets/custom_drawer.dart';
import 'package:client/features/flashcard/view/widgets/chapter_tile.dart';
import 'package:client/features/flashcard/view/widgets/logo.dart';
import 'package:client/features/flashcard/viewmodel/flashcard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    ref.listen(flashcardViewModelProvider, (_, next) {
      next?.when(
          data: (data) {
            ref.watch(flashcardViewModelProvider.notifier).getChapters();
            setState(() {});
          },
          error: (error, st) {
            Fluttertoast.showToast(
                msg: error.toString(), toastLength: Toast.LENGTH_LONG);
          },
          // loading isn't handled here because it can't return the loading widget
          loading: () {});
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(
          leading:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: FaIcon(
                    FontAwesomeIcons.bars,
                    color: Theme.of(context).colorScheme.background,
                  ),
                );
              },
            ),
          ]),
          title: 'Athenaze Flashcards',
        ),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              automaticallyImplyLeading: false,
              expandedHeight: size.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(size.width * 0.1),
                  child: const Logo(),
                ),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: ref
                    .read(flashcardViewModelProvider.notifier)
                    .chapters
                    .length,
                (context, index) => ChapterTile(
                    chapter: ref
                        .read(flashcardViewModelProvider.notifier)
                        .chapters[index]),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
