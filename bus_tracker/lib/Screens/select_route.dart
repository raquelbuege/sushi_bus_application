import 'package:flutter/material.dart';

void main() => runApp(SelectRouteApp());

class SelectRouteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectRouteScreen(),
    );
  }
}

class SelectRouteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // BODY
              Expanded(
                flex: 2,
                child: Container(
                  color: const Color(0xFF667CE2),
                  child: Column(
                    children: [
                      // "Current Location", "Destination", 3 buttons
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            inputField(
                              icon: Icons.search,
                              label: "Current Location",
                            ),
                            SizedBox(height: 10),
                            inputField(
                              icon: Icons.search,
                              label: "Destination",
                              trailingIcon: Icons.swap_vert,
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                      // Background Map
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/map.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom Section
              Expanded(
                flex: 1,
                child: Container(
                  color: const Color(0xFF636371),
                  child: Column(
                    children: [
                      // 4 Icons
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 16.0, right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            transportationIcon(Icons.directions_bus, "Transit"),
                            transportationIcon(Icons.directions_walk),
                            transportationIcon(Icons.directions_car),
                            transportationIcon(Icons.directions_bike),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // Travel Info Box
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF25334A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Row(
                            children: [
                              // Left Section with Bus Line and Bubbles (61B, 61C, 61D)
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "61B",
                                      style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        busLineBubble("61C"),
                                        SizedBox(width: 8),
                                        busLineBubble("61D"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Right Section with Travel Times
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    // Total Travel Time
                                    Text(
                                      "20 minutes",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    // Travel Steps
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        routeStep(
                                            Icons.directions_walk, "Walk", "5"),
                                        dotsVisual(),
                                        routeStep(Icons.directions_bus,
                                            "Transit", "10"),
                                        dotsVisual(),
                                        routeStep(
                                            Icons.directions_walk, "Walk", "5"),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    // Arrival Time
                                    Text(
                                      "Arrive at 1:34pm",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Make the 3 Buttons at the Top Float
          Positioned(
            top: MediaQuery.of(context).size.height * 0.17,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                actionButton(Icons.arrow_back, "Search"),
                actionButton(null, "Leave Now"),
                vectorButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget for "Current Location" and "Destination"
  Widget inputField(
      {required IconData icon, required String label, IconData? trailingIcon}) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF5264D7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 30),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          if (trailingIcon != null) Icon(trailingIcon, color: Colors.white),
        ],
      ),
    );
  }

  // "Search" and "leave Now" buttons
  Widget actionButton(IconData? icon, String label) {
    return ElevatedButton(
      onPressed: () {
        null;
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF25334A),
        minimumSize: Size(120, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Colors.white,
              width: 1,
            )),
        padding: icon == null
            ? EdgeInsets.symmetric(horizontal: 30, vertical: 12)
            : EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: icon != null
          ? Row(
              children: [
                Icon(icon, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  label,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )
          : Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
    );
  }

  // Button with Vector
  Widget vectorButton() {
    return ElevatedButton(
      onPressed: () {
        null;
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF25334A),
        fixedSize: Size(45, 45),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: Colors.white,
              width: 1,
            )),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      child: Image.asset(
        'assets/vector1.png',
        fit: BoxFit.contain,
      ),
    );
  }

// 4 Icons for Transportation Options
  Widget transportationIcon(IconData icon, [String? label]) {
    return ElevatedButton(
      onPressed: () {
        null;
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5264D7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      child: label != null
          ? Row(
              children: [
                Icon(icon, color: Colors.white, size: 28),
                SizedBox(width: 5),
                Text(label,
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            )
          : Icon(icon, color: Colors.white, size: 28),
    );
  }

  // "61C" and "61D" Bubbles
  Widget busLineBubble(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF5264D7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }

  // Travel Route Steps
  Widget routeStep(IconData icon, String label, String number) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            SizedBox(width: 4),
            Text(
              number,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ],
    );
  }

  // Dots in Travel Route Visual
  Widget dotsVisual() {
    return Text(
      "...",
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    );
  }
}
