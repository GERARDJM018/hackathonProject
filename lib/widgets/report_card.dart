import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final String title;
  final String body;
  const ReportCard({
    required this.title,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: const Color.fromARGB(-1, 206, 214, 244),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Title", style: TextStyle(fontSize: 24),),
          ), 
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Body ", maxLines: 4, softWrap: true,),
            )), 
          Row(children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_upward)
              ),
            Text("12"),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_downward)
              ),
            TextButton(
              onPressed: (){}, 
              child: Text("Read Full"), 
              style: TextButton.styleFrom(
                backgroundColor: Colors.white, 
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width * 0.5)
                ),
              ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.dangerous, color: Colors.red,)
              ),
            ],),
          ],
        ),
      );
  }
}