import 'package:flutter/material.dart';
import 'Places/aalibedni.dart';

class PlacesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places'),
      ),
      body: ListView(
        children: [
          PlaceCard(
            title: 'Aali Bedni Bugyal',
            image: 'assets/Images/bus.png',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AAliBedniBugyalPage()),
              );
            },
          ),
         /* PlaceCard(
            title: 'Place 2',
            image: 'assets/place2.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Place2Page()),
              );
            },
          ),
          PlaceCard(
            title: 'Place 3',
            image: 'assets/place3.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Place3Page()),
              );
            },
          ),
          // Add more places here

          */
        ],
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  PlaceCard({required this.title, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(image, width: 100),
              SizedBox(width: 16),
              Text(title, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}