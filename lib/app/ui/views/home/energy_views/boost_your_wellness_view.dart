import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BoostYourWellnessView extends StatelessWidget {
  const BoostYourWellnessView({Key? key}) : super(key: key);

  Stream<List<BostYourWellness>> getBostYourWellness() => FirebaseFirestore
      .instance
      .collection("boost-your-wellness")
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => BostYourWellness.fromJson(doc.data()))
          .toList());

  Future<void> _launchURL(String urlCard) async {
    final uri = Uri.parse(urlCard);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.inAppWebView,
      );
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Boost your wellness"),
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(37, 138, 216, 1.0),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<List<BostYourWellness>>(
                    stream: getBostYourWellness(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Error!");
                      } else {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          case ConnectionState.waiting:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          case ConnectionState.active:
                            final boostYourWellness = snapshot.data!;
                            if (boostYourWellness.isEmpty) {
                              return Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "No cards",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Column(
                                  children: boostYourWellness
                                      .map(
                                        (BostYourWellness byw) => Column(
                                          children: [
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 24.0,
                                                  vertical: 16.0,
                                                ),
                                                height: 200.0,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image:
                                                        NetworkImage(byw.image),
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                      Colors.black
                                                          .withOpacity(0.6),
                                                      BlendMode.darken,
                                                    ),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          byw.title,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 24.0,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 8.0,
                                                        ),
                                                        Text(
                                                          byw.description,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        _launchURL(byw.source);
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 12.0,
                                                          vertical: 8.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.black
                                                              .withOpacity(0.4),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.5),
                                                          ),
                                                        ),
                                                        child: const Text(
                                                          "More information",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                            }
                          case ConnectionState.done:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                        }
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BostYourWellness {
  final String title;
  final String description;
  final String image;
  final String source;

  BostYourWellness({
    required this.title,
    required this.description,
    required this.image,
    required this.source,
  });

  static BostYourWellness fromJson(Map<String, dynamic> json) =>
      BostYourWellness(
        title: json['title'],
        description: json['description'],
        image: json['image'],
        source: json['source'],
      );
}
