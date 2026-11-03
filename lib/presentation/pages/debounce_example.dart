import 'dart:async';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Timer? _debounce;
  // debounce : prevent multiple unnecessary function calls,
  // until the user stops triggering an event for a specified duration

  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) {
      // isActive - means the timer still waiting to execute
      // true - the timer get cancel
      _debounce!.cancel();
    }

    _debounce = Timer(
      const Duration(seconds: 10),
      () {
        searchApi(value);
      },
    );
  }

  void searchApi(String query) {
    debugPrint("API called with: $query");
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextField(
        onChanged: onSearchChanged,
        decoration: const InputDecoration(
          hintText: 'Search here',
        ),
      ),
    );
  }
}
