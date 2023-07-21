import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> events = [
    {
      'title': 'Impulso Day',
      'date': 'Febuaray 20, 2023',
      'image': 'assets/images/sportsday2023.jpeg',
    },
    {
      'title': 'Republic Day',
      'date': 'Januray 26, 2023',
      'image': 'assets/images/republicday2023.jpg',
    },
    {
      'title': 'Dark Flames - Winter Carnival Party',
      'date': 'December 28, 2022',
      'image': 'assets/images/tirth.jpg',
    },
    {
      'title': "Woman's Day Celebration",
      'date': 'March 8, 2022',
      'image': 'assets/images/womenday2023.jpg',
    },
    {
      'title': 'Ratri B4 Navratri ',
      'date': 'October 20, 2022',
      'image': 'assets/images/ratribeforenavratri2021.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('College Events'),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: events.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 16);
          },
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  events[index]['title'],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                _buildCard1(events[index]['image'], events[index]['date']),
                //Uncomment one of the other _buildCard functions to use a different card design.
                //_buildCard2(events[index]['image'], events[index]['date']),
                //_buildCard3(events[index]['image'], events[index]['date']),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCard1(String image, String date) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Image.asset(
            image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 200,
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
            bottom: 16,
            left: 16,
            child: Text(
              date,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard2(String image, String date) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              date,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard3(String image, String date) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              image,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              date,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
