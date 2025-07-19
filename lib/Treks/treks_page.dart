import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'trek_details.dart';

class TreksPage extends StatelessWidget {
  const TreksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Uttarakhand Treks',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.grey[50],
              child: Text(
                'Discover the most beautiful treks in Uttarakhand, from easy day hikes to challenging high-altitude adventures. Each trek offers unique experiences and stunning views of the Himalayas.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: TrekList.treks.length,
              itemBuilder: (context, index) {
                return TrekCard(trek: TrekList.treks[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
