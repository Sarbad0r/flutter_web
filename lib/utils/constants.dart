import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

var myAppBar = AppBar(backgroundColor: Colors.grey[900]);

var myDrawer = Drawer(
  backgroundColor: Colors.grey[300],
  child: Column(children: const [
    DrawerHeader(child: Icon(Icons.favorite)),
    ListTile(leading: Icon(Icons.home), title: Text("D A S H B O A R D")),
    ListTile(leading: Icon(Icons.chat), title: Text("M E S S A G E")),
    ListTile(leading: Icon(Icons.settings), title: Text("S E T T I N G S")),
    ListTile(leading: Icon(Icons.logout), title: Text("L O G O U T"))
  ]),
);

var scaffoldColor = Colors.grey[300];

var mobileBody = ListView(children: [
  GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(color: Colors.orange),
        );
      }),
  const SizedBox(height: 20),
  ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      shrinkWrap: true,
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
            height: 80,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)));
      })
]);

var tabletBody = ListView(children: [
  GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(color: Colors.orange),
        );
      }),
  const SizedBox(height: 20),
  ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      shrinkWrap: true,
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
            height: 80,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)));
      })
]);

Widget desktopBody(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      myDrawer,
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: ListView(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(color: Colors.orange),
                    );
                  }),
              const SizedBox(height: 20),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3,
                      crossAxisCount: 2),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      width: 100,
                      height: 0,
                      color: Colors.green,
                      child: Center(child: Text("1")),
                    );
                  }),
            ],
          ),
        ),
      ),
      // Expanded(child: Container())
    ],
  );
}
