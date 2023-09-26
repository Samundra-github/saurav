// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../resource/theme/colors.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          TextFormField(
            controller: searchController,
            enableSuggestions: false,
            decoration: InputDecoration(
                filled: true,
                fillColor: searchBackground,
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: borderTextFormField,
                  size: 30,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.tune,
                    color: textColor,
                    size: 30,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(width: 2, color: searchBackground),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(width: 2, color: searchBackground),
                ),
                labelText: 'Search',
                labelStyle: const TextStyle(color: borderTextFormField)),
          ),
        ],
      ),
    );
  }
}
