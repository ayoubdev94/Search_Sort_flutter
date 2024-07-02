part of 'search_sort_bloc.dart';

class SearchSortState {
  final List<Item> items;
  final String query;
  final SortCriteria criteria;

  SearchSortState({
    required this.items,
    required this.query,
    required this.criteria,
  });

  SearchSortState copyWith({
    List<Item>? items,
    String? query,
    SortCriteria? criteria,
  }) {
    return SearchSortState(
      items: items ?? this.items,
      query: query ?? this.query,
      criteria: criteria ?? this.criteria,
    );
  }
}
