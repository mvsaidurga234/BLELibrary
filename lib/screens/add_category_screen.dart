import 'package:flutter/material.dart';
import '../data/word_data.dart';

class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _categoryController = TextEditingController();
  final _wordsController = TextEditingController();

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final name = _categoryController.text.trim();
      final words = _wordsController.text
          .split(',')
          .map((w) => w.trim().toLowerCase())
          .where((w) => w.isNotEmpty)
          .toList();

      await WordRepository.addCategory(name, words);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Category")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: "Category"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter a name" : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _wordsController,
                maxLines: 4,
                decoration: InputDecoration(
                    labelText: "Words (comma-separated)",
                    hintText: "e.g. tiger, lion, bear"),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? "Add words" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _save, child: Text("Save Category")),
            ],
          ),
        ),
      ),
    );
  }
}
