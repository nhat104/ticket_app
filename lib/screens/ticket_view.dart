import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_app/utils/layout.dart';
import 'package:ticket_app/utils/styles.dart';
import 'package:ticket_app/widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  const TicketView({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    final size = Layout.getSize(context);

    return SizedBox(
      width: size.width * 0.85,
      height: 200,
      child: Container(
          margin: const EdgeInsets.only(right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Show the blue part of the ticket
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF526799),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21)),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          ticket["from"]["code"],
                          style: Styles.headLineStyle3
                              .copyWith(color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        const ThickContainer(),
                        Expanded(
                            child: Stack(
                          children: [
                            SizedBox(
                              height: 24,
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                        BoxConstraints constraints) =>
                                    Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      (constraints.constrainWidth() / 6)
                                          .floor(),
                                      (index) => const SizedBox(
                                            width: 3,
                                            height: 1.5,
                                            child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Colors.white)),
                                          )),
                                ),
                              ),
                            ),
                            Center(
                              child: Transform.rotate(
                                angle: 1.5,
                                child: const Icon(
                                  Icons.local_airport_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )),
                        const ThickContainer(),
                        Expanded(child: Container()),
                        Text(
                          ticket["to"]["code"],
                          style: Styles.headLineStyle3
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    const Gap(1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            ticket["from"]["name"],
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        Text(
                          ticket["flying_time"],
                          style: Styles.headLineStyle4
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(
                            ticket["to"]["name"],
                            textAlign: TextAlign.end,
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // Show the orange part of the ticket
              Container(
                color: const Color(0xFFF37B67),
                child: Row(
                  children: [
                    const SizedBox(
                      height: 20,
                      width: 10,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ))),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: LayoutBuilder(
                        builder: (BuildContext context,
                                BoxConstraints constraints) =>
                            Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              constraints.constrainWidth() ~/ 15,
                              (index) => const SizedBox(
                                    width: 5,
                                    height: 1,
                                    child: DecoratedBox(
                                        decoration:
                                            BoxDecoration(color: Colors.white)),
                                  )),
                        ),
                      ),
                    )),
                    const SizedBox(
                      height: 20,
                      width: 10,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ))),
                    ),
                  ],
                ),
              ),
              // Bottom part of the orange ticket
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF37B67),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21)),
                ),
                padding: const EdgeInsets.only(
                    left: 16, top: 10, right: 16, bottom: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ticket["date"],
                              style: Styles.headLineStyle3
                                  .copyWith(color: Colors.white),
                            ),
                            const Gap(5),
                            Text(
                              "Date",
                              style: Styles.headLineStyle4
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              ticket["departure_time"],
                              style: Styles.headLineStyle3
                                  .copyWith(color: Colors.white),
                            ),
                            const Gap(5),
                            Text(
                              "Departure time",
                              style: Styles.headLineStyle4
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ticket["number"].toString(),
                              style: Styles.headLineStyle3
                                  .copyWith(color: Colors.white),
                            ),
                            const Gap(5),
                            Text(
                              "Number",
                              style: Styles.headLineStyle4
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
