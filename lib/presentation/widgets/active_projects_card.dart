import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio_app/data/dummy_data.dart';

import '../../constants.dart';

class ActiveProjectsCard extends StatelessWidget {
  const ActiveProjectsCard(
      {Key? key, required this.deviceSize, required this.index})
      : super(key: key);

  final Size deviceSize;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: projectList[index].bgColor,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            height: deviceSize.height * 0.3 * 0.6,
            child: CircularPercentIndicator(
              radius: deviceSize.width * 0.4 * 0.6,
              lineWidth: 6.0,
              backgroundColor: Colors.white.withOpacity(0.3),
              percent: projectList[index].percentCompleted * 0.01,
              progressColor: Colors.white,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              center: Text(
                '${projectList[index].percentCompleted}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          Container(
            // color: Colors.amber,
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            height: deviceSize.height * 0.3 * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: SingleChildScrollView(
                      child: Text(
                        projectList[index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: SingleChildScrollView(
                      child: Text(
                        '${projectList[index].progressHours} hours progress',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
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
