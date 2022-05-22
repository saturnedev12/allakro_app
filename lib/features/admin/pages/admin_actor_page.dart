import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../models/actor_model.dart';
import '../../../repository/actor_repository.dart';
import '../forms/admin_activity_form.dart';

class AdminActorsPage extends StatefulWidget {
  const AdminActorsPage({Key? key}) : super(key: key);

  @override
  State<AdminActorsPage> createState() => _AdminActorsPageState();
}

class _AdminActorsPageState extends State<AdminActorsPage> {
  static const _pageSize = 4;

  final PagingController<int, ActorModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ActorRepository()
          .getAllActuality(perPage: _pageSize, page: pageKey);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Administration des Activités",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.add))
          ],
        ),
      ),
      Expanded(
        child: PagedListView<int, ActorModel>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<ActorModel>(
            firstPageProgressIndicatorBuilder: (context) =>
                CupertinoActivityIndicator(color: Colors.green),
            newPageProgressIndicatorBuilder: (context) =>
                const CupertinoActivityIndicator(color: Colors.green),
            animateTransitions: true,
            itemBuilder: (context, item, index) => ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminActivityForm(),
                    )),
                minVerticalPadding: 30,
                title: Text(item.nom),
                trailing: CupertinoButton(
                    child: const Icon(
                      CupertinoIcons.delete,
                      color: Colors.black,
                    ),
                    onPressed: () {})),
          ),
        ),
      ),
    ]));
  }
}
