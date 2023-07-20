import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

List<Map<String, dynamic>> dateData = [
  {
    "date": "2023.07.13(목)",
  },
  {
    "date": "2023.07.12(수)",
  },
  {
    "date": "023.07.10(월)",
  },
];

class _MyPageState extends State<MyPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);},
            icon:Icon(
              Icons.arrow_back_ios,
              size: 40,
              color: Colors.white,
            )
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          Icon(
            Icons.list_alt_rounded,
            size: 40,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            size: 40,
            color: Colors.white,
          )
        ],
      ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
            itemCount: dateData.length,
          itemBuilder:(context, index){
              return Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dateData[index]["date"],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Switch(
                          value: isSwitched,
                          onChanged: (value){
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        //activeColor:
                        //activeTrackColor:
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 26, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            //print("asdf");
                          },
                          child: Container(
                            height: 115,
                            width: 110,
                            child: Image.asset(
                              "assets/images/Frame 2608516.png",
                              width: 52,
                              height: 52,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.7),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0,3)
                                  )
                                ]
                            ),
                          ),
                        ),
                        SizedBox(width: 31),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            height: 115,
                            width: 110,
                            child: Image.asset(
                              "assets/images/Pharmacy.png",
                              width: 52,
                              height: 52,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.7),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0,3)
                                  )
                                ]
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
          },

        )
    );
  }
}
