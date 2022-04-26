import 'package:allakroapp/features/actor_page/actor_page.dart';
import 'package:flutter/material.dart';

class ActivyCard extends StatelessWidget {
  const ActivyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActorPage(),
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
                    'Couture',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.people_alt_rounded),
                      Text('35 personnes pratique cette activité')
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
