import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [const SizedBox.shrink()];
  }

  @override
  Widget buildLeading(BuildContext context) {
     
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    
    return const Text('Hedssdllo');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
     
    return const Text('Hrew');
  }
}
