import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // String _nombre = "";
    // String _email = "";
    // String _fecha = "";
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // bottomNavigationBar: _bottomNavigationBar(context),
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
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            _headerColor(_screenSize),
            _getInfo(_screenSize),
            // _userAdress(_screenSize),
          ],
        ),
      ),
    );
  }

  Widget _headerColor(_screenSize) {
    return Positioned(
      top: 0,
      child: Container(
        color: Color.fromRGBO(69, 142, 190, 1),
        height: _screenSize.height / 4.2,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Widget _getInfo(_screenSize) {
    return Positioned(
      top: 115,
      child: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.95,
        child: Container(
          width: _screenSize.height,
          // padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Información de usuario",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1082891537388843009/QznUq4nA_400x400.jpg'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Alejandro Alamar",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              Text(
                "ale_jaam",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              Text(
                "Student",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "ale.jaam7@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
