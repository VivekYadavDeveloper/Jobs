import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(elevation: 0.0, backgroundColor: Colors.white),
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
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        );
      }),
    ));
  }
}
