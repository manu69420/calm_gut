import 'package:calm_gut/article/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SingleArticleView extends StatelessWidget {
  const SingleArticleView({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Content().getTitle(
              index: index,
              locale: AppLocalizations.of(context)?.localeName,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Image.asset("assets/neurography$index.jpg"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Content().getContent(
              index: index,
              locale: AppLocalizations.of(context)?.localeName,
              context: context,
            ),
          ),
        ],
      ),
    );
  }
}
