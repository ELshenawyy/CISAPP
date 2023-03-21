import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List imgList = [
      "assets/photos/Img1.jpg",
      "assets/photos/Img2.jpg",
      "assets/photos/Img3.jpg",
    ];
    int currentIndex = 0;

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: CustomScrollView(slivers: [
          const SliverAppBar(
            backgroundColor: Colors.black,
            leading: Icon(
              Icons.menu,
              size: 30,
            ),
            centerTitle: true,
            title: Text(
              "CIS Team",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.teal),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const Text(
                "Our Events",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(
                height: double.maxFinite,
                child: ListView(
                  children: [
                    CarouselSlider.builder(
                      itemCount: imgList.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return buildImage(imgList, index);
                      },
                      options: CarouselOptions(
                          height: 180,
                          initialPage: 0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          onPageChanged: (index, _) {
                            setState(() {
                              currentIndex = index;
                              print(currentIndex);
                            });
                          }),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildCircleContainer(0),
                        buildCircleContainer(1),
                        buildCircleContainer(2),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ),
        ]),
      ),
    );
  }

  Container buildCircleContainer(index) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == index ? Colors.greenAccent : Colors.white,
      ),
    );
  }

  Container buildImage(List<dynamic> imgList, int index) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imgList[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
