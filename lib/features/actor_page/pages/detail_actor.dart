import 'package:allakroapp/models/actor_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailActor extends StatelessWidget {
  DetailActor({Key? key, required this.actor}) : super(key: key);
  ActorModel actor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Détail sur l'acteur"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 70,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  actor.nom,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Text('Téléphone'),
                  trailing: TextButton(
                    child: Text(
                      actor.telephone,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      launchUrlString("tel://${actor.telephone}"); //mailto
                    },
                  ),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Email'),
                  trailing: TextButton(
                    child: Text(
                      actor.email,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      launchUrlString("mailto:${actor.email}"); //mailto
                    },
                  ),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Profession'),
                  trailing: Text(actor.profession),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Age'),
                  trailing: Text('${actor.age} ans'),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Genre'),
                  trailing: Text(actor.civilite),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Pays de naissance'),
                  trailing: Text(actor.paysNaissance),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Nationnalité'),
                  trailing: Text(actor.nationnalite),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Situation matrimonial'),
                  trailing: Text(actor.matrimoniale),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text("Niveau d'étude"),
                  trailing: Text(actor.niveauEtude),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Deuxieme Profession'),
                  trailing: Text(actor.profession2),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Enfant ?'),
                  trailing: Text(actor.enfants),
                  dense: true,
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  title: Text("Nombre d'enfant"),
                  trailing: Text(actor.nbEnfant),
                  dense: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
