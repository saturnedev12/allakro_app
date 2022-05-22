import 'package:allakroapp/models/actor_model.dart';
import 'package:allakroapp/models/actuality_model.dart';
import 'package:allakroapp/repository/actor_repository.dart';
import 'package:allakroapp/shared_widgets/actor_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ActorPage extends StatefulWidget {
  ActorPage({Key? key, this.activity}) : super(key: key);
  String? activity;
  @override
  State<ActorPage> createState() => _ActorPageState();
}

class _ActorPageState extends State<ActorPage> {
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
      final newItems = (widget.activity == null)
          ? await ActorRepository()
              .getAllActuality(perPage: _pageSize, page: pageKey)
          : await ActorRepository().getAllActuality(
              perPage: _pageSize, page: pageKey, activity: widget.activity);
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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Acteurs ${widget.activity ?? ''}')),
        body: SafeArea(
          child: RefreshIndicator(
            color: Colors.green,
            onRefresh: () async {
              _pagingController.refresh();
              await Future.delayed(const Duration(seconds: 1));
            },
            child: PagedListView<int, ActorModel>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<ActorModel>(
                firstPageProgressIndicatorBuilder: (context) =>
                    const CupertinoActivityIndicator(color: Colors.green),
                newPageProgressIndicatorBuilder: (context) =>
                    const CupertinoActivityIndicator(color: Colors.green),
                animateTransitions: true,
                itemBuilder: (context, item, index) => ActorCard(
                  name: item.nom,
                  email: item.email,
                  activity: item.profession,
                  number: item.telephone,
                  actor: item,
                ),
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

/*class ActorPage extends StatelessWidget {
  const ActorPage({Key? key}) : super(key: key);
  static List<Person> people = [
    Person('Mike', 'Barron', 64),
    Person('Todd', 'Black', 30),
    Person('Ahmad', 'Edwards', 55),
    Person('Anthony', 'Johnson', 67),
    Person('Annette', 'Brooks', 39),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acteurs'),
        centerTitle: false,
        actions: [
          CupertinoButton(
            child: const Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
            onPressed: () => showSearch(
              context: context,
              delegate: SearchPage<Person>(
                searchStyle: TextStyle(color: Colors.black),
                barTheme: ThemeData(
                  textSelectionTheme: TextSelectionThemeData(
                    cursorColor: Colors.black,
                    // selectionColor: darkPrimarySwatchColor,
                    // selectionHandleColor: darkPrimarySwatchColor,
                  ),
                  brightness: Brightness.light,
                  inputDecorationTheme: InputDecorationTheme(
                      prefixStyle: TextStyle(
                        color: Colors.black,
                      ),
                      filled: false,
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 87, 86, 86),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      /*enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),*/
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none)),
                  appBarTheme: AppBarTheme(
                    textTheme: TextTheme(),
                    toolbarTextStyle: TextStyle(color: Colors.black),
                    iconTheme: IconThemeData(color: Colors.black),
                    //color: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                ),
                onQueryUpdate: (s) => print(s),
                items: people,
                searchLabel: 'Rechercher acteurs...',
                suggestion: Center(
                  child: Text('Filter people by name, surname or age'),
                ),
                failure: Center(
                  child: Text('No person found :('),
                ),
                filter: (person) => [
                  person.name,
                  person.surname,
                  person.age.toString(),
                ],
                builder: (person) => ListTile(
                  title: Text(person.name),
                  subtitle: Text(person.surname),
                  trailing: Text('${person.age} yo'),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              for (var i = 0; i < 10; i++) ActorCard(),
            ],
          ),
        ),
      ),
    );
  }
}
*/