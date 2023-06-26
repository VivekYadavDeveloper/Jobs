import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchBar());
              print("Hello Search");
            },
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.bell),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        backgroundColor: Colors.blueGrey,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(),
              child: Text("Inductus Jobs"),
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle_rounded,
              ),
              title: const Text('Profile '),
              onTap: () {},
            ),
            const ListTile(
              leading: Icon(
                Icons.cabin,
              ),
              title: Text(
                'Cart',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            )
          ],
        ),
      ),
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            
          ],
        );
      }),
    ));
  }
}

//**  Search Bar.....  //
class CustomSearchBar extends SearchDelegate {
  List<String> searchResults = [
    'Brazil',
    'China',
    'India',
    'America',
    'Russia',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const FaIcon(FontAwesomeIcons.xmark));
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
        onPressed: () => close(context, null),
        icon: const FaIcon(FontAwesomeIcons.arrowLeft));
    return null;
  }

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestion = searchResults.where((element) {
      final result = element.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
        itemCount: suggestion.length,
        itemBuilder: (context, index) {
          final suggestionCountry = suggestion[index];
          return ListTile(
            onTap: () {
              query = suggestionCountry;
              showResults(context);
            },
            title: Text(suggestionCountry),
          );
        });
  }
}
