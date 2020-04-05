import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(context),
      backgroundColor: Color.fromRGBO(187, 225, 250, 1),
      appBar: AppBar(
        title: Text("Orienta-T"),
        backgroundColor: Color.fromRGBO(38, 93, 130, 1),
        actions: <Widget>[
          Container(
            child: Icon(Icons.notifications_none),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            // child:
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'https://pbs.twimg.com/profile_images/1082891537388843009/QznUq4nA_400x400.jpg',
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Center(child: Text("ale_jaam")),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(69, 142, 190, 1),
          primaryColor: Color.fromRGBO(49, 59, 64, 1),
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(193, 227, 250, 1)))),
      child: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart, size: 30), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity, size: 30), title: Container())
        ],
        onTap: (index){

        },
      ),
    );
  }
}
