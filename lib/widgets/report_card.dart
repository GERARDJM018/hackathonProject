import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon2024/auth/auth.dart';
import 'package:hackathon2024/buttons/style_one.dart';
import 'package:hackathon2024/buttons/style_two.dart';

class ReportCard extends StatefulWidget {
  final String reportId;
  final String title;
  final String body;
  const ReportCard({
    required this.reportId,
    required this.title,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  _ReportCardState createState() => _ReportCardState();

}

class _ReportCardState extends State<ReportCard> {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  late User? user = Auth(_firebaseAuth).currentUser;

  bool isLiked = false;

  List<dynamic> likes = [];

  _loadDatabase() async {
    final snap = await FirebaseFirestore.instance
        .collection('reports')
        .doc(widget.reportId)
        .get();


    likes = snap['likes'];

    if (likes.contains(user!.email)) {
      isLiked = true;
    } else {
      isLiked = false;
    }


    setState(() {
      
    });
  }

  void _like() async {
    print("asdd");
    await FirebaseFirestore.instance
      .collection('reports')
      .doc(widget.reportId)
      .update({
        'likes': FieldValue.arrayUnion([user!.email]),
      });

    _loadDatabase();  

    setState(() {
      
    });
  }

  void _unLike() async {
    await FirebaseFirestore.instance
      .collection('reports')
      .doc(widget.reportId)
      .update({
        'likes': FieldValue.arrayRemove([user!.email]),
      });

    _loadDatabase();

    setState(() {
      
    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {},
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
<<<<<<< HEAD
              child: Text(widget.title, style: TextStyle(fontSize: 24),),
            ), 
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.body, maxLines: 4, softWrap: true,),
              )), 
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: StyleOne(
                  icon: Icon(Icons.arrow_upward, 
                    color: isLiked
                      ?Colors.blueAccent
                      :Colors.black,), 
                  counter: likes.length.toString(), 
                  func: isLiked ?() async {_unLike();} :() async {_like();},),
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
                )]),
=======
              child: Text(
                "Title",
                style: TextStyle(fontSize: 24),
              ),
              color: Colors.white,
            ),
            Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Body ",
                    maxLines: 4,
                    softWrap: true,
                  ),
                )),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: StyleOne(
                    icon: Icon(Icons.arrow_upward),
                    counter: "12",
                    func: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: StyleTwo(
                    icon: Icon(Icons.arrow_downward),
                    func: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: StyleTwo(
                      func: () {},
                      icon: Icon(
                        Icons.dangerous,
                        color: Colors.red,
                      )),
                ),
              ],
            ),
>>>>>>> f88d19daf2600cfff159a710f3726d137af5a0f5
          ],
        ),
      ),
    );
  }
}
