import 'package:badges/badges.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/theme/theme_provider.dart';
import 'package:badges/badges.dart' as badge;
import 'package:skeletonizer/skeletonizer.dart'; // Import skeletonizer

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: Provider.of<ThemeProvider>(context).themeData,
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var history = <WordPair>[];
  var favorites = <WordPair>[];

  void getNext() {
    history.add(current);
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      case 2:
        page = SettingsPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  const NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  const NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                  const NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text('Settings'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet.'),
      );
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Favorite Words:'),
          for (var pair in appState.favorites)
            ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(pair.asLowerCase),
            ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Update Theme:'),
          FilledButton.tonal(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            child: const Text('Click Here!'),
          )
        ],
      ),
    );
  }
}

// Modify GeneratorPage to include skeleton loading
class GeneratorPage extends StatefulWidget {
  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  bool _isLoading = true; // State to manage loading

  @override
  void initState() {
    super.initState();
    _loadContent();
  }

  Future<void> _loadContent() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    // Get colorScheme from the current Theme
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final darkColorScheme = ColorScheme.fromSeed(
      seedColor: Theme.of(context)
          .colorScheme
          .primary, // Or any seed color you prefer for dark mode
      brightness: Brightness.dark,
    );

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var pair in appState.history)
              TextButton.icon(
                onPressed: () {
                  print('button pressed!');
                },
                icon: appState.favorites.contains(pair)
                    ? const Icon(Icons.favorite, size: 12)
                    : const SizedBox(),
                label: Text(
                  pair.asLowerCase,
                  semanticsLabel: pair.asPascalCase,
                ),
              ),
            // --- White Container with Skeletonizer ---
            Container(
              color: Colors.white, // Explicit white background
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Skeletonizer(
                enabled: _isLoading, // Enable/disable based on loading state
                effect: ShimmerEffect(
                    baseColor: colorScheme.surfaceContainerHighest,
                  highlightColor: colorScheme.surfaceContainer),
                child: Wrap(
                  children: [
                    // eXtendTech Theme
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF0C5E82),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: Folder(pair: pair)),
                    // RED
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF862B31),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: Folder(pair: pair)),
                    // ORANGE
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFFA04100),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: Folder(pair: pair)),
                    // YELLOW
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFFB09E00),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: Folder(pair: pair)),
                    // LIME GREEN
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF429227),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: Folder(pair: pair)),
                    // GREEN
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF396B34),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: Folder(pair: pair)),
                    // BLUE
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF00587D),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: Folder(pair: pair)),
                    // PINK
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF862B5E),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: Folder(pair: pair)),
                    // PURPLE
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF4D0067),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: Folder(pair: pair)),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white, // Explicit white background
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Skeletonizer(
                enabled: _isLoading,
                effect: ShimmerEffect(
                      baseColor: colorScheme.surfaceContainerHighest,
                    highlightColor: colorScheme.surfaceContainer),
                child: Wrap(
                  children: [
                    // eXtendTech Theme
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF0C5E82),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: NewCard(pair: pair)),
                    // RED
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF862B31),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: NewCard(pair: pair)),
                    // ORANGE
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFFA04100),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: NewCard(pair: pair)),
                    // YELLOW
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFFB09E00),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: NewCard(pair: pair)),
                    // LIME GREEN
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF429227),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: NewCard(pair: pair)),
                    // GREEN
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF396B34),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: NewCard(pair: pair)),
                    // BLUE
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF00587D),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: NewCard(pair: pair)),
                    // PINK
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF862B5E),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: NewCard(pair: pair)),
                    // PURPLE
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF4D0067),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                        )),
                        child: NewCard(pair: pair)),
                  ],
                ),
              ),
            ),
            // --- Black Container with Skeletonizer ---
            Container(
              color: const Color(0xFF222222), // Explicit black background
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Skeletonizer(
                enabled: _isLoading,
                effect: ShimmerEffect(
                  baseColor: darkColorScheme.surfaceContainerHighest,
                  highlightColor: colorScheme.surfaceContainer,
                ),
                child: Wrap(
                  children: [
                    // eXtendTech Theme
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF0C5E82),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: Folder(pair: pair)),
                    // RED (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF862B31),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: Folder(pair: pair)),
                    // ORANGE (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFFA04100),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: Folder(pair: pair)),
                    // YELLOW (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFFB09E00),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: Folder(pair: pair)),
                    // LIME GREEN (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF429227),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: Folder(pair: pair)),
                    // GREEN (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF396B34),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: Folder(pair: pair)),
                    // BLUE (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF00587D),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: Folder(pair: pair)),
                    // PINK (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF862B5E),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: Folder(pair: pair)),
                    // PURPLE (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF4D0067),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: Folder(pair: pair)),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color(0xFF222222), // Explicit black background
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Skeletonizer(
                enabled: _isLoading,
                effect: ShimmerEffect(
                  baseColor: darkColorScheme.surfaceContainerHighest,
                  highlightColor:  darkColorScheme.surfaceContainer,
                ),
                child: Wrap(
                  children: [
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF0C5E82),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: NewCard(pair: pair)),
                    // RED (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF862B31),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: NewCard(pair: pair)),
                    // ORANGE (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFFA04100),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: NewCard(pair: pair)),
                    // YELLOW (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFFB09E00),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: NewCard(pair: pair)),
                    // LIME GREEN (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF429227),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: NewCard(pair: pair)),
                    // GREEN (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF396B34),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: NewCard(pair: pair)),
                    // BLUE (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF00587D),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: NewCard(pair: pair)),
                    // PINK (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF862B5E),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: NewCard(pair: pair)),
                    // PURPLE (dark)
                    Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFF4D0067),
                          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
                          brightness: Brightness.dark,
                        )),
                        child: NewCard(pair: pair)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: const Text('Like'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NewCard extends StatelessWidget {
  const NewCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    

    return Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 3.0,
        shadowColor: theme.colorScheme.shadow,
        color: theme.colorScheme.surfaceContainerLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          hoverColor: theme.hoverColor,
          highlightColor: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(10.0),
          onTap: () async {
            print('hello');
          },
          child: SizedBox(
            width: 180.0,
            height: 180.0,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 5.0,
                right: 5.0,
                bottom: 5.0,
                top: 5.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.home, color: theme.colorScheme.primary),
                        Icon(Icons.more_vert,
                            color: theme.colorScheme.onSurface),
                      ],
                    ),
                  ),
                  Text('Title',
                      style: TextStyle(color: theme.colorScheme.onSurface),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      selectionColor: theme.colorScheme.onPrimaryContainer),
                  const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.mobile_friendly,
                          color: theme.colorScheme.onSurface.withOpacity(.5)),
                      Text(
                        'Mobile Only',
                        style: TextStyle(
                            color: theme.colorScheme.onSurface.withOpacity(.5)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Folder extends StatelessWidget {
  const Folder({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      key: const ValueKey('folder'),
      width: 200.0,
      child: Stack(
        children: <Widget>[
          Center(
            child: Icon(
              Icons.folder,
              color: theme.colorScheme.surfaceContainerHighest,
              size: 200.0,
            ),
          ),
          Positioned(
            top: 35,
            left: 35,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.edit,
                color: theme.colorScheme.primary,
                size: 30.0,
              ),
            ),
          ),
          Positioned.fill(
            // Use Positioned.fill to expand the Column to fill available space
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Title',
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomToolTip extends StatelessWidget {
  /// The text need to show as the tooltip.
  final String message;

  /// The widget for which tooltip will be shown.
  final Widget child;

  const CustomToolTip({
    super.key,
    required this.message,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      margin: const EdgeInsets.all(
        10.0,
      ),
      showDuration: const Duration(seconds: 3),
      padding: const EdgeInsets.all(
        5.0,
      ),
      child: child,
    );
  }
}
