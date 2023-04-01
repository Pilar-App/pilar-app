import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: widget.messages[index]['isUserMessage']
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(
                        20,
                      ),
                      topRight: const Radius.circular(20),
                      bottomRight: Radius.circular(
                          widget.messages[index]['isUserMessage'] ? 0 : 20),
                      topLeft: Radius.circular(
                          widget.messages[index]['isUserMessage'] ? 20 : 0),
                    ),
                    border: Border.all(
                      color: widget.messages[index]['isUserMessage']
                          ? const Color.fromRGBO(37, 138, 216, 1.0)
                          : Colors.transparent,
                    ),
                    color: widget.messages[index]['isUserMessage']
                        ? Colors.transparent
                        : Colors.white,
                  ),
                  constraints: BoxConstraints(maxWidth: w * 2 / 3),
                  child: Text(
                    widget.messages[index]['message'].text.text[0],
                    style: TextStyle(
                      color: widget.messages[index]['isUserMessage']
                          ? const Color.fromRGBO(37, 138, 216, 1.0)
                          : Colors.black,
                      fontWeight: widget.messages[index]['isUserMessage']
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, i) =>
            const Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messages.length);
  }
}
