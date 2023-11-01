import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({super.key});

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? _selectedGroup;
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
  TextEditingController _donorName = TextEditingController();
  TextEditingController _donorMobile = TextEditingController();
  void updateDonor(docId) {
    final data = {
      'name': _donorName.text,
      'mobile': _donorMobile.text,
      'bloodgroup': _selectedGroup
    };
    donor.doc(docId).update(data).then((value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    _donorName.text = args['name'];
    _donorMobile.text = args['mobile'];
    _selectedGroup = args['bloodgroup'] as String;
    final docId = args['id'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Update User"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _donorName,
              decoration: InputDecoration(
                  label: Text("Donor Name"), border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _donorMobile,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  label: Text("Mobile Number"), border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: DropdownButtonFormField(
                value: _selectedGroup as String,
                decoration:
                    const InputDecoration(label: Text("Select Blood Group")),
                items: bloodGroups
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  _selectedGroup = val as String;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                updateDonor(docId);
              },
              style: const ButtonStyle(
                  minimumSize:
                      MaterialStatePropertyAll(Size(double.infinity, 50)),
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              child: const Text(
                "Update",
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
