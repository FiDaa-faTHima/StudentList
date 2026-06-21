import 'package:flutter/material.dart';

import 'data_model.dart';
import 'db_functions.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (BuildContext ctx,List<StudentModel> studentList,Widget? child) {
        return ListView.separated(itemBuilder: (ctx, index) {
          final data =studentList[index];
          return Card(
            color:Colors.blue.shade50,
            shape:RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(12),
              side:const BorderSide(
                color:Colors.blue,
                width:1.5
              ),
            ),
            child: ListTile(
              title: Text(data.name),
              subtitle: Text(data.age),
            ),
          );
        }, separatorBuilder: (ctx, index) {
          return const Divider();
        },
          itemCount: studentList.length,
        );
      },

    );
  }
}
