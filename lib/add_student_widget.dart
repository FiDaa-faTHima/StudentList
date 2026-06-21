import 'package:flutter/material.dart';

import 'data_model.dart';
import 'db_functions.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({super.key});
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'name',
                filled:true,
                fillColor:Colors.blue.shade50,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                hintText: 'age',
                filled:true,
                fillColor:Colors.blue.shade50,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height:10),
            ElevatedButton.icon(onPressed:(){
              onAddStudentButtonClicked();
            }, icon: Icon(Icons.add),
              label:const Text('Add student') ,),
          ],
        )
    );

  }
  Future<void> onAddStudentButtonClicked() async{
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    if(_name.isEmpty||_age.isEmpty)
    {
      return;
    }
    print('$_name $_age');
    final _student =StudentModel(name:_name,age:_age);
    addStudent(_student);
  }
}
