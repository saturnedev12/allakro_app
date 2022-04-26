import 'package:allakroapp/features/admin/pages/admin_activity.dart';
import 'package:allakroapp/features/admin/pages/admin_actor_page.dart';
import 'package:allakroapp/features/admin/pages/admin_actuality_page.dart';
import 'package:allakroapp/features/admin/pages/admin_diseases_pages.dart';
import 'package:allakroapp/features/admin/pages/admin_health_center_page.dart';
import 'package:flutter/widgets.dart';

import '../../../activity_page/activity_page.dart';

abstract class AdminState {}

class PaginationAdminStte extends AdminState {
  int pageNumber;
  List<String> namesPage = [
    '',
    'Activités',
    'Acteurs',
    'Actualité',
    'Maladies',
    'Centre de santé',
  ];
  Map<String, Widget> pages = {
    'toto': Container(),
    'Activités': AdminActivity(),
    'Acteurs': AdminActorsPage(),
    'Actualité': AdminActualityPage(),
    'Maladies': AdminDiseasesPage(),
    'Centre de santé': AdminHealthCenterPage(),
  };
  Widget tagetPage;
  PaginationAdminStte({required this.pageNumber, required this.tagetPage});
}
