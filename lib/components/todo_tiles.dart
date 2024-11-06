// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


// ignore: must_be_immutable
class TodoTile extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  //final VoidCallback deleteFunction;
  Function(bool) onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: (context) =>  widget.deleteFunction!(context),
           // onPressed: (context) => widget.deleteFunction!(context),
            icon: Icons.delete_outline_outlined,
            backgroundColor: Colors.red,
          ),
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(25),
          child: Row(
            children: [
              Checkbox(
                activeColor: Colors.black,
                value: widget.taskCompleted,
                onChanged: (bool? value) {
                  widget.onChanged(value!);
                },
              ),
              Text(
                widget.taskName,
                style: TextStyle(
                    decoration: widget.taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
