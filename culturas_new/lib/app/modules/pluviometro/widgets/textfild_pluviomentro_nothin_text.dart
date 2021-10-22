import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfildPluviomentroNothinText extends StatefulWidget {
  final double width;
  final String title;
  final bool? readOnly;
  final String? innerText;
  final Function(String)? onChange;
  final List<TextInputFormatter> formart;
  const TextfildPluviomentroNothinText({
    required this.title,
    required this.width,
    required this.formart,
    this.readOnly,
    this.innerText,
    this.onChange,
  });

  @override
  _TextfildPluviomentroNothinTextState createState() =>
      _TextfildPluviomentroNothinTextState();
}

class _TextfildPluviomentroNothinTextState
    extends State<TextfildPluviomentroNothinText> {
  var txtController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.innerText != null) {
      setState(() {
        txtController.text = widget.innerText!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      child: Container(
        width:
            MediaQuery.of(context).size.width / 1.05, //Depois tira isso daqui
        child: TextField(
          onChanged: widget.onChange,
          controller: txtController,
          readOnly: widget.readOnly == null || widget.readOnly == false
              ? false
              : true,
          keyboardType: TextInputType.text,
          inputFormatters: widget.formart,
          decoration: InputDecoration(
              hintText: widget.title,
              hintStyle: const TextStyle(),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
        ),
      ),
    );
  }
}
