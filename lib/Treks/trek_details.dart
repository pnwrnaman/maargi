import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrekDetails {
  final String name;
  final String description;
  final String difficulty;
  final String duration;
  final String bestTime;
  final String imagePath;
  final String altitude;
  final String baseCamp;
  final String route;
  final String highlights;

  TrekDetails({
    required this.name,
    required this.description,
    required this.difficulty,
    required this.duration,
    required this.bestTime,
    required this.imagePath,
    required this.altitude,
    required this.baseCamp,
    required this.route,
    required this.highlights,
  });
}

class TrekList {
  static List<TrekDetails> treks = [
    TrekDetails(
      name: 'Valley of Flowers Trek',
      description:
          'A UNESCO World Heritage Site, the Valley of Flowers is a vibrant paradise of alpine flowers, surrounded by snow-capped peaks. This trek offers a unique blend of natural beauty and spiritual significance.',
      difficulty: 'Moderate',
      duration: '6 Days',
      bestTime: 'July to September',
      imagePath: 'assets/Images/vof.png',
      altitude: '3,658 meters',
      baseCamp: 'Govindghat',
      route: 'Govindghat → Ghangaria → Valley of Flowers',
      highlights:
          '• Vibrant alpine flowers\n• Hemkund Sahib\n• Snow-capped peaks\n• Rich biodiversity',
    ),
    TrekDetails(
      name: 'Kedarkantha Trek',
      description:
          'One of the most popular winter treks in India, Kedarkantha offers stunning 360-degree views of the Himalayan peaks. The summit climb is challenging but rewarding.',
      difficulty: 'Moderate',
      duration: '6 Days',
      bestTime: 'December to April',
      imagePath: 'assets/Images/kedarkantha.png',
      altitude: '3,810 meters',
      baseCamp: 'Sankri',
      route: 'Sankri → Juda Ka Talab → Kedarkantha Base → Summit',
      highlights:
          '• Winter snow trek\n• Summit views\n• Pine forests\n• Local culture',
    ),
    TrekDetails(
      name: 'Har Ki Dun Trek',
      description:
          'Known as the "Valley of Gods", Har Ki Dun is a cradle-shaped valley surrounded by snow-capped peaks. This ancient trade route offers a perfect blend of natural beauty and cultural heritage.',
      difficulty: 'Easy to Moderate',
      duration: '7 Days',
      bestTime: 'March to June, September to November',
      imagePath: 'assets/Images/harkidun.png',
      altitude: '3,566 meters',
      baseCamp: 'Sankri',
      route: 'Sankri → Taluka → Osla → Har Ki Dun',
      highlights:
          '• Ancient villages\n• Dense forests\n• Mountain views\n• Rich culture',
    ),
    TrekDetails(
      name: 'Roopkund Trek',
      description:
          'Famous for its mysterious skeleton lake, Roopkund is a high-altitude glacial lake surrounded by snow-capped peaks. The trek offers diverse landscapes and stunning views.',
      difficulty: 'Moderate to Difficult',
      duration: '8 Days',
      bestTime: 'May to June, September to October',
      imagePath: 'assets/Images/roopkund.png',
      altitude: '5,029 meters',
      baseCamp: 'Lohajung',
      route: 'Lohajung → Bedni Bugyal → Roopkund',
      highlights:
          '• Skeleton Lake\n• Bedni Bugyal\n• Junargali Pass\n• Alpine meadows',
    ),
    TrekDetails(
      name: 'Dayara Bugyal Trek',
      description:
          'One of the most beautiful high-altitude meadows in Uttarakhand, Dayara Bugyal offers panoramic views of the Himalayan peaks and vast expanses of green pastures.',
      difficulty: 'Easy to Moderate',
      duration: '6 Days',
      bestTime: 'May to June, September to November',
      imagePath: 'assets/Images/dayara.png',
      altitude: '3,408 meters',
      baseCamp: 'Barsu',
      route: 'Barsu → Barnala → Dayara Bugyal',
      highlights:
          '• Alpine meadows\n• Mountain views\n• Local culture\n• Rich flora',
    ),
  ];
}

class TrekCard extends StatelessWidget {
  final TrekDetails trek;

  const TrekCard({Key? key, required this.trek}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              trek.imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trek.name,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  trek.description,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                _buildInfoRow('Difficulty', trek.difficulty),
                _buildInfoRow('Duration', trek.duration),
                _buildInfoRow('Best Time', trek.bestTime),
                _buildInfoRow('Altitude', trek.altitude),
                const SizedBox(height: 16),
                Text(
                  'Highlights:',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  trek.highlights,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
