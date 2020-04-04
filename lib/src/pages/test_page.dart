import 'package:flutter/material.dart';
// import 'package:orientat/src/pages/cuestionariofacil.dart';

class TestPage extends StatelessWidget {
  // const TestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orienta-T'),
        backgroundColor: Color.fromRGBO(38, 93, 130, 1),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
              radius: 25.0,
            ),
          ),
        ],
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: FloatingActionButton(
                  heroTag: "Previous",
                  onPressed: test,
                  child: Icon(Icons.arrow_back),
                  backgroundColor: Color.fromRGBO(38, 93, 130, 1),
                )),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                    child: FloatingActionButton(
                  heroTag: "Next",
                  onPressed: () {},
                  child: Icon(Icons.arrow_forward),
                  backgroundColor: Color.fromRGBO(38, 93, 130, 1),
                )))
          ],
        ),
      ),
    );
  }

  void test() {
    // final bank = new CuestionarioFacil();
    // bank.printQuestion();
  }
}
