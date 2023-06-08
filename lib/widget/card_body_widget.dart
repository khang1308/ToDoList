import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody(
      {Key? key,
      required this.item,
      required this.handleDelete,
      required this.index})
      : super(key: key);
  var item;
  var index;
  final Function handleDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: (index % 2 == 0)
              ? const Color.fromARGB(255, 146, 11, 11)
              : const Color.fromARGB(255, 24, 194, 129),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 71, 68, 70),
              ),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleDelete(item.id);
                }
                return;
              },
              child: const Icon(Icons.delete_outline),
            )
          ],
        ),
      ),
    );
  }
}
