import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_storm/widgets/selected_promo_widget.dart';

class FavTabWidget extends StatefulWidget {
  const FavTabWidget({Key? key}) : super(key: key);

  @override
  State<FavTabWidget> createState() => _FavTabWidgetState();
}

class _FavTabWidgetState extends State<FavTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Избранное', style: TextStyle(color: Colors.black, fontSize: 17),
              ),
             ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                  [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(7),
                  width: double.infinity,
                  height: 610,
                  child: GridView.builder(
                    itemCount: 15,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 189,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => SelectedPromoWidget()));
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedPromoWidget()));
                         },
                      child: Container(
                        margin: EdgeInsets.all(7.5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(11),
                                        topRight: Radius.circular(11)
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/aleks-dorohovich-HYpXP6Zk1dw-unsplash 1.png'),
                                      fit: BoxFit.cover,
                                    )
                                ),
                                height: 124,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 6),
                                            child: Container(
                                              height: 20,
                                              width: 41,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8))
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text('-50%', style: TextStyle(fontSize: 14, color: Theme.of(context).backgroundColor),)
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                CupertinoIcons.heart_fill,
                                                size: 23,
                                                color: Colors.white,
                                                shadows: [
                                                  BoxShadow(
                                                    blurRadius: 4,

                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(11)),
                                ),
                                height: 65,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(6, 6, 6, 0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              height: 27,
                                              width: 27,
                                              child: Image.asset('assets/images/kfc.png')
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 1),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  'KFC',
                                                  style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'SFProLight'),
                                                ),
                                                Text(
                                                  'с 18.10 до 26.05',
                                                  style: TextStyle(color: Colors.grey, fontSize: 11, fontFamily: 'SFProLight'),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 6),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(//1
                                              children: [
                                                Icon(CupertinoIcons.location_solid, size: 15,),
                                                Text('Строителей', style: TextStyle(fontSize: 11),),
                                              ],
                                            ),
                                            Row( //2
                                              children: [
                                                Icon(Icons.star, color: Colors.orange, size: 14,),
                                                Text('4,6', style: TextStyle(fontSize: 12),)
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },

                    ),
                ),
              ],
            )
          ]
              )
          )
        ],
      ),
    );

  }
}

class MySliverBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
      ],
    );
  }

  @override

  double get maxExtent => throw UnimplementedError();

  @override

  double get minExtent => throw UnimplementedError();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {

    throw UnimplementedError();
  }
}