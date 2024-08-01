import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scopefinalproject/models/placement.dart';
import 'package:scopefinalproject/models/placementService.dart';

class RecentPlacementsScreen extends StatelessWidget {
  final PlacementService _placementService = PlacementService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue[900],
          title: Center(child: Image.asset('images/scope-india-logo-bird.png',
            height: 50,
          )),
        ),
        body: FutureBuilder<List<Placement>>(
          future: _placementService.fetchPlacements(count: 30),
          // Future that FutureBuilder listens to
          //to fetch 30 placements

          builder: (context, snapshot) {
            //snapshot contain information about the Futures state and data.

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No placements found.'));
            } else {
              List<Placement> placements = snapshot.data!;

              //factory converts this data to the class instances

              //a list where each item is a instance of the Placementclass.

              return Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/homescreenbg.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        //to place the column inside custom scroll view
                        child: Column(
                          children: [
                            SizedBox(height: 16),
                            Text(
                              'Placement Cell',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.viga(
                                textStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Image.asset('images/stars.png'),
                            SizedBox(height: 6),
                            Center(
                              child: Text(
                                'Google 4.9 * Rated Institute',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              '1000\'s of Students are getting placed every year from SCOPE INDIA',textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16
                              ),
                            ),
                            SizedBox(height: 16), // Add some space before the grid
                          ],
                        ),
                      ),
                      SliverGrid(
                        //displays its children in a grid format,
                        delegate: SliverChildBuilderDelegate(

                          // for this builder function implicitly passed through its constructor

                              (context, index) {

                                //fetch the correct data for each item from the placements list

                            if (index >= placements.length) return SizedBox();

                            // Handle case where index exceeds number of placements

                            Placement placement = placements[index];
                            return Card(
                              elevation: 4.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        placement.photoUrl,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      placement.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      placement.jobRole,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      placement.companyName,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: placements.length,

                          // Use length of placements to set the no of grid items

                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          //how the grid of items is laid out
                          //fixed no of cols

                          crossAxisCount: 2, // Two cols
                          childAspectRatio: 3 / 4, // Aspect ratio of each card
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
