import 'package:allakroapp/features/actuality_page/pages/read_page.dart';
import 'package:flutter/material.dart';

class ActualityCard extends StatelessWidget {
  const ActualityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReadPage(),
            ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Container(
          padding: EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          height: 140,
          child: Row(
            children: [
              Container(
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: Colors.grey[100],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/newspapers.jpeg'),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '03/04/2022',
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Chip(
                            padding: EdgeInsets.all(1),
                            //labelPadding: EdgeInsets.all(1),
                            backgroundColor: Colors.grey,
                            label: Text(
                              'opportunité',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ))
                      ],
                    ),
                    Text(
                      'LA MAIRIE RECHECHE UN AGENT D’ENTRETIENT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      'Anonce de: la mairie',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 28,
                          child: ListTile(
                            dense: true,
                            leading: Icon(Icons.remove_red_eye),
                            trailing: Text('100 vues'),
                          ),
                        ),
                      ],
                    )
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
