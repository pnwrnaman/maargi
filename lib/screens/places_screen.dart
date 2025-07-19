import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/place.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};
  int _currentIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 0.85);
  final PageController _unexploredController =
      PageController(viewportFraction: 0.85);

  // Uttarakhand Treks data
  final List<Place> _places = [
    Place(
      id: '1',
      name: 'Valley of Flowers Trek',
      description:
          'A mesmerizing trek through the UNESCO World Heritage Site, featuring vibrant alpine flowers and stunning Himalayan views. The trek is moderate in difficulty and offers breathtaking landscapes.',
      imageUrl: 'assets/Images/vof1.png',
      latitude: 30.7281,
      longitude: 79.6049,
      tags: ['Moderate', '6 Days', 'UNESCO'],
      rating: 4.9,
    ),
    Place(
      id: '2',
      name: 'Kedarkantha Trek',
      description:
          'A perfect winter trek offering panoramic views of the Himalayas. Known for its snow-covered trails and summit views, this trek is ideal for beginners and experienced trekkers alike.',
      imageUrl: 'assets/Images/kedarkantha.jpg',
      latitude: 31.0083,
      longitude: 78.3047,
      tags: ['Easy-Moderate', '6 Days', 'Winter'],
      rating: 4.8,
    ),
    Place(
      id: '3',
      name: 'Har Ki Dun Trek',
      description:
          'Known as the "Valley of Gods", this trek takes you through ancient villages, dense forests, and offers spectacular views of the Swargarohini peaks.',
      imageUrl: 'assets/Images/har_ki_dun.jpg',
      latitude: 31.0833,
      longitude: 78.4333,
      tags: ['Moderate', '7 Days', 'Valley'],
      rating: 4.7,
    ),
    Place(
      id: '4',
      name: 'Roopkund Trek',
      description:
          'Famous for its mysterious skeleton lake, this challenging trek offers stunning views of Trishul and Nanda Ghunti peaks. The trail passes through beautiful meadows and dense forests.',
      imageUrl: 'assets/Images/roopkund.jpg',
      latitude: 30.2583,
      longitude: 79.7333,
      tags: ['Challenging', '8 Days', 'Mystery'],
      rating: 4.8,
    ),
    Place(
      id: '5',
      name: 'Nag Tibba Trek',
      description:
          'The highest peak in the lesser Himalayan region, offering panoramic views of Bandarpoonch, Srikanth, and Gangotri peaks. Perfect for beginners and weekend trekkers.',
      imageUrl: 'assets/Images/nag_tibba.jpg',
      latitude: 30.4833,
      longitude: 78.1167,
      tags: ['Easy', '2 Days', 'Weekend'],
      rating: 4.6,
    ),
  ];

  // Unexplored Treks data
  final List<Place> _unexploredPlaces = [
    Place(
      id: 'u1',
      name: 'Kuari Pass Trek',
      description:
          'A hidden gem offering spectacular views of Nanda Devi and other Himalayan peaks. This moderate trek takes you through ancient forests and high-altitude meadows.',
      imageUrl: 'assets/Images/kuari_pass.jpg',
      latitude: 30.4833,
      longitude: 79.5667,
      tags: ['Moderate', '6 Days', 'Hidden'],
      rating: 4.7,
    ),
    Place(
      id: 'u2',
      name: 'Chopta Chandrashila Trek',
      description:
          'A lesser-known trek that combines spirituality with adventure. The summit offers 360-degree views of the Himalayan range.',
      imageUrl: 'assets/Images/chopta.jpg',
      latitude: 30.4833,
      longitude: 79.1167,
      tags: ['Easy', '4 Days', 'Spiritual'],
      rating: 4.6,
    ),
    Place(
      id: 'u3',
      name: 'Dayara Bugyal Trek',
      description:
          'One of the most beautiful meadows in Uttarakhand, this trek offers stunning views of the Bandarpoonch and Srikanth peaks.',
      imageUrl: 'assets/Images/dayara.jpg',
      latitude: 30.6333,
      longitude: 78.4333,
      tags: ['Easy', '5 Days', 'Meadows'],
      rating: 4.5,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _updateMarkers();
  }

  void _updateMarkers() {
    _markers.clear();
    for (var place in _places) {
      _markers.add(
        Marker(
          markerId: MarkerId(place.id),
          position: LatLng(place.latitude, place.longitude),
          infoWindow: InfoWindow(
            title: place.name,
            snippet: '${place.tags[0]} • ${place.tags[1]}',
          ),
        ),
      );
    }
    for (var place in _unexploredPlaces) {
      _markers.add(
        Marker(
          markerId: MarkerId(place.id),
          position: LatLng(place.latitude, place.longitude),
          infoWindow: InfoWindow(
            title: place.name,
            snippet: '${place.tags[0]} • ${place.tags[1]}',
          ),
        ),
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    if (_places.isNotEmpty) {
      _mapController.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(_places[0].latitude, _places[0].longitude),
          7,
        ),
      );
    }
  }

  void _showPlaceDetails(Place place) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage(place.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 16,
                    right: 16,
                    child: IconButton(
                      icon: const Icon(Icons.download,
                          color: Colors.white, size: 28),
                      onPressed: () {
                        // TODO: Implement download functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Download started for ${place.name}')),
                        );
                      },
                      tooltip: 'Download',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              place.name,
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.white, size: 20),
                                const SizedBox(width: 4),
                                Text(
                                  place.rating.toString(),
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: place.tags
                            .map((tag) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    tag,
                                    style: GoogleFonts.poppins(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'About the Trek',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        place.description,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Removed the Book This Trek button as per user request
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrekCard(Place place, bool isUnexplored) {
    return GestureDetector(
      onTap: () => _showPlaceDetails(place),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                place.imageUrl,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  place.rating.toString(),
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              place.tags[0],
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(30.4598, 78.0700),
              zoom: 7,
            ),
            markers: _markers,
            mapType: MapType.terrain,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                'Uttarakhand Treks',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 70,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Text(
                    'Unexplored Treks',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: PageView.builder(
                    controller: _unexploredController,
                    itemCount: _unexploredPlaces.length,
                    itemBuilder: (context, index) {
                      return _buildTrekCard(_unexploredPlaces[index], true);
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Text(
                    'Popular Treks',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                      _mapController.animateCamera(
                        CameraUpdate.newLatLngZoom(
                          LatLng(_places[index].latitude,
                              _places[index].longitude),
                          12,
                        ),
                      );
                    },
                    itemCount: _places.length,
                    itemBuilder: (context, index) {
                      return _buildTrekCard(_places[index], false);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _unexploredController.dispose();
    super.dispose();
  }
}
