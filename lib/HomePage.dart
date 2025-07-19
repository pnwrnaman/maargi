import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/places_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _carouselController =
      PageController(viewportFraction: 0.85);

  final List<Map<String, String>> _treks = [
    {
      'title': 'Aali bedni bugyal trek',
      'subtitle': 'A beautiful hidden gem in Uttarakhand',
      'image': 'assets/Images/aalibedni1.png',
    },
    {
      'title': 'Roopkund trek',
      'subtitle': 'The mysterious skeleton lake trek',
      'image': 'assets/Images/roopkund.png',
    },
    {
      'title': 'Valley of Flowers',
      'subtitle': 'A UNESCO World Heritage Site',
      'image': 'assets/Images/vof1.png',
    },
    {
      'title': 'Bali Pass',
      'subtitle': 'A challenging high-altitude trek',
      'image': 'assets/Images/bala.png',
    },
    {
      'title': 'Vof Classic',
      'subtitle': 'Classic valley trek',
      'image': 'assets/Images/vof.png',
    },
    {
      'title': 'Favorite Trek',
      'subtitle': 'A favorite among trekkers',
      'image': 'assets/Images/fav.png',
    },
    {
      'title': 'Aesthetic Trek',
      'subtitle': 'A trek for the soul',
      'image': 'assets/Images/aes.png',
    },
    {
      'title': 'Bus Adventure',
      'subtitle': 'A unique bus journey',
      'image': 'assets/Images/bus.png',
    },
  ];

  List<Widget> get _pages => [
        _buildHomeContent(),
        const PlacesScreen(),
        _buildProfilePage(),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildHomeContent() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'मार्गी',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // Heading
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: const [
                    TextSpan(text: 'Explore the '),
                    TextSpan(
                      text: 'Unexplored',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ),
            // Carousel
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _carouselController,
                itemCount: _treks.length,
                itemBuilder: (context, index) {
                  final trek = _treks[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            trek['image']!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              color: Colors.grey[300],
                              child: Icon(Icons.broken_image,
                                  size: 48, color: Colors.grey),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            bottom: 32,
                            child: Row(
                              children: [
                                const Icon(Icons.hiking,
                                    color: Colors.white, size: 24),
                                const SizedBox(width: 8),
                                Text(
                                  trek['title']!,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 16,
                            bottom: 12,
                            child: Text(
                              trek['subtitle']!,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Info Card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/Images/GetStarted.png',
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 220,
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      top: 16,
                      child: Text(
                        'UTTARAKHAND! HOLY LAND OF GOD',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      top: 56,
                      child: Text(
                        'Nestled in the Himalayas, Uttarakhand beckons with pristine landscapes, spiritual retreats like Rishikesh and Haridwar, and the majestic charm of Nainital. Known for its adventure sports and sacred sites, it\'s a haven for nature lovers and seekers of tranquility.',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStat('150+', 'Pilgrimage'),
                          _buildStat('4cr+', 'Tourists'),
                          _buildStat('100+', 'Adventure Spots'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePage() {
    return Scaffold(
      body: Center(
        child: Text(
          'Profile Page',
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
