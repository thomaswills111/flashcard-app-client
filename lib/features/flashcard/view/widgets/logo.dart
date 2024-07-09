import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 5.0, color: Theme.of(context).colorScheme.secondary),
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        children: [
          Expanded(
              flex: 6, // fills 3/4 proportions
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 18, left: 12, right: 12),
                child: Image.asset(
                  'assets/images/logo.png',
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )),
          Expanded(
            flex: 2,
              child: Text(
            'αβ',
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary),
          ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(

          ),)
        ],
      ),
    );
  }
}