import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ichat/screens/shared_utils/extension.dart';
import 'package:ichat/screens/shared_utils/input_field.dart';
import 'package:ichat/screens/shared_utils/screen_sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController search = TextEditingController();

  List<Map<String, dynamic>> people = [
    {
      'name': 'Jane Doe',
      'time': '3 min',
      'message': 'Meeting has been rescheduled for Thursday',
    },
    {
      'name': 'Smith Doe',
      'time': '5 min',
      'message': 'Bro, \$300 sent, Please Confirm',
    },
    {'name': 'John Rue', 'time': '2 days', 'message': 'Ok, good.'},
    {'name': 'Adams Collins', 'time': '15/09', 'message': 'Happy Birthday G!'},
  ];

  List<IconData> bottomNavIcon = [
    CupertinoIcons.chat_bubble_2_fill,
    CupertinoIcons.camera_fill,
    CupertinoIcons.person_fill,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(
                  bottomNavIcon.length,
                  (index) =>
                      Icon(bottomNavIcon[index], color: Colors.white, size: 35),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 80),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            CupertinoIcons.chat_bubble_fill,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            // color: Colors.grey,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            Icons.people,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 30),
                  ),
                ],
              ),
              20.vSpace,
              Text(
                'Chats',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              10.vSpace,
              InputField(
                textEditingController: search,
                hint: 'Search for Chats',
                hintcolor: Colors.grey,
                hintsize: 16,
                prefixWidget: Icon(CupertinoIcons.search),
                suffixWidget: Icon(CupertinoIcons.mic_fill),
              ),
              20.vSpace,
              ...List.generate(
                people.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person, size: 40),
                      ),
                      10.hSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            people[index]['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            width: 220,
                            child: Text(
                              people[index]['message'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        people[index]['time'],
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[600],
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              40.vSpace,
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Start New Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
