import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

class CardDiary extends StatelessWidget {
  const CardDiary({
    Key? key,
    required this.title,
    required this.hour,
    required this.background,
  }) : super(key: key);

  final String title;
  final String hour;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              hour,
              style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Accordion(
              disableScrolling: true,
              paddingListTop: 0.0,
              paddingListBottom: 0.0,
              paddingListHorizontal: 0.0,
              children: [
                AccordionSection(
                  headerBackgroundColor: background,
                  contentBorderColor: Colors.grey,
                  headerPadding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 25.0),
                  header: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  content: Column(
                    children: [
                      Row(
                        children: const [Text("2 DÍAS SEGUIDOS")],
                      ),
                      const Divider(),
                      const Text("Reuniones de Calendar")
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
