import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projek/core/utils/constant_color.dart';
import 'package:projek/core/utils/enums.dart';

class TabNavCategory extends StatefulWidget {
  final Function(int) onTabSelected; // Callback to return selected index

  const TabNavCategory({
    super.key,
    required this.onTabSelected, // Required callback parameter
  });

  @override
  _TabNavCategoryState createState() => _TabNavCategoryState();
}

class _TabNavCategoryState extends State<TabNavCategory> {
  // int selectedIndex = 0; // Track the selected index?
  BookCategory selectedCategory = BookCategory.fiksi; // Track the selected category

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTabButton('Fiksi', BookCategory.fiksi),
            _buildTabButton('Non-FIksi', BookCategory.nonFiksi),
            _buildTabButton('Teknologi', BookCategory.Teknologi),
            _buildTabButton('Pendidikan', BookCategory.pendidikan),
            _buildTabButton('Hobi', BookCategory.hobi),
          ],
        ),
      ),
    );
  }

  // Helper method to build each tab button
  Widget _buildTabButton(String text, BookCategory category) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedCategory = category; 
          log('Index category : $category');
        });
        widget.onTabSelected(category.index); // Return the selected category via callback
      },
      child: Text(
        text,
        style: TextStyle(
          color: selectedCategory == category
              ? ConstantColor.primary
              : ConstantColor.dark, // Highlight if selected
        ),
      ),
    );
  }
}
