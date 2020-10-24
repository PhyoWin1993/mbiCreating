import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _ageCtrl = new TextEditingController();
  final TextEditingController _heightCtrl = new TextEditingController();
  final TextEditingController _weightCtrl = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = "";

  //

  void _caculateBMI() {
    setState(() {
      try {
        int age = int.parse(_ageCtrl.text);
        double height = double.parse(_heightCtrl.text);
        inches = height * 12;
        double weight = double.parse(_weightCtrl.text);

        //

        if ((_ageCtrl.text.isNotEmpty || age > 0) &&
            (_heightCtrl.text.isNotEmpty || inches > 0) &&
            (_weightCtrl.text.isNotEmpty || weight > 0)) {
          result = weight / (inches * inches) * 703;

          if (double.parse(result.toStringAsFixed(1)) < 18.5) {
            _resultReading = "UnderWeight.";
            print(_resultReading);
          } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
              result < 25) {
            _resultReading = "Grade Shape";
            print(_resultReading);
          } else if (double.parse(result.toStringAsFixed(1)) >= 25.0 &&
              result < 30.0) {
            _resultReading = " Over Weight";
            print(_resultReading);
          } else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
            _resultReading = "Obse";
            print(_resultReading);
          }
        } else {
          result = 0.0;
          _resultReading = "";
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Fill in Blank!"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Ok"),
                    )
                  ],
                );
              });
        }
      } catch (e) {
        result = 0.0;
        _resultReading = "";
        // showDialog(context: );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("MBI"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      //
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            new Image.asset(
              "images/bmilogo.png",
              height: 85.0,
              width: 75.0,
            ),

            // new container
            new Container(
              margin: const EdgeInsets.all(3.0),
              // color: Colors.grey.shade400,
              height: 245,
              width: 290,
              decoration: BoxDecoration(
                color: Colors.grey,
                // borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: new Column(
                children: [
                  //
                  new TextField(
                    controller: _ageCtrl,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: "Age",
                        hintText: "Eg...34",
                        icon: Icon(Icons.person_outline)),
                  ),

                  //
                  new TextField(
                    controller: _heightCtrl,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: "Height in feet",
                        hintText: "Eg..6.5",
                        icon: Icon(Icons.insert_chart)),
                  ),

                  //
                  new TextField(
                    controller: _weightCtrl,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: "Weight in lbs",
                        hintText: "Eg.180",
                        icon: Icon(Icons.line_weight)),
                  ),

                  //

                  new Padding(
                    padding: const EdgeInsets.all(5.4),
                  ),

                  //

                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      color: Colors.pinkAccent,
                      onPressed: _caculateBMI,
                      child: Text("Caculate "),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),

            // last Row

            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //
                Text(
                  "MBI :${result.toStringAsFixed(1)}",
                  style: new TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 19.0,
                  ),
                ),

                //

                new Padding(padding: const EdgeInsets.all(5.0)),

                //

                Text(
                  "$_resultReading",
                  style: new TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 19.0,
                  ),
                ),

                //
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //
                  new Text(
                    "Who shouldn't use a BMI calculator",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 30.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //

                  new Text(
                    "BMI is not used for muscle builders, long distance athletes, pregnant women, the elderly or young children. This is because BMI does not take into account whether the weight is carried as muscle or fat, just the number. Those with a higher muscle mass, such as athletes, may have a high BMI but not be at greater health risk. Those with a lower muscle mass, such as children who have not completed their growth or the elderly who may be losing some muscle mass may have a lower BMI. During pregnancy and lactation, a woman's body composition changes, so using BMI is not appropriate.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
