import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebasePage extends StatefulWidget {
  @override
  _FirebasePageState createState() => _FirebasePageState();
}

class _FirebasePageState extends State<FirebasePage> {
  final dummySnapshot = [
    {"name": "Filip", "votes": 15},
    {"name": "Abraham", "votes": 14},
    {"name": "Richard", "votes": 11},
    {"name": "Ike", "votes": 10},
    {"name": "Justin", "votes": 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Baby Name Votes')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('baby').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        }

        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.only(top: 20.0),
          children:
              snapshot.map((data) => _buildListItem(context, data)).toList(),
        ),
        Positioned(
            bottom: 1,
            left: 1,
            right: 1,
            child: TextButton(
                onPressed: () {
                  for (var element in snapshot) {
                    var record = Record.fromSnapshot(element);
                    record.reference.update(({'votes': 0}));
                  }
                },
                child: Text("Reset Votes"))),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.votes.toString()),
          onTap: () =>
              record.reference.update({'votes': FieldValue.increment(1)}),
        ),
      ),
    );
  }
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
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}
