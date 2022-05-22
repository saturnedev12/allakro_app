import 'package:allakroapp/features/actor_page/actor_page.dart';
import 'package:flutter/material.dart';

class ActivyCard extends StatelessWidget {
  ActivyCard({
    Key? key,
    required this.name,
    required this.members,
  }) : super(key: key);
  String name;
  int members;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActorPage(
                activity: name,
              ),
            ));
      },
      child: Card(
        elevation: 1,
        child: Container(
          height: 100,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.people_alt_rounded),
                      Text('$members personnes pratique cette activité')
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
