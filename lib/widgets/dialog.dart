import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String cancelButtonText;
  final String confirmButtonText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.cancelButtonText,
    required this.confirmButtonText,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        width: 300.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              color: const Color(0xffC9C9C9),
              height: 2.0, // 회색 가로선 높이
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: onCancel,
                  child: Text(
                    cancelButtonText,
                    style: const TextStyle(
                      color: Color(0xff66A058),
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xffC9C9C9),
                  height: 50.0,
                  width: 2,
                ),
                TextButton(
                  onPressed: onConfirm,
                  child: Text(
                    confirmButtonText,
                    style: const TextStyle(
                      color: Color(0xff66A058),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showCustomDialog(
  BuildContext context,
  String title,
  String cancelButtonText,
  String confirmButtonText,
  VoidCallback onConfirm,
  VoidCallback onCancel,
) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(
        title: title,
        cancelButtonText: cancelButtonText,
        confirmButtonText: confirmButtonText,
        onConfirm: onConfirm,
        onCancel: onCancel,
      );
    },
  );
}
