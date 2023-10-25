// ignore: unnecessary_import
import 'package:emergency_application_1/requestsList.dart';
import 'package:flutter/material.dart';

List<String> services = [];

class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  TextEditingController serviceController = TextEditingController();
  String value = "Choose A Service";
  final formkey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text("Request"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField(
              borderRadius: BorderRadius.circular(10),
              key: formkey,
              validator: (value) {
                if (value == ("Choose A Service")) {
                  return "Choose a service first";
                }
                return null;
              },
              iconEnabledColor: Colors.indigo.shade300,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.indigo.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.indigo.shade300),
                ),
              ),
              isExpanded: true,
              style: TextStyle(color: Colors.indigo.shade300, fontSize: 20),
              elevation: 4,
              value: value,
              items: [
                ("Choose A Service"),
                ("Electricity"),
                ("Highway Accidents"),
                ("Fire"),
                ("Ambulance"),
                ("Police"),
              ]
                  .map(
                    (service) => DropdownMenuItem(
                      value: (service),
                      child: Text(
                        (service),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  value = newValue.toString();
                });
              },
            ),
            // TextField(
            //   controller: serviceController,
            //   decoration: const InputDecoration(
            //     hintText: "Servic Name",
            //     labelText: "Servic Name",
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(8)),
            //     ),
            //     isDense: true,
            //   ),
            // ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: " Name",
                labelText: " Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Phone",
                labelText: "Phone",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Address",
                labelText: "Address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo.shade300),
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  setState(() {
                    services.add(value);
                  });
                  serviceController.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RequestsList()));
                }
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
