import 'package:flutter/material.dart';

class AddEditPage extends StatefulWidget {
  const AddEditPage({Key? key}) : super(key: key);

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  bool editMode = false;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
