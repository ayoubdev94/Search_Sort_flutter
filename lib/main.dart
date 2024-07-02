import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x/features/search_sort_screen/data/model/item_model.dart';
import 'package:flutter_x/features/search_sort_screen/data/repo/search_sort_repo.dart';
import 'package:flutter_x/features/search_sort_screen/view/search_sort_screen.dart';
import 'package:flutter_x/features/search_sort_screen/view_model/search_sort_bloc/search_sort_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Item> sampleItems = SearchSortRepo.getItems();
    return BlocProvider(
      create: (context) => SearchSortBloc(sampleItems),
      child: MaterialApp(
        title: 'Search and Sort Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SearchSortScreen(),
      ),
    );
  }
}
