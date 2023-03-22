import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  //update
  void selectScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(
      'board',
    );
  }

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
        color: Colors.black87,
        child: CustomScrollView(slivers: [
          const SliverAppBar(
            backgroundColor: Colors.black87,
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
                    buildText(),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildMentors(),
                        buildBoard(),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ]),
      ),
      bottomNavigationBar: buildNavigationBar(),
    );
  }

  Stack buildMentors() {
    return Stack(
        children: [
      Container(
        height: 235,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white30,
        ),
      ),
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/photos/mentors.jpg",
              fit: BoxFit.fill,
              width: 180,
              height: 165,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Technical Squads",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 120),
                  child: Icon(
                    Icons.recommend_outlined,
                    color: Colors.white54,
                    size: 20,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.tealAccent,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    ]);
  }

  NavigationBar buildNavigationBar() {
    return NavigationBar(
      height: 70,
      backgroundColor: Colors.black87,
      elevation: 50,
      destinations: const [
        NavigationDestination(
          icon: Icon(
            Icons.home_outlined,
            color: Colors.white,
            size: 30,
          ),
          selectedIcon: Icon(
            Icons.home,
            size: 30,
          ),
          label: "Home",
        ),
        NavigationDestination(
            icon: Icon(
              Icons.calendar_month_outlined,
              color: Colors.white,
              size: 30,
            ),
            selectedIcon: Icon(
              Icons.calendar_month,
              size: 30,
            ),
            label: "Events"),
        NavigationDestination(
            icon: Icon(
              Icons.people_outline,
              color: Colors.white,
              size: 30,
            ),
            selectedIcon: Icon(
              Icons.people,
              size: 30,
            ),
            label: "Committees"),
        NavigationDestination(
            icon: Icon(
              Icons.newspaper_outlined,
              color: Colors.white,
              size: 30,
            ),
            selectedIcon: Icon(
              Icons.newspaper,
              size: 30,
            ),
            label: "Blogs"),
        NavigationDestination(
            icon: Icon(
              Icons.ondemand_video_outlined,
              color: Colors.white,
              size: 30,
            ),
            selectedIcon: Icon(
              Icons.ondemand_video,
              size: 30,
            ),
            label: "Video"),
      ],
    );
  }

  InkWell buildBoard() {
    return InkWell(
      onTap: () => selectScreen(context),
      child: Stack(children: [
        Container(
          height: 235,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white30,
          ),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/photos/board.jpg",
                fit: BoxFit.fill,
                width: 180,
                height: 165,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Board 2023",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 120),
                    child: Icon(
                      Icons.recommend_outlined,
                      color: Colors.white54,
                      size: 20,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.tealAccent,
                    size: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }

  Padding buildText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Our New Posts",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
          ),
          InkWell(
            onTap: () {},
            splashColor: Colors.white,
            child: const Text(
              "See All",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }

  Container buildCircleContainer(index) {
    var currentIndex;
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
