import 'package:flutter/material.dart';

class ChapterTile extends StatelessWidget {
  const ChapterTile({
    super.key,
    required this.chapter,
  });

  final String chapter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.primary),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('CHAPTER'),
            ),
            Expanded(
                flex:
                    2,
                child: Text(chapter, style: TextStyle(fontSize: 48, color: Theme.of(context).colorScheme.secondary))),
              
          ],
        ),
      ),
    );
  }
}