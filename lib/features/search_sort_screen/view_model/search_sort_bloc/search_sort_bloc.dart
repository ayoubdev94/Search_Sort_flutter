import 'package:bloc/bloc.dart';
import 'package:flutter_x/features/search_sort_screen/data/model/item_model.dart';

part 'search_sort_event.dart';
part 'search_sort_state.dart';

class SearchSortBloc extends Bloc<SearchSortEvent, SearchSortState> {
  final List<Item> allItems; // Assume this is fetched from a data source

  SearchSortBloc(this.allItems)
      : super(SearchSortState(
            items: allItems, query: '', criteria: SortCriteria.name)) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<SortCriteriaChanged>(_onSortCriteriaChanged);
  }

  void _onSearchQueryChanged(
      SearchQueryChanged event, Emitter<SearchSortState> emit) {
    final filteredItems = allItems
        .where((item) =>
            item.name.toLowerCase().contains(event.query.toLowerCase()) ||
            item.price.toString().contains(event.query.toString()))
        .toList();
    emit(state.copyWith(items: filteredItems, query: event.query));
  }

  void _onSortCriteriaChanged(
      SortCriteriaChanged event, Emitter<SearchSortState> emit) {
    final sortedItems = List<Item>.from(state.items);
    sortedItems.sort((firstItem, secondItem) {
      switch (event.criteria) {
        case SortCriteria.name:
          return firstItem.name.compareTo(secondItem.name);
        /*  case SortCriteria.date:
          return firstItem.date.compareTo(secondItem.date); */
        case SortCriteria.price:
          return firstItem.price.compareTo(secondItem.price);
        default:
          return 0;
      }
    });
    emit(state.copyWith(items: sortedItems, criteria: event.criteria));
  }
}
