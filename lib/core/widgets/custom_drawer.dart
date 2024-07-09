import 'package:client/features/flashcard/view/pages/browse_page.dart';
import 'package:client/features/flashcard/view/pages/create_card_page.dart';
import 'package:client/features/flashcard/viewmodel/flashcard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Drawer(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: Image.asset(
              'assets/images/logo.png',
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: Text('Home'),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.book,
            ),
            title: Text('Browse'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => BrowsePage()),
                ),
              );
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.plus),
            title: Text('Add Word'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateCardPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.gear),
            title: const Text('Settings'),
            onTap: () {
              // Provider.of<FlashcardsNotifier>(context, listen: false).setTopic()
            },
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.arrowsRotate),
            title: const Text('Sync'),
            onTap: () {
              ref.read(flashcardViewModelProvider.notifier).getCards();
              // Provider.of<FlashcardsNotifier>(context, listen: false).setTopic()
            },
          )
        ],
      ),
    );
  }
}
