import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/theme/theme_provider.dart';
import 'package:namer_app/theme/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: MyApp()));
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
        break;
      case 1:
        page = FavoritesPage();
        break;
      case 2:
        page = SettingsPage();
        break;
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
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                  NavigationRailDestination(
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
      return Center(
        child: Text('No favorites yet.'),
      );
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Favorite Words:'),
          for (var pair in appState.favorites)
            ListTile(
              leading: Icon(Icons.favorite),
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
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Update Theme:'),
          FilledButton.tonal(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            child: Text('Click Here!'),
          )
        ],
      ),
    );
  }
}

class GeneratorPage extends StatelessWidget {
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var pair in appState.history)
            TextButton.icon(
              onPressed: () {
                print('button pressed!');
              },
              icon: appState.favorites.contains(pair)
                  ? Icon(Icons.favorite, size: 12)
                  : SizedBox(),
              label: Text(
                pair.asLowerCase,
                semanticsLabel: pair.asPascalCase,
              ),
            ),
          Wrap(
            children: [
              Theme(
                  data: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Color(0xFFFF0000))),
                  child: NewCard(pair: pair)),
              Theme(
                  data: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Color(0xFFFF8C00))),
                  child: NewCard(pair: pair)),
              Theme(
                  data: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Color(0xFFFFFF00))),
                  child: NewCard(pair: pair)),
              Theme(
                  data: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Color(0xFFB7FF01))),
                  child: NewCard(pair: pair)),
              Theme(
                  data: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Color(0xFF1D6327))),
                  child: NewCard(pair: pair)),
              Theme(
                  data: ThemeData(
                      colorScheme: ColorScheme.fromSeed(
                          seedColor: Color.fromARGB(255, 0, 42, 254))),
                  child: NewCard(pair: pair)),
              Theme(
                  data: ThemeData(
                      colorScheme: ColorScheme.fromSeed(
                          seedColor: Color.fromARGB(255, 114, 0, 254))),
                  child: NewCard(pair: pair)),
              Theme(
                  data: ThemeData(
                      colorScheme: ColorScheme.fromSeed(
                          seedColor: Color.fromARGB(255, 254, 0, 190),)),
                  child: NewCard(pair: pair)),
            ],
          ),
           Wrap(
            children: [
              Theme(
                  data: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Color(0xFFFF0000), brightness: Brightness.dark)),
                  child: NewCard(pair: pair)),
              Theme(
                  data: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Color(0xFFFF8C00), brightness: Brightness.dark)),
                  child: NewCard(pair: pair)),
              Theme(
                  data: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Color(0xFFFFFF00), brightness: Brightness.dark)),
                  child: NewCard(pair: pair)),
              Theme(
                  data: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Color(0xFFB7FF01), brightness: Brightness.dark)),
                  child: NewCard(pair: pair)),
              Theme(
                  data: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Color(0xFF1D6327), brightness: Brightness.dark)),
                  child: NewCard(pair: pair)),
              Theme(
                  data: ThemeData(
                      colorScheme: ColorScheme.fromSeed(
                          seedColor: Color.fromARGB(255, 0, 42, 254), brightness: Brightness.dark)),
                  child: NewCard(pair: pair)),
              Theme(
                  data: ThemeData(
                      colorScheme: ColorScheme.fromSeed(
                          seedColor: Color.fromARGB(255, 114, 0, 254), brightness: Brightness.dark)),
                  child: NewCard(pair: pair)),
              Theme(
                  data: ThemeData(
                      colorScheme: ColorScheme.fromSeed(
                          seedColor: Color.fromARGB(255, 254, 0, 190), brightness: Brightness.dark,)),
                  child: NewCard(pair: pair)),
            ],
          ),
          
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
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
        color: theme.colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
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
                            color: theme.colorScheme.secondary),
                      ],
                    ),
                  ),
                  Text('Title',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      selectionColor: theme.colorScheme.onPrimaryContainer),
                  SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.mobile_friendly,
                          color: theme.colorScheme.secondary),
                      Text(
                        'Mobile Only',
                        selectionColor: theme.colorScheme.secondary,
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
