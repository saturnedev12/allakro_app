import 'package:allakroapp/app/app.dart';
import 'package:allakroapp/features/admin/bloc/admin_cubit.dart';
import 'package:allakroapp/features/admin/bloc/states/admin_state.dart';
import 'package:allakroapp/features/admin/pages/admin_activity.dart';
import 'package:allakroapp/features/main_container/main_container_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  GlobalKey<ScaffoldState> _scaffOldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: <BlocProvider>[
          BlocProvider<AdminPaginationCubit>(
              create: (_) => AdminPaginationCubit()),
        ],
        child: BlocBuilder<AdminPaginationCubit, AdminState>(
            builder: (context, state) => (state is PaginationAdminStte)
                ? Scaffold(
                    key: _scaffOldKey,
                    appBar: AppBar(
                      title: Text('Administration'),
                      actions: [
                        CupertinoButton(
                            child: Icon(
                              CupertinoIcons.home,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainContainer(),
                                  ),
                                  (route) => false);
                            })
                      ],
                    ),
                    drawer: Drawer(
                      child: ListView.separated(
                        itemCount: 6,
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.black,
                        ),
                        itemBuilder: (context, index) => (index == 0)
                            ? DrawerHeader(
                                decoration: BoxDecoration(
                                    //color: Colors.blue,
                                    ),
                                child: Text('Drawer Header'),
                              )
                            : ListTile(
                                selected: state.pageNumber == index,
                                selectedColor: Colors.green,
                                title: Text(state.namesPage[index]),
                                onTap: () {
                                  context
                                      .read<AdminPaginationCubit>()
                                      .upgatePage(
                                          page: index,
                                          targetPage: state
                                              .pages[state.namesPage[index]]!);
                                  // Update the state of the app.
                                  // ...
                                  _scaffOldKey.currentState!.openEndDrawer();
                                },
                              ),
                      ),
                    ),
                    body: state.tagetPage,
                  )
                : Container()));
  }
}
