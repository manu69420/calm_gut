import 'package:calm_gut/app/utils/router/routes.dart';
import 'package:calm_gut/article/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:go_router/go_router.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    final content = Content();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
            pinned: true,
            stretch: true,
            snap: false,
            floating: false,
            expandedHeight: 200,
            title: Text(AppLocalizations.of(context)!.articles),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/neurography0_blurred.jpg'),
                      fit: BoxFit.cover,
                      opacity: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Content().getTitle(
                index: 0,
                locale: AppLocalizations.of(context)?.localeName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Content().getContent(
                index: 0,
                context: context,
                locale: AppLocalizations.of(context)?.localeName,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          const SliverToBoxAdapter(child: Divider()),
          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: 5, (
              context,
              index,
            ) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                child: ListTile(
                  tileColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHigh.withAlpha(150),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap:
                      () => context.push(
                        Routes.diaryRoutes.article(index + 1).fullPath,
                      ),
                  title: Content().getTitle(
                    index: index + 1,
                    locale: AppLocalizations.of(context)?.localeName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: FittedBox(
                        child: Image.asset(
                          "assets/neurography${index + 1}.jpg",
                          height: 200,
                          width: 200,
                          scale: 2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 200)),
        ],
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Articles"),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Image.asset(
            "assets/neurography0_blurred.jpg",
            fit: BoxFit.fitWidth,
            // alignment: const Alignment(0, -1),
          ),
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              ...List.generate(
                5,
                (int index) => ListTile(
                  title: content.getTitle(
                    index: index + 1,
                    locale: AppLocalizations.of(context)?.localeName,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Image.asset(
                    "assets/neurography${index + 1}.jpg",
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              ...List.generate(
                5,
                (int index) => ListTile(
                  title: content.getTitle(
                    index: index + 1,
                    locale: AppLocalizations.of(context)?.localeName,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Image.asset(
                    "assets/neurography${index + 1}.jpg",
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              ...List.generate(
                5,
                (int index) => ListTile(
                  title: content.getTitle(
                    index: index + 1,
                    locale: AppLocalizations.of(context)?.localeName,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Image.asset(
                    "assets/neurography${index + 1}.jpg",
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.articles),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/neurography0_blurred.jpg",
                repeat: ImageRepeat.repeatY,
                fit: BoxFit.fitWidth,
                height: MediaQuery.of(context).size.height * 0.5,
                alignment: const Alignment(0, -1),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    Card(
                      margin: EdgeInsets.all(0),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              content.getTitle(
                                index: 0,
                                locale:
                                    AppLocalizations.of(context)?.localeName,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              content.getContent(
                                index: 0,
                                context: context,
                                locale:
                                    AppLocalizations.of(context)?.localeName,
                              ),
                              const SizedBox(height: 10),
                              const Divider(),
                              ...List.generate(
                                5,
                                (int index) => ListTile(
                                  title: content.getTitle(
                                    index: index + 1,
                                    locale:
                                        AppLocalizations.of(
                                          context,
                                        )?.localeName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  trailing: Image.asset(
                                    "assets/neurography${index + 1}.jpg",
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                              ),
                              ...List.generate(
                                5,
                                (int index) => ListTile(
                                  title: content.getTitle(
                                    index: index + 1,
                                    locale:
                                        AppLocalizations.of(
                                          context,
                                        )?.localeName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  trailing: Image.asset(
                                    "assets/neurography${index + 1}.jpg",
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
