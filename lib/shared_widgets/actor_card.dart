import 'package:allakroapp/features/actor_page/pages/detail_actor.dart';
import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  ActorCard({Key? key}) : super(key: key);
  TextStyle _titleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  TextStyle subTitleStyle = TextStyle(
    fontSize: 15,
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailActor(),
            ));
      },
      child: Card(
        elevation: 1,
        child: Container(
          padding: EdgeInsets.all(8),
          //color: Colors.red,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.person_rounded,
                  size: 40,
                ),
                radius: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Jane Cooper',
                          style: _titleTextStyle,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'voir plus',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                ),
                              ],
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work_rounded,
                          size: 20,
                        ),
                        Text(
                          'couturier',
                          style: subTitleStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.mail_rounded,
                          size: 20,
                        ),
                        Text('texte.teste@gmail.com'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_rounded,
                          size: 20,
                        ),
                        Text('01 33 44 66 88 77'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
