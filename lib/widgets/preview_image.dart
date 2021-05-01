import 'package:flutter/material.dart';

class PreviewImage extends StatefulWidget {
  const PreviewImage({Key key, this.image, this.onPressed}) : super(key: key);
  final String image;
  final void Function(String image) onPressed;

  @override
  _PreviewImageState createState() => _PreviewImageState();
}

class _PreviewImageState extends State<PreviewImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed(widget.image),
      child: Container(
        margin: EdgeInsets.all(10),
        width: 65,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
          image: DecorationImage(
            image: AssetImage(widget.image),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
