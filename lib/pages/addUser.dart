import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedGroup;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add User"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  label: Text("Donor Name"), border: OutlineInputBorder()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  label: Text("Mobile Number"), border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: DropdownButtonFormField(
                decoration:
                    const InputDecoration(label: Text("Select Blood Group")),
                items: bloodGroups
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  selectedGroup = val as String;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                  minimumSize:
                      MaterialStatePropertyAll(Size(double.infinity, 50)),
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
