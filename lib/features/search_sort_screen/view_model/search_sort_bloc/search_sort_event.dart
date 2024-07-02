part of 'search_sort_bloc.dart';

abstract class SearchSortEvent {}

class SearchQueryChanged extends SearchSortEvent {
  final String query;
  SearchQueryChanged(this.query);
}

class SortCriteriaChanged extends SearchSortEvent {
  final SortCriteria criteria;
  SortCriteriaChanged(this.criteria);
}

enum SortCriteria { name, price }
