import 'package:flutter/material.dart';
import 'package:minimal_ui/utils/planets.dart';

import '../utils/constants.dart';

class DetailsPage extends StatefulWidget {
  final PlanetInfo planetInfo;
  const DetailsPage({Key? key, required this.planetInfo}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 250,
                        ),
                        Text(
                          widget.planetInfo.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 56,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'Solar System',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 31,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w300),
                        ),
                        const Divider(
                          color: Colors.black26,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          widget.planetInfo.description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 20,
                              color: Color(0xff868686),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Divider(
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Gallery',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 25,
                        color: Color(0xff47455f),
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    child: ListView.builder(
                        padding: const EdgeInsets.only(left: 32),
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.planetInfo.images.length,
                        itemBuilder: (context, idx) {
                          return Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    widget.planetInfo.images[idx],
                                    fit: BoxFit.cover,
                                  )));
                        }),
                  )
                ],
              ),
            ),
            Positioned(
                right: -24,
                child: Hero(
                  tag: widget.planetInfo.position,
                  child: Image.asset(
                    widget.planetInfo.iconImage,
                    scale: 1.2,
                  ),
                )),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios))
          ],
        ),
      ),
    );
  }
}
