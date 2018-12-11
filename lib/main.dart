import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final dummySnapshots = [
  {"name": "Tùng", "votes": 20},
  {"name": "Phước", "votes": 23},
  {"name": "Anh Duy", "votes": 24},
  {"name": "Ngọc", "votes": 23},
  {"name": "Anh Lôi", "votes": 27},
  {"name": "Chị Đại", "votes": 31},
  {"name": "Đại Ka", "votes": 33},
  {"name": "Anh Quốc Anh", "votes": 33},
  {"name": "Anh Tít", "votes": 28},
  {"name": "Anh Hoan", "votes": 28},
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Free Code School',
      home: MyHomePage(),
    );
  }
}

 class MyHomePage extends StatefulWidget {
   @override
   _MyHomePageState createState() {
     return _MyHomePageState();
   }
 }

 class _MyHomePageState extends State<MyHomePage> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text('Team Votes')),
       body: _buildBody(context),
     );
   }
 }

 Widget _buildBody(BuildContext context) {
   // TODO: get actual snapshot from Cloud Firestore
   return _buildList(context, dummySnapshots);
 }

 Widget _buildList(BuildContext context, List<Map> snapshot) {
   return ListView(
     padding: const EdgeInsets.only(top: 20.0),
     children: snapshot.map((data) => _buildListItem(context, data)).toList(),
   );
 }

 Widget _buildListItem(BuildContext context, Map data) {
   final record = Record.fromMap(data);

   return Padding(
     key: ValueKey(record.name),
     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
     child: Container(
       decoration: BoxDecoration(
         border: Border.all(color: Colors.blueGrey),
         borderRadius: BorderRadius.circular(5.0),
       ),
       child: ListTile(
         title: Text(record.name),
         trailing: Text(record.votes.toString()),
         onTap: () => print(record),
       ),
     ),
   );
 }

 class Record {
   final String name;
   final int votes;
   final DocumentReference reference;

   Record.fromMap(Map<String, dynamic> map, {this.reference})
   : assert(map['name'] != null),
   assert(map['votes'] != null),
   name = map['name'],
   votes = map['votes'];

   Record.fromSnapshot(DocumentSnapshot snapshot)
   :this.fromMap(snapshot.data, reference: snapshot.reference);

   @override
   String toString() => "Record<$name:$votes>";
 }