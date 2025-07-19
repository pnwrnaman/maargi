import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AAliBedniBugyalPage extends StatefulWidget {
  @override
  _AAliBedniBedniBugyalPageState createState() =>
      _AAliBedniBedniBugyalPageState();
}

class _AAliBedniBedniBugyalPageState extends State<AAliBedniBugyalPage> {
  bool _isBookmarked = false;
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aali Bedni Bugyal'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'assets/Images/aes.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AAli Bedni Bugyal is a high-altitude meadow situated in the Chamoli district of Uttarakhand, India.',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _isBookmarked = !_isBookmarked;
                          });
                        },
                        icon: Icon(_isBookmarked
                            ? Icons.bookmark
                            : Icons.bookmark_border),
                        label: Text(_isBookmarked ? 'Bookmarked' : 'Bookmark'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add functionality to share the place
                        },
                        icon: Icon(Icons.share),
                        label: Text('Share'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Location:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: kIsWeb
                          ? Center(
                              child: Text(
                                'Google Maps is not supported on web platform yet.',
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          : GoogleMap(
                              onMapCreated: (GoogleMapController controller) {
                                _mapController = controller;
                              },
                              initialCameraPosition: CameraPosition(
                                target: LatLng(30.7333, 79.0667),
                                zoom: 12,
                              ),
                              myLocationEnabled: true,
                              myLocationButtonEnabled: true,
                              zoomControlsEnabled: true,
                              mapToolbarEnabled: true,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
