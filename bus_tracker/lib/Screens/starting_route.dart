import 'package:flutter/material.dart';

// Home Screen
class StartingRouteApp extends StatelessWidget {
  const StartingRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('After the Search Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to StartingRouteScreen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StartingRouteScreen(),
              ),
            );
          },
          child: const Text('Go to Starting Route Screen'),
        ),
      ),
    );
  }
}

class StartingRouteScreen extends StatelessWidget {
  const StartingRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map background
          Container(
            color: Colors.black,
            child: const Center(
              child: Text(
                "Map Placeholder",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          // Red pin icon on map
          const Positioned(
            top: 100,
            right: 30,
            child: Icon(
              Icons.location_pin,
              size: 50,
              color: Colors.red,
            ),
          ),
          // Route information panel
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Route buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Other Route"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("GO"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Route details
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "61B",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "20 minutes",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Arrive at 1:34",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          // Walk, Transit, Walk details
                          Row(
                            children: const [
                              Icon(Icons.directions_walk, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                "5 minutes",
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(),
                              Icon(Icons.directions_bus, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                "10 minutes",
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(),
                              Icon(Icons.directions_walk, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                "5 minutes",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Departure and stops details
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Walk",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "61B",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Departed on 1:25",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            "5 stops",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
