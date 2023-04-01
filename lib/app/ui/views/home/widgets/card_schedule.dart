import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

class CardSchedule extends StatelessWidget {
  const CardSchedule({
    Key? key,
    required this.title,
    required this.hour,
    required this.image,
    required this.positionImage,
  }) : super(key: key);

  final String title;
  final String hour;
  final String image;
  final AlignmentGeometry positionImage;

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
                  headerBackgroundColor: Colors.transparent,
                  rightIcon: const SizedBox.shrink(),
                  contentBorderColor: Colors.grey,
                  headerPadding: const EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 0.0,
                  ),
                  header: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 25.0,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                        alignment: positionImage,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.darken),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
