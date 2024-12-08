import 'dart:io';
import 'package:bus_tracker/Widget/MapSample.dart';
import 'package:map/map.dart';
import 'package:flutter/material.dart';
import 'package:map/map.dart';

/// Flutter code sample for [NavigationBar].
//Taken from https://api.flutter.dev/flutter/material/NavigationBar-class.html

void main() {
  runApp(BusScheduleApp());
}

class BusScheduleApp extends StatelessWidget {
  const BusScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Schedule',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),

      //  replace this line with your imported screen
      home: const NavigationBarApp(),
    );
  }
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Used this for the theme https://docs.flutter.dev/cookbook/design/themes
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 62, 80, 198),
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 72,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      //used Chatgpt to figure out how to change background color
      backgroundColor: const Color.fromARGB(255, 40, 47, 99),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color.fromRGBO(84, 99, 208, 1),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 136, 150, 255),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.search, color: Colors.white)),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.photo_camera, color: Colors.white)),
            label: 'AR',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.attach_money, color: Colors.white)),
            label: 'Ticket',
          ),
          NavigationDestination(
              icon: Badge(child: Icon(Icons.person, color: Colors.white)),
              label: 'profile'),
        ],
      ),

      body: <Widget>[
        Column(children: [
          Card(
              child: SizedBox(
                height: 400,
                width:400,
                child:(
                  MapSample()
                ),


              )),

          /// Home page
          Positioned(
            top: -50,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(19, 0, 0.0, 4.0),
              child: Card(
                color: const Color.fromRGBO(84, 99, 208, 1),
                margin: EdgeInsets.zero,
                child: Container(
                  height: 50,
                  width: 320,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(84, 99, 208, 1),
                    //https://www.dhiwise.com/post/a-quick-look-on-the-art-of-flutter-rounded-container
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Icon(Icons.search)),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 150.0, 0),
                          child: Text('Where To?'),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 14, 0),
                            child: Icon(Icons.house)),
                      ]),
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              //https://www.dhiwise.com/post/a-quick-look-on-the-art-of-flutter-rounded-container
             
            ),
            height: 348,
            width: 500,
            child: Column(children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(84, 99, 208, 1),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    margin: const EdgeInsets.fromLTRB(45, 20, 10, 30),
                    height: 38,
                    width: 80,
                    child: const Row(children: [
                      Icon(Icons.directions_bus),
                      Text('Transit')
                    ]),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(84, 99, 208, 1),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    margin: const EdgeInsets.fromLTRB(15, 20, 10, 30),
                    height: 38,
                    width: 50,
                    child: const Icon(Icons.directions_walk),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(84, 99, 208, 1),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      margin: const EdgeInsets.fromLTRB(25, 20, 10, 30),
                      height: 38,
                      width: 50,
                      child: const Icon(Icons.directions_car)),
                  Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(84, 99, 208, 1),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      margin: const EdgeInsets.fromLTRB(20, 20, 10, 30),
                      height: 38,
                      width: 50,
                      child: const Icon(Icons.directions_bike)),
                ],
              ),
                        Container(
                margin: const EdgeInsets.all(0),
                width: 320,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 49, 57, 120),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(children: [
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(42, 10, 0.0, 0),
                        child: Text(
                          '61B',
                          //  https://www.educative.io/answers/how-to-make-text-bold-in-flutter
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 0.0, 0),
                        child: Text(
                          'Work',
                          //  https://www.educative.io/answers/how-to-make-text-bold-in-flutter
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(80, 0, 0.0, 0),
                      child: const Icon(Icons.directions_bus)),
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 33.0, 0),
                        child: Text(
                          '15',
                          //  https://www.educative.io/answers/how-to-make-text-bold-in-flutter
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0.0, 0),
                        child: Text(
                          'Minutes',
                          //  https://www.educative.io/answers/how-to-make-text-bold-in-flutter
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                width: 320,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 49, 57, 120),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(children: [
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(42, 10, 0.0, 0),
                        child: Text(
                          '61B',
                          //  https://www.educative.io/answers/how-to-make-text-bold-in-flutter
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 0.0, 0),
                        child: Text(
                          'Work',
                          //  https://www.educative.io/answers/how-to-make-text-bold-in-flutter
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(80, 0, 0.0, 0),
                      child: const Icon(Icons.directions_bus)),
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 33.0, 0),
                        child: Text(
                          '15',
                          //  https://www.educative.io/answers/how-to-make-text-bold-in-flutter
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0.0, 0),
                        child: Text(
                          'Minutes',
                          //  https://www.educative.io/answers/how-to-make-text-bold-in-flutter
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              )
            ]),
          ),
        ]),

        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
          },
        ),
      ][currentPageIndex],
    );
  }
}
