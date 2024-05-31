import 'package:flutter/material.dart';
import 'package:hackathon2024/buttons/style_one.dart';
import 'package:hackathon2024/buttons/style_two.dart';

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
    return InkWell(
      onTap: (){},
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text("Title", style: TextStyle(fontSize: 24),),
                color: Colors.white,
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
              Container(
                padding: const EdgeInsets.all(4.0),
                child: StyleOne(icon: Icon(Icons.arrow_upward), counter: "12", func: () {},),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 209, 201, 201),
                  ),)
              ),
              Container(
                padding: const EdgeInsets.all(4.0),
                child: StyleTwo(icon: Icon(Icons.arrow_downward), func: () {},),
              ),
              Container(
                padding: const EdgeInsets.all(4.0),
                child: StyleTwo(
                  func: () {},
                  icon: Icon(Icons.dangerous, color: Colors.red,)
                  ),
              ),
              ],),
            ],
          ),
        ),
    );
  }
}
