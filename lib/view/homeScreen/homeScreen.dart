import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
    elevation: 0.0,
    backgroundColor: AppColors.primaryColor,
    iconTheme: IconThemeData(color: AppColors.whiteColor),
    actions: <Widget>[
      IconButton(
        onPressed: () {
          showSearch(context: context, delegate: CustomSearchBar());
          print("Hello Search");
        },
        icon: FaIcon(
          FontAwesomeIcons.magnifyingGlass,
          color: AppColors.whiteColor,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: FaIcon(
          FontAwesomeIcons.bell,
          color: AppColors.whiteColor,
        ),
      )
    ],
      ),
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
    backgroundColor: AppColors.primaryColor,
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColors.cardColor,
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Flutter Developer",
                            style: GoogleFonts.aBeeZee(
                                textStyle:
                                    TextStyle(color: AppColors.whiteColor)),
                          ),
                          Text(
                            "Rs 3 - 4LPA",
                            style: GoogleFonts.aBeeZee(
                                textStyle:
                                    TextStyle(color: AppColors.whiteColor)),
                          )
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "1-2 Years",
                                style: GoogleFonts.aBeeZee(
                                    textStyle: TextStyle(
                                        color: AppColors.whiteColor)),
                              ),
                              Text(
                                "Graduation/Diploma",
                                style: GoogleFonts.aBeeZee(
                                    textStyle: TextStyle(
                                        color: AppColors.whiteColor)),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: FaIcon(
                                    FontAwesomeIcons.star,
                                    color: AppColors.whiteColor,
                                  ))
                            ],
                          ),
                          Text(
                            "Inductus Limited",
                            style: GoogleFonts.aBeeZee(
                                textStyle:
                                    TextStyle(color: AppColors.whiteColor)),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
      }),
    );
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
