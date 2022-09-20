import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/buttons_provider.dart';
import 'add_stocks.dart';

class StocksTabWidget extends StatefulWidget {
  StocksTabWidget({Key? key}) : super(key: key);

  @override
  State<StocksTabWidget> createState() => _StocksTabWidgetState();
}

class _StocksTabWidgetState extends State<StocksTabWidget> {
  List<String> categories = ['Все', 'Фастфуд', 'Пицца', 'Шаурма', 'Роллы', 'Бургеры'];
  int selectedIndex = 0;

  // bool _check = false;
  @override
  Widget build(BuildContext context) {
    final providerButt = Provider.of<ButtonsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
          elevation: 1.0,
          toolbarHeight: 175,
          flexibleSpace: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 42, 14, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          providerButt.showModalSheet(context);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Тольятти', style: TextStyle(fontSize: 16, fontFamily: 'SFPro'),),
                            Icon(Icons.arrow_forward_ios, size: 11,),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.all(Radius.circular(11))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddStocks()
                                  )
                              ),
                              child: Text('Добавить акцию', style: TextStyle(color: Colors.white, fontFamily: 'SFPro', fontSize: 13),),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Поиск по акциям',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                            fontFamily: 'SFProLight'
                        ),
                        // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                        prefixIcon: Icon(Icons.search, size: 26,),
                        hintStyle: TextStyle(color: Colors.black38),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(11))
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: SizedBox(
                    height: 30,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) => buildCategory(index),
                    ),
                  ),
                ),
              ])
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Container(
                height: 331,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 2),
                    )
                  ],
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 192,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/brett-jordan-zee1geZy6H0-unsplash 1.png'),
                          fit: BoxFit.fill,
                        ),
                        // color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                                  child: Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(9))
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.star, color: Colors.orange, size: 17,),
                                        SizedBox(width: 2,),
                                        Text('5,0', style: TextStyle(fontSize: 15),),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(11), topLeft: Radius.circular(11))
                                    ),
                                    height: 32,
                                    width: 64,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('-40%', style: TextStyle(color: Theme.of(context).backgroundColor, fontSize: 21, fontFamily: 'SFProLight'),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 139,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/images/Vector.png'),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'McDonald\'s',
                                            style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'SFProLight'),
                                          ),
                                          Text(
                                            'с 18.09 до 25.09',
                                            style: TextStyle(color: Colors.grey, fontSize: 13, fontFamily: 'SFProLight'),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                  Container(
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Theme.of(context).backgroundColor
                                      ),
                                    ),
                                    child: IconButton(
                                        onPressed: (){},
                                        icon: Icon(CupertinoIcons.heart, size: 28, color: Theme.of(context).backgroundColor,)
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Container(
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                        onPressed: (){},
                                        icon: Icon(Icons.phone_enabled_outlined, size: 28, color: Theme.of(context).primaryColor,)
                                    ),
                                  ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 14, bottom: 14, ),
                            child: Text(
                                'БигМак, средний картофель  фри, кола и сырный соус по новой  акции от МакФест!',
                              style: TextStyle(fontFamily: 'SFProLight', fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Container(
                height: 331,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      )
                    ],
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 192,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/aleks-dorohovich-HYpXP6Zk1dw-unsplash 1.png'),
                            fit: BoxFit.fill,
                          ),
                          // color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                                  child: Container(
                                    height: 22,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(9))
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.star, color: Colors.orange, size: 17,),
                                        SizedBox(width: 2,),
                                        Text('4,5', style: TextStyle(fontSize: 15),),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(11), topLeft: Radius.circular(11))
                                    ),
                                    height: 32,
                                    width: 64,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('-50%', style: TextStyle(color: Theme.of(context).backgroundColor, fontSize: 21, fontFamily: 'SFProLight'),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 139,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 35,
                                        width: 40,
                                        child: Image.asset('assets/images/kfc.png')
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'KFC',
                                            style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'SFProLight'),
                                          ),
                                          Text(
                                            'с 18.10 до 26.05',
                                            style: TextStyle(color: Colors.grey, fontSize: 13, fontFamily: 'SFProLight'),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 44,
                                      width: 44,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Theme.of(context).backgroundColor
                                        ),
                                      ),
                                      child: IconButton(
                                          onPressed: (){},
                                          icon: Icon(CupertinoIcons.heart, size: 28, color: Theme.of(context).backgroundColor,)
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Container(
                                      height: 44,
                                      width: 44,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).backgroundColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                          onPressed: (){

                                          },
                                          icon: Icon(Icons.phone_enabled_outlined, size: 26, color: Theme.of(context).primaryColor,)
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14, bottom: 14, ),
                            child: Text(
                              'БигМак, средний картофель  фри, кола и сырный соус по новой  акции от МакФест!',
                              style: TextStyle(fontFamily: 'SFProLight', fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
      //   ),
      // ]
      ),
    );
  }

  Widget buildCategory (int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: selectedIndex == index ? Colors.grey.shade300 : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Center(
            child: Text(
              categories[index],
              style: TextStyle(
                  fontFamily: 'SFProLight',
                  fontWeight: FontWeight.bold,
                  fontSize: 15, color: selectedIndex == index ? Colors.black54 : Colors.black38),
            ),
          ),
        ),
      ),
    );
  }
}