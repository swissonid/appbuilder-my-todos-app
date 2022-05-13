import 'package:flutter/material.dart';
import 'package:my_todos_core/core.dart';

class MyNewTodoPage extends StatefulWidget {
  const MyNewTodoPage({Key? key}) : super(key: key);

  @override
  State<MyNewTodoPage> createState() => _MyNewTodoPageState();
}

class _MyNewTodoPageState extends State<MyNewTodoPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final _titleTextEditingController = TextEditingController();
  final _descriptionTextEditingController = TextEditingController();

  bool _validateForm() {
    final formState = _formKey.currentState;
    if (formState == null) return false;
    final formIsValid = formState.validate();
    return formIsValid;
  }

  void _saveAndPushBack(BuildContext context) {
    if (!_validateForm()) return;
    final newTodoItem = TodoItem(
      title: _titleTextEditingController.value.text,
      description: _descriptionTextEditingController.value.text,
    );
    Navigator.of(context).pop(newTodoItem);
  }

  late FocusNode _descriptionFieldFocusNode;
  @override
  void initState() {
    _descriptionFieldFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _descriptionFieldFocusNode.dispose();
    _titleTextEditingController.dispose();
    _descriptionTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new Todo to your list'),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                autofocus: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _titleTextEditingController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title is required and cant be empty';
                  } else if (value.length <= 3) {
                    return 'Title has to be at least 4 charater';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  _descriptionFieldFocusNode.requestFocus();
                },
                decoration: const InputDecoration(
                  hintText: 'How should you todo be called',
                  labelText: 'Todo Titel',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                controller: _descriptionTextEditingController,
                minLines: 3,
                maxLines: 3,
                focusNode: _descriptionFieldFocusNode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Your description of the todo item',
                  labelText: 'Todo description',
                ),
                onFieldSubmitted: (value) {
                  _saveAndPushBack(context);
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _saveAndPushBack(context);
                },
                child: const Text('save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
