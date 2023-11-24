import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "balloning",
    "hiking.png": "hiking",
    "kayaking.png": "kayaking",
    "snorkling.png": "snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController? _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //menu text
        Container(
          padding: const EdgeInsets.only(top: 60, left: 20),
          child: Row(
            children: [
              Icon(
                Icons.menu,
                size: 30,
                color: Colors.black54,
              ),
              Expanded(child: Container()),
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.5),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 30),
        //discover text
        Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover")),
        SizedBox(height: 20),
        //tab bar
        Container(
            child: Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
            labelPadding: const EdgeInsets.only(left: 20, right: 0),
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicator:
                CircleTabIndicator(color: AppColors.mainColor, radius: 4),
            tabs: [
              Tab(
                text: "Places",
              ),
              Tab(
                text: "Inspiration",
              ),
              Tab(
                text: "Emotions",
              )
            ],
          ),
        )),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 0, top: 10),
          height: 270,
          width: double.maxFinite,
          child: TabBarView(controller: _tabController, children: [
            ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/images/mountain.jpeg"),
                          fit: BoxFit.cover)),
                );
              },
            ),
            Container(
              child: Text("Inspiration"),
            ),
            Container(
              child: Text("Emotions"),
            )
          ]),
        )
        //
        ,
        SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppLargeText(
                text: "Explore more",
                fontSize: 22,
              ),
              AppText(text: "See all", color: AppColors.textColor1),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(left: 20),
          height: 120,
          width: double.maxFinite,
          child: ListView.builder(
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) {
              return Container(
                margin: const EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(right: 50),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/${images.keys.elementAt(index)}"),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(height: 10),
                    Container(
                        child: AppText(
                      text: images.values.elementAt(index),
                      color: AppColors.textColor2,
                    )),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
