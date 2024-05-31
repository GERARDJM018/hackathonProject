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
<<<<<<< HEAD
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color.fromARGB(77, 137, 137, 137), width: 1.5),
          bottom:
              BorderSide(color: Color.fromARGB(61, 132, 132, 132), width: 1.5),
        ),
      ),
      child: Card(
        margin: const EdgeInsets.all(0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        color: const Color.fromARGB(255, 255, 255, 255),
=======
    // TODO: implement build
    return InkWell(
      onTap: (){},
      child: Card(
        color: const Color.fromARGB(-1, 206, 214, 244),
>>>>>>> branch-button
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
<<<<<<< HEAD
              padding: EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    body,
                    maxLines: 4,
                    softWrap: true,
                  ),
                )),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_upward)),
                Text("12"),
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_downward)),
                TextButton(
                  onPressed: () {},
                  child: Text("Read Full"),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: Size.fromWidth(
                          MediaQuery.of(context).size.width * 0.5)),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.dangerous,
                      color: Color.fromARGB(255, 2, 2, 2),
                    )),
              ],
            ),
          ],
        ),
      ),
=======
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
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: StyleOne(icon: Icon(Icons.arrow_upward), counter: "12", func: () {},),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: StyleTwo(icon: Icon(Icons.arrow_downward), func: () {},),
              ),
              Padding(
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
>>>>>>> branch-button
    );
  }
}
