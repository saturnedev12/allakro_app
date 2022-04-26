import 'package:allakroapp/features/admin/admin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../gen/assets.gen.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List<Map<String, dynamic>> _data = [
    {
      'icon': Assets.iconsSvg.actorsNav.svg(),
      'text':
          'Chercher, découvez, et contactez plusieurs acteur a travers le village avec une grande facilité',
    },
    {
      'icon': Assets.iconsSvg.activityNav.svg(),
      'text':
          'Trouvez facilement les activités pratiqué dans le village et les acteur qui y sont rattaché',
    },
    {
      'icon': Assets.iconsSvg.actualityNav.svg(),
      'text':
          'Suivez toute les actualités et opportunités du village à tout moment',
    },
    {
      'icon': Assets.iconsSvg.illsNav.svg(),
      'text':
          'Gardez un eil sur le niveau de propagation des maladies et épidement ou pendémi du village',
    },
    {
      'icon': Assets.iconsSvg.healthsNav.svg(),
      'text':
          '''Trouvez facilement des centre de santés a proximité du village tout en vérifiant s'ils sont de garde ''',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Allakro',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          CupertinoButton(
              child: Icon(
                CupertinoIcons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminPage(),
                    ),
                    (route) => false);
              })
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          //padding: EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              Stack(
                children: [
                  ImageSlideshow(
                    /// Width of the [ImageSlideshow].
                    width: double.infinity,

                    /// Height of the [ImageSlideshow].
                    height: 220,

                    /// The page to show when first creating the [ImageSlideshow].
                    initialPage: 0,

                    /// The color to paint the indicator.
                    indicatorColor: Colors.white,

                    /// The color to paint behind th indicator.
                    indicatorBackgroundColor: Colors.grey,

                    /// The widgets to display in the [ImageSlideshow].
                    /// Add the sample image file into the images folder
                    children: [
                      for (var i = 1; i <= 6; i++)
                        Image.asset('assets/images/banner$i.jpeg')
                    ],

                    /// Called whenever the page in the center of the viewport changes.
                    onPageChanged: (value) {
                      // print('Page changed: $value');
                    },

                    /// Auto scroll interval.
                    /// Do not auto scroll with null or 0.
                    autoPlayInterval: 3000,

                    /// Loops back to first slide.
                    isLoop: true,
                  ),
                  Container(
                    width: double.infinity,
                    height: 220,
                    color: Color.fromARGB(106, 149, 149, 149),
                    child: Center(
                      child: Text(
                        'Bienvenu à Allakro',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 800,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  children: _data
                      .map(
                        (e) => Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              CircleAvatar(
                                radius: 40,
                                backgroundColor:
                                    const Color.fromARGB(255, 220, 245, 221),
                                child: e['icon'],
                              ),
                              Text(
                                e['text'],
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
