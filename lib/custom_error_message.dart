import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum MessageType {
  error,
  warning,
  plain,
}

class CustomSnackBarContent extends StatefulWidget {
  CustomSnackBarContent({
    Key? key,
    required this.errorText,
    required this.messageType,
  }) : super(key: key);

  late String errorText;
  late String messageType;

  @override
  State<CustomSnackBarContent> createState() => _CustomSnackBarContentState();
}

class _CustomSnackBarContentState extends State<CustomSnackBarContent> {
  late int myColor;
  @override
  void initState() {
    if (widget.messageType == MessageType.error.toString()) {
      myColor = 0xFFC72C41;
    } else if (widget.messageType == MessageType.warning.toString()) {
      myColor = 0xFFeed202;
    } else if (widget.messageType == MessageType.plain.toString()) {
      myColor = 0xFF0000FF;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: Color(myColor),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Oh Crack!",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      widget.errorText,
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          left: 5,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
            ),
            child: SvgPicture.asset(
              "assets/calcium.svg",
              height: 50,
              width: 45,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ],
    );
  }
}
