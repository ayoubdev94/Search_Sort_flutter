import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x/core/theme/app_styles.dart';
import 'package:flutter_x/features/search_sort_screen/data/model/item_model.dart';
import 'package:flutter_x/features/search_sort_screen/view_model/search_sort_bloc/search_sort_bloc.dart';

class SearchSortScreen extends StatefulWidget {
  @override
  _SearchSortScreenState createState() => _SearchSortScreenState();
}

class _SearchSortScreenState extends State<SearchSortScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search and Sort'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchInput(),
          _buildSortDropdown(),
          _buildItemsList(),
        ],
      ),
    );
  }

  Widget _buildSearchInput() {
    TextEditingController searchItemsController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchItemsController,
        onChanged: (query) =>
            context.read<SearchSortBloc>().add(SearchQueryChanged(query)),
        decoration: AppStyles.inputDecoration.copyWith(
          hintText: 'Search items...',
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              searchItemsController.clear();
              context.read<SearchSortBloc>().add(SearchQueryChanged(""));
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSortDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey[200], // Example background color
          border: Border.all(color: Colors.grey[400]!), // Example border color
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: DropdownButton<SortCriteria>(
          value: SortCriteria.name,
          onChanged: (criteria) => context
              .read<SearchSortBloc>()
              .add(SortCriteriaChanged(criteria!)),
          items: [
            DropdownMenuItem(
              value: SortCriteria.name,
              child: Text('Sort by name'),
            ),
            DropdownMenuItem(
              value: SortCriteria.price,
              child: Text('Sort by price'),
            ),
          ],
          underline: SizedBox(), // Remove default underline
          style: TextStyle(color: Colors.black87), // Example text style
          icon: Icon(Icons.arrow_drop_down), // Example icon
        ),
      ),
    );
  }

  Widget _buildItemsList() {
    return Expanded(
      child: BlocConsumer<SearchSortBloc, SearchSortState>(
        listener: (context, state) {
          // Add listener logic if needed
        },
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];
              return _buildListItem(item);
            },
          );
        },
      ),
    );
  }

  Widget _buildListItem(Item item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(item.name),
        subtitle: Text('Price: \$${item.price.toStringAsFixed(2)}'),
        // Add onTap or additional widget customization as needed
      ),
    );
  }
}
