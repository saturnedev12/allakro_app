import 'package:allakroapp/shared_widgets/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DomicileCard extends StatelessWidget {
  DomicileCard({
    Key? key,
    required this.name,
    required this.address,
    required this.nameOwner,
    required this.dateLayout,
    required this.dateMove,
    required this.statut,
    required this.contactOwner,
    required this.description,
  }) : super(key: key);
  String name;
  String address;
  String nameOwner;
  DateTime? dateMove;
  DateTime? dateLayout;
  String statut;
  String contactOwner;
  String description;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 20),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  backgroundColor: Colors.redAccent,
                  label: Text(
                    name,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Icon(
                  CupertinoIcons.house_fill,
                ),
              ],
            ),
            Text(
              nameOwner,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Row(
              children: [
                const Icon(
                  CupertinoIcons.location,
                  color: Colors.grey,
                ),
                Text(
                  address,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(CupertinoIcons.person_crop_circle),
                RichText(
                    text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Propriétaire: ',
                    ),
                    TextSpan(
                      text: nameOwner,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ))
              ],
            ),
            (dateLayout != null)
                ? Row(
                    children: [
                      Icon(CupertinoIcons.calendar),
                      RichText(
                          text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Date aménagement: ',
                          ),
                          TextSpan(
                            text: Constantes.dateFormat.format(dateLayout!),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))
                    ],
                  )
                : const SizedBox(),
            (dateMove != null)
                ? Row(
                    children: [
                      const Icon(CupertinoIcons.calendar),
                      RichText(
                          text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Date précédent déménagement: ',
                          ),
                          TextSpan(
                            text: Constantes.dateFormat.format(dateMove!),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))
                    ],
                  )
                : const SizedBox(),
            Row(
              children: [
                Icon(CupertinoIcons.phone),
                RichText(
                    text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Contact: ',
                    ),
                    TextSpan(
                      text: contactOwner,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ))
              ],
            ),
            Text(
              description,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
