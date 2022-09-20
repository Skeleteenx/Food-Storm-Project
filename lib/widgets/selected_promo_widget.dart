import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectedPromoWidget extends StatefulWidget {
  const SelectedPromoWidget({Key? key}) : super(key: key);

  @override
  State<SelectedPromoWidget> createState() => _SelectedPromoWidgetState();
}

class _SelectedPromoWidgetState extends State<SelectedPromoWidget> {
  List<String> categories = [
    'Все',
    'Фастфуд',
    'Пицца',
    'Шаурма',
    'Роллы',
    'Бургеры'
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                    )
                ),
              ),
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/images/aleks-dorohovich-HYpXP6Zk1dw-unsplash 1.png"))),
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 32, 10, 0),
                  child: Column(
                    children: [
                      // IconButton(
                      //     onPressed: (){},
                      //     icon: Icon(
                      //       Icons.favorite,
                      //       size: 32,
                      //       color: Theme.of(context).primaryColor,
                      //     )
                      // ),
                      // IconButton(
                      //     onPressed: (){},
                      //     icon: Icon(Icons.share, size: 32, color: Theme.of(context).primaryColor,)
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            expandedHeight: 270,
          )
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            physics: BouncingScrollPhysics(),
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Комбо с биг мак от  Mc’Donalds за 250 р',
                    style: TextStyle(fontSize: 22, fontFamily: 'SFProBold'),
                  ),
                  Container(
                    height: 32,
                    width: 72,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0.5, 0.5),
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(13))),
                    child: Center(
                        child: Text(
                      '-50%',
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: 19),
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'с 18.09 до 25.09',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => buildCategory(index),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 77, 0),
                child: Text(
                  'Биг-мак, большой картофель фри, coca-cola 0.4 мл, сырный соус, пирожок с вишней.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                color: Colors.grey.shade300,
                height: 1,
                width: double.maxFinite,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'О ресторане',
                style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset('assets/images/Vector.png'),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Mc’Donalds',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 14,
                  ),
                  Text(
                    '4,6',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Компания МакДональдс ежедневно делает тысячи людей счастливыми благодаря вкусной и сочной еде. Любимые блюда состоят из обычных продуктов, имеющихся в каждом доме – это вкусные овощи, куриное мясо, говядина, бекон, картофель, рыба, яйца, булочки и молочные продукты. Мы отвечаем за высокое качество и безопасность предлагаемой продукции для каждого гостя.',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'SFProLight'
                ),
              ),
              SizedBox(height: 24,),
              Container(
                height: 188,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: AssetImage('assets/images/marjan-blan-marjanblan-gHCbgGN5TCA-unsplash 1.png')
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(22))
                ),
              ),
              SizedBox(height: 24,),
              Text('Адрес', style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 14,
              fontFamily: 'SFProLight'
              ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.location_solid,
                    color: Theme.of(context).backgroundColor,
                    size: 24,
                  ),
                  SizedBox(width: 12,),
                  Text('Тольятти, пр-т Мира, д 167 Г', style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'SFProLight',
                  ),
                  )
                ],
              ),
              SizedBox(height: 28,),
              Text(
                'Режим работы', style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                    fontFamily: 'SFProLight'
              ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.time,
                    color: Theme.of(context).backgroundColor,
                    size: 24,
                  ),
                  SizedBox(width: 12,),
                  Text('с 9:00 до 00:00', style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'SFProLight',
                  ),
                  )
                ],
              ),
              SizedBox(height: 32,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Image.asset('assets/images/globe-Bold.png'),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Image.asset('assets/images/instagram icon.png'),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Center(child: Image.asset('assets/images/Shape.png')),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Text('Пожаловаться', style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                  fontFamily: 'SFProLight'
                  ),
                  ),
                  SizedBox(height: 40,),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(11))
                      ),
                      child: TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text('Забронировать', style: TextStyle(color: Colors.white, fontFamily: 'SFPro', fontSize: 13),),),
                    ),
                  ),
                  SizedBox(height: 24,)
                ],
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Align(
      //       alignment: Alignment.topLeft,
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 61, horizontal: 20),
      //         child: IconButton(
      //             onPressed: () => Navigator.pop(context),
      //             icon: Icon(Icons.arrow_back_ios, size: 20,)
      //         ),
      //       ),
      //     ),
      //     Align(
      //       alignment: Alignment.topRight,
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 52, horizontal: 10),
      //         child: Column(
      //           children: [
      //             IconButton(
      //                 onPressed: (){},
      //                 icon: Icon(
      //                   Icons.favorite,
      //                   shadows: [
      //                     BoxShadow(
      //                       color: Colors.black12,
      //                       spreadRadius: 2,
      //                       blurRadius: 2,
      //                       offset: Offset(1, 1),
      //                     )
      //                   ],
      //                   size: 32,
      //                   color: Theme.of(context).primaryColor,
      //                 )
      //             ),
      //             IconButton(
      //                 onPressed: (){},
      //                 icon: Icon(Icons.share, size: 32, color: Theme.of(context).primaryColor,)
      //             ),
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  Widget buildCategory(int index) {
    return Container(
      height: 16,
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0.1,
              blurRadius: 0.1,
              offset: Offset(0.1, 0.1),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Center(
          child: Text(
            categories[index],
            style: TextStyle(
                fontFamily: 'SFProLight',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black38),
          ),
        ),
      ),
    );
  }
}
