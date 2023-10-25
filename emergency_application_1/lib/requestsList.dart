import 'package:emergency_application_1/request.dart';
import 'package:flutter/material.dart';

class RequestsList extends StatelessWidget {
  const RequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text("Request"),
        centerTitle: true,
      ),
      body: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.indigo.shade300)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(services[index],
                      style: TextStyle(
                          color: Colors.indigo.shade300, fontSize: 20)),
                  Text(
                    "State",
                    style:
                        TextStyle(color: Colors.indigo.shade300, fontSize: 20),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 5);
          },
          itemCount: services.length),
    );
  }
}
