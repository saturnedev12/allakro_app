import 'package:allakroapp/features/actuality_page/pages/read_page.dart';
import 'package:allakroapp/shared_widgets/constantes.dart';
import 'package:flutter/material.dart';

class ActualityCard extends StatelessWidget {
  ActualityCard({
    Key? key,
    required this.title,
    required this.datePubli,
    required this.publisher,
    required this.type,
    required this.vews,
    required this.text,
  }) : super(key: key);
  String title;
  String type;
  String publisher;
  int vews;
  DateTime datePubli;
  String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReadPage(
                title: title,
                type: type,
                publisher: publisher,
                vews: vews,
                datePubli: Constantes.dateFormat.format(datePubli),
                text: text,
              ),
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
                          Constantes.dateFormat.format(datePubli),
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            //fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Chip(
                              padding: EdgeInsets.all(1),
                              //labelPadding: EdgeInsets.all(1),
                              backgroundColor: Colors.grey,
                              label: Text(
                                type,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              )),
                        )
                      ],
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      publisher,
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
                            trailing:
                                Text('${(vews >= 100) ? '+100' : vews} vues'),
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
