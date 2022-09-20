import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddStocks extends StatelessWidget {
  const AddStocks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 80, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Добавление акции', style: TextStyle(fontSize: 20),),
                  SizedBox(height: 16,),
                  Text('Если вы менеджер ресторана и хотите добавить акцию, то пожалуйста заполните и отправьте форму ниже. Это бесплатно.', style: TextStyle(color: Colors.black45),),
                  SizedBox(height: 32,),
                  Text('Название заведения', style: TextStyle(fontSize: 15),),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Введите название',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                            fontFamily: 'SFProLight'
                        ),
                        // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                        hintStyle: TextStyle(color: Colors.black38),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text('Описание акции', style: TextStyle(fontSize: 15),),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Введите описание',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                            fontFamily: 'SFProLight'
                        ),
                        // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                        hintStyle: TextStyle(color: Colors.black38),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text('Название акции', style: TextStyle(fontSize: 15),),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 184,
                    child: TextField(
                      minLines: 10,
                      maxLines: 20,
                      decoration: InputDecoration(
                        hintText: 'Введите описание',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                            fontFamily: 'SFProLight'
                        ),
                        // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text('Дата начала', style: TextStyle(fontSize: 15),),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Выберите дату',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                            fontFamily: 'SFProLight'
                        ),
                        // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                        hintStyle: TextStyle(color: Colors.black38),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text('Дата окончания', style: TextStyle(fontSize: 15),),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Выберите дату',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                            fontFamily: 'SFProLight'
                        ),
                        // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                        hintStyle: TextStyle(color: Colors.black38),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text('Фото', style: TextStyle(fontSize: 15),),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 164,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: 158,
                          height: 144,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(18, 18, 29, 210),
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.photo_camera, size: 32,),
                              Text('Добавить')
                            ],
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          width: 158,
                          height: 144,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40,),
                  Text('Телефон менеджера', style: TextStyle(fontSize: 15),),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Введите номер телефона',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                            fontFamily: 'SFProLight'
                        ),
                        // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                        hintStyle: TextStyle(color: Colors.black38),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text('E-mail', style: TextStyle(fontSize: 15),),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Введите ваш e-mail',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                            fontFamily: 'SFProLight'
                        ),
                        // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                        hintStyle: TextStyle(color: Colors.black38),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32,),
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
                        child: Text('Отправить', style: TextStyle(color: Colors.white, fontFamily: 'SFPro', fontSize: 13),),),
                    ),
                  ),
                ],
              ),
            )
          ]
      ),
      floatingActionButton: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 61, horizontal: 27),
          child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios, size: 20,)
          ),
        ),
      ),
    );
  }
}
