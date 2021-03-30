import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/services.dart';
import 'Dashboard.dart';

class CreateData extends StatefulWidget {
  @override
  _CreateDataState createState() => _CreateDataState();
}
class _CreateDataState extends State<CreateData> {
  //String vehicleNumber, registrationNumber, vehicleType, ownerName, contactInfo, report;
  FirebaseFirestore firebaseFirestore;
  bool _isLoading = false;
  final vNo = TextEditingController();
  final rNo = TextEditingController();
  final Vty = TextEditingController();
  final oNm = TextEditingController();
  final cIn = TextEditingController();
  final rPt = TextEditingController();
  final rup = TextEditingController();

  void uploadBlog() {


    //addData(blogMap);


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

      DateTime now = new DateTime.now();
      DateTime date = new DateTime(now.year, now.month, now.day);

        FirebaseFirestore.instance.collection("Users").doc(vNo.text).set({
        "vehicleNumber": vNo.text,
        "registrationNumber": rNo.text,
        "vehicleType": Vty.text ,
        "ownerName" : oNm.text,
        "a" : cIn.text,
        "report": rPt.text,
        "price": rup.text,
        "date": date,
        "timestamp": now
      }
      );

    }

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Our ",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "Project",
              style: TextStyle(fontSize: 22, color: Colors.blue),
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: _isLoading
          ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
          : Center(
        child: ListView(
          /*shrinkWrap: true,*/
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            Center(
              child: Card(
                elevation: 8.0,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: vNo,
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
                          labelText: "Vehicle type",
                        ),

                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        controller: oNm,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          labelText: "Owner Name",
                        ),
                          keyboardType: TextInputType.name,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                            LengthLimitingTextInputFormatter(7),
                          ]


                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    TextFormField(
                        controller: cIn,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: "Contact Info",

                        ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            LengthLimitingTextInputFormatter(10),
                        ]
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

                      TextFormField(
                        controller: rup,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.money),
                          labelText: "Price",
                        ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            LengthLimitingTextInputFormatter(7),
                          ]

                      ), SizedBox(
                        height: 15.0,
                      ),


                      SizedBox(
                        height: 15.0,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(30.0),
                        //elevation: 5.0,
                        child: MaterialButton(
                          onPressed: () => {

                            checkTextFieldEmptyOrNot()
                          },

                          height: 50.0,
                          color: Colors.black87,
                          child: Text(
                            "Upload",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}


