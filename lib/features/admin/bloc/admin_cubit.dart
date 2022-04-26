import 'package:allakroapp/features/admin/bloc/states/admin_state.dart';
import 'package:allakroapp/features/admin/pages/admin_activity.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

class AdminPaginationCubit extends Cubit<AdminState> {
  AdminPaginationCubit()
      : super(PaginationAdminStte(pageNumber: 1, tagetPage: AdminActivity()));
  void upgatePage({required int page, required Widget targetPage}) {
    emit(PaginationAdminStte(pageNumber: page, tagetPage: targetPage));
  }
}
