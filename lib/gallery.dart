import 'package:flutter/material.dart';
import 'details_page.dart';

List<ImageDetails> _images = [
  ImageDetails(
    imagePath: 'images/1.jpg',
    title: 'Greenery Environment at nec',
    details: 'The clean and fresh environment of Nepal Engineering College',
  ),
  ImageDetails(
    imagePath: 'images/2.jpg',
    title: 'Students at project competition',
    details: 'Students taking part in project competiton',
  ),
  ImageDetails(
    imagePath: 'images/3.jpg',
    title: 'Teachers',
    details: 'Teachers of Computer Science and Engineering Department',
  ),
  ImageDetails(
    imagePath: 'images/4.jpg',
    title: 'Farewell Program',
    details: 'Farewell program for students',
  ),
  ImageDetails(
    imagePath: 'images/5.jpg',
    title: 'Sports Week',
    details: '016 civil vs 016 computer',
  ),
  ImageDetails(
    imagePath: 'images/6.jpg',
    title: 'Vice Captain Shaisav Rawal',
    details: '016 computer Winner of sports week 2021',
  ),
  ImageDetails(
    imagePath: 'images/7.jpg',
    title: 'Trophy Rewarding',
    details: 'Rewarding students in football competition',
  ),
  ImageDetails(
    imagePath: 'images/8.jpg',
    title: 'Enjoying College Days',
    details: '016 Students having fun clicking photos',
  ),
  ImageDetails(
    imagePath: 'images/9.jpg',
    title: '.',
    details: '.',
  ),
  ImageDetails(
    imagePath: 'images/10.jpg',
    title: '.',
    details: '.',
  ),
  ImageDetails(
    imagePath: 'images/11.jpg',
    title: 'a',
    details: '.',
  ),
  ImageDetails(
    imagePath: 'images/12.jpg',
    title: '.',
    details: '.',
  ),
  ImageDetails(
    imagePath: 'images/111.jpg',
    title: '.',
    details: '.',
  ),
  ImageDetails(
    imagePath: 'images/222.jpg',
    title: '.',
    details: '.',
  ),
  ImageDetails(
    imagePath: 'images/333.jpg',
    title: 'm',
    details: '.',
  ),
  ImageDetails(
    imagePath: 'images/444.jpg',
    title: 'm',
    details: '.',
  ),
];

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              imagePath: _images[index].imagePath,
                              title: _images[index].title,
                              details: _images[index].details,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(_images[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;
  final String title;
  final String details;
  ImageDetails({
    @required this.imagePath,
    @required this.title,
    @required this.details,
  });
}
