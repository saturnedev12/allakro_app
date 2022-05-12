import 'package:flutter/material.dart';

class IllnessCard extends StatelessWidget {
  IllnessCard({
    Key? key,
    required this.name,
    required this.description,
    required this.status,
    required this.nbAffected,
    required this.nbHealed,
  }) : super(key: key);
  String name;
  String status;
  String description;
  int nbAffected;
  int nbHealed;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
          //height: 150,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.redAccent,
                    label: Text(
                      status,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                (description),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.people_rounded),
                  Text('$nbAffected atteints $nbHealed guéries'),
                ],
              ),
            ],
          )),
    );
  }
}
