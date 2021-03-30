import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'Dashboard.dart';

class UpdateScreen extends StatefulWidget {
  final String vehicleNumber, registrationNumber, vehicleType, ownerName, contactInfo, report, price, time;
  UpdateScreen(
      this.vehicleNumber,
      this.registrationNumber,
      this.vehicleType,
      this.ownerName,
      this.contactInfo,
      this.report,
      this.price,
      this.time,
      );

  @override
  _UpdateScreenState createState() => _UpdateScreenState(vehicleNumber, registrationNumber, vehicleType, ownerName, contactInfo, report, price, time);
}

class _UpdateScreenState extends State<UpdateScreen> {
  //String get vehicleNumber => null;
  String vehicleNumber, registrationNumber, vehicleType, ownerName, contactInfo, report, price, time;
  final vNo = TextEditingController();
  final rNo = TextEditingController();
  final Vty = TextEditingController();
  final oNm = TextEditingController();
  final cIn = TextEditingController();
  final rPt = TextEditingController();
  final rup = TextEditingController();


  _UpdateScreenState(
      this.vehicleNumber,
      this.registrationNumber,
      this.vehicleType,
      this.ownerName,
      this.contactInfo,
      this.report,
      this.price,
      this.time,

      );


  @override
  void initState() {
    vNo.text= vehicleNumber;
    rNo.text= registrationNumber;
    Vty.text= vehicleType;
    oNm.text= ownerName;
    cIn.text= contactInfo;
    rPt.text= report;
    rup.text= price;

    super.initState();
  }

  DeleteUser()
  {
    FirebaseFirestore.instance.collection("Users").doc(vNo.text)
        .delete().then((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
      showToast('Vehicle Info Deleted',
          context: context,
          animation: StyledToastAnimation.size,
          reverseAnimation: StyledToastAnimation.size,
          axis: Axis.horizontal,
          position: StyledToastPosition.center,
          animDuration: Duration(milliseconds: 400),
          duration: Duration(seconds: 2),
          curve: Curves.linear,
          reverseCurve: Curves.linear);
    });;
  }
  checkTextFieldEmptyOrNot(){

    // Creating 3 String Variables.
    String text1,text2,text3,text4,text5,text6,text7 ;

    // Getting Value From Text Field and Store into String Variable
    text1 = vNo.text ;
    text2 = rNo.text ;
    text3 = Vty.text ;
    text4 = oNm.text ;
    text5 = cIn.text ;
    text6 = rPt.text ;
    text7 = rup.text ;

    // Checking all TextFields.
    if(text1 == '' || text2 == '' || text3 == '' || text4 == '' || text5 == '' || text6 == '' || text7 == '')
    {
      showToast('Please Enter All The Fields',
          context: context,
          animation: StyledToastAnimation.size,
          reverseAnimation: StyledToastAnimation.size,
          axis: Axis.horizontal,
          position: StyledToastPosition.center,
          animDuration: Duration(milliseconds: 400),
          duration: Duration(seconds: 2),
          curve: Curves.linear,
          reverseCurve: Curves.linear);

    }

    else{
      FirebaseFirestore.instance
          .collection('Users')
          .doc(vNo.text)
          .update({
        "vehicleNumber": vNo.text,
        "registrationNumber": rNo.text,
        "vehicleType": Vty.text ,
        "ownerName" : oNm.text,
        "contactInfo" : cIn.text,
        "report": rPt.text,
        "price": rup.text,
        "time": DateTime.now().millisecondsSinceEpoch.toString()

      }).then((_) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),

        );
        showToast('Vehicle Info Updated',
            context: context,
            animation: StyledToastAnimation.size,
            reverseAnimation: StyledToastAnimation.size,
            axis: Axis.horizontal,
            position: StyledToastPosition.center,
            animDuration: Duration(milliseconds: 400),
            duration: Duration(seconds: 2),
            curve: Curves.linear,
            reverseCurve: Curves.linear);
      });
    }
  }
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("Delete"),
      onPressed: () {
        DeleteUser();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert!"),
      content: Text("Are you sure, you want to delete?"),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: Center( child:Row(

            children: <Widget>[
              Text(
                "Go ",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "Update",
                style: TextStyle(fontSize: 22, color: Colors.blue),
              )
            ],
          ),
          ),
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
      body:SingleChildScrollView(
        child: Card(
          elevation: 8.0,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: vNo,
                  enabled: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.electric_scooter_sharp),
                    labelText: "Vehicle Number",
                  ),


                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller: rNo,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.wysiwyg),
                    labelText: "Registration Number",
                  ),

                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller: Vty,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.merge_type_rounded),
                      labelText: "Vehicle Type",

                      hintText: "vehicleType"
                  ),

                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller: oNm,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    labelText: "Owner Name",
                  ),

                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller: cIn,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Contact Info",
                  ),

                ),

                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  minLines: 3,
                  maxLines: 20,
                  controller: rPt,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.assignment_outlined),
                    labelText: "Report",
                  ),

                ), SizedBox(
                  height: 15.0,
                ),

                TextField(
                  controller: rup,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.money),
                    labelText: "Price",
                  ),
                ), SizedBox(
                  height: 15.0,
                ),


                SizedBox(
                  height: 15.0,
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Expanded(child: RaisedButton(onPressed: () {showAlertDialog(context);},child: Text("Delete"),color: Colors.redAccent,textColor: Colors.white,)),
                      SizedBox(
                        height: 15.0,
                        width: 15,
                      ),
                      Expanded(child: RaisedButton(onPressed: () {checkTextFieldEmptyOrNot();},child: Text("Update"),color: Colors.black,textColor: Colors.white,)),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ),
      )

      );
  }
}
