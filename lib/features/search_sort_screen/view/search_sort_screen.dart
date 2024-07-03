import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x/core/theme/app_styles.dart';
import 'package:flutter_x/features/search_sort_screen/data/model/item_model.dart';
import 'package:flutter_x/features/search_sort_screen/view_model/search_sort_bloc/search_sort_bloc.dart';

class SearchSortScreen extends StatelessWidget {
  const SearchSortScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search and Sort'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchInput(context),
          _buildCategoryList(context),
          _buildItemsList(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                // Handle navigation
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchInput(BuildContext context) {
    TextEditingController searchItemsController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: searchItemsController,
        onChanged: (query) =>
            context.read<SearchSortBloc>().add(SearchQueryChanged(query)),
        decoration: AppStyles.inputDecoration.copyWith(
          hintText: 'Search items...',
          filled: true,
          fillColor: Colors.grey[200],
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.sort, color: Colors.grey[700]),
                onPressed: () {
                  _showSortModal(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.clear, color: Colors.grey[700]),
                onPressed: () {
                  searchItemsController.clear();
                  context.read<SearchSortBloc>().add(SearchQueryChanged(""));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: BlocBuilder<SearchSortBloc, SearchSortState>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.allCategories.map((category) {
                final bool isSelected = category == state.selectedCategory;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (_) {
                      context
                          .read<SearchSortBloc>()
                          .add(CategoryChanged(category));
                    },
                    selectedColor: Colors.blue,
                    backgroundColor: Colors.grey[200],
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  void _showSortModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.sort_by_alpha),
                title: const Text('Sort by name (A-Z)'),
                onTap: () {
                  context
                      .read<SearchSortBloc>()
                      .add(SortCriteriaChanged(SortCriteria.nameAsc));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.sort_by_alpha_outlined),
                title: const Text('Sort by name (Z-A)'),
                onTap: () {
                  context
                      .read<SearchSortBloc>()
                      .add(SortCriteriaChanged(SortCriteria.nameDesc));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.arrow_upward),
                title: const Text('Sort by price (Low to High)'),
                onTap: () {
                  context
                      .read<SearchSortBloc>()
                      .add(SortCriteriaChanged(SortCriteria.priceAsc));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.arrow_downward),
                title: const Text('Sort by price (High to Low)'),
                onTap: () {
                  context
                      .read<SearchSortBloc>()
                      .add(SortCriteriaChanged(SortCriteria.priceDesc));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItemsList() {
    return Expanded(
      child: BlocConsumer<SearchSortBloc, SearchSortState>(
        listener: (context, state) {
          // Add listener logic if needed
        },
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No items found',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }
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
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Text(
            item.name[0].toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(item.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: \$${item.price.toStringAsFixed(2)}'),
            Text('Category: ${item.category}',
                style: TextStyle(color: Colors.grey[600])),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          // Add your onTap logic here
        },
      ),
    );
  }
}
