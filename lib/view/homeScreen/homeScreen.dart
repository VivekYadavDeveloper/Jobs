import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';
import 'package:inductus_jobs/view/jobDetaileSacreen/job.details.screen.dart';

import '../Widgets/drawer.widget.dart';

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
      drawer: drawerWidget(context),
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JobDetailScreen()));
                        },
                        child: Card(
                          color: AppColors.cardColor,
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Flutter Developer",
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: TextStyle(
                                          color: AppColors.whiteColor)),
                                ),
                                Text(
                                  "Rs 3 - 4LPA",
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: TextStyle(
                                          color: AppColors.whiteColor)),
                                )
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      textStyle: TextStyle(
                                          color: AppColors.whiteColor)),
                                ),
                              ],
                            ),
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
        icon: FaIcon(FontAwesomeIcons.xmark));
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
        onPressed: () => close(context, null),
        icon: FaIcon(
          FontAwesomeIcons.arrowLeft,
          color: AppColors.activeColor,
        ));
    return null;
  }

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Center(
            child: Text(
              query,
              style: TextStyle(
                fontSize: 64.sp,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
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
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: ListView.builder(
          itemCount: suggestion.length,
          itemBuilder: (context, index) {
            final suggestionCountry = suggestion[index];
            return ListTile(
              onTap: () {
                query = suggestionCountry;
                showResults(context);
              },
              title: Text(
                suggestionCountry,
                style: TextStyle(color: AppColors.whiteColor),
              ),
            );
          }),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        textTheme:
            TextTheme(titleMedium: TextStyle(color: AppColors.whiteColor)),
        primaryIconTheme: IconThemeData(color: AppColors.activeColor),
        colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: AppColors.whiteColor),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            filled: true,
            fillColor: AppColors.cardColor));
  }
}
