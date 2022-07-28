import 'package:flutter/material.dart';

class OpenNotificationScreen extends StatelessWidget {
  final String? label;
   OpenNotificationScreen({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios , color: Colors.black,)),
      title: Text('My Task', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello , Mohamed Maher' , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold , color: Colors.teal),),
            SizedBox(height: 15,),
            Text('You have a new reminder' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold , color: Colors.teal),),
            SizedBox(height: 15,),
            Text('lets check it :)' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold , color: Colors.teal),),
            SizedBox(height: 15,),


            Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
              ),
            child: Center(
              child: Padding(
                 padding:EdgeInsets.only(left: 20),

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.description_rounded , color: Colors.white,size: 30,),
                        SizedBox(width: 30,),
                        Text(this.label.toString().split("|")[0] , style: TextStyle(color: Colors.white , fontSize: 20),),

                      ],
                    ),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Icon(Icons.calendar_month_rounded,color: Colors.white,size: 30),
                        SizedBox(width: 30,),

                        Text(this.label.toString().split("|")[1] , style: TextStyle(color: Colors.white , fontSize: 20),),

                      ],
                    ),

                  ],
                ),
              ),
            ),
    ),
          ],
        ),
      ));
  }
}
