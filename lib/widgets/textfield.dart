import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  const textfield({this.title, this.maxline, this.onsaved, this.onChanged});
  final String? title;
  final int? maxline;
  final void Function(String?)? onsaved;
 final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field required';
        } else {
          return null;
        }
      },
      maxLines: maxline,
      decoration: InputDecoration(
          hintText: title,
          hintStyle: const TextStyle(color: Colors.blueAccent),
          border: const OutlineInputBorder()),
    );
  }
}
