import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody(
      {Key? key,
      required this.item,
      required this.handleDelete,
      required this.index})
      : super(key: key);

  var index;
  var item;
  final Function handleDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: (index % 2 == 0
            ? Color.fromARGB(255, 141, 203, 255)
            : Color.fromARGB(255, 255, 169, 226)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.name,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleDelete(item.id);
                }
                return;
              },
              child:
                  const Icon(Icons.delete_outline, color: Colors.red, size: 30),
            )
          ],
        ),
      ),
    );
  }
}
