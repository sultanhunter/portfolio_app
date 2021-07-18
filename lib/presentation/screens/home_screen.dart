import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  bool _serchBarFolded = true;
  late final AutoScrollController _autoController;

  late final AnimationController _animationController;
  late final Animation<double> _animation;

  double xOffSet = 0;
  double yOffSet = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _autoController = AutoScrollController();
    _animationController = AnimationController(
      value: 0,
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _autoController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SafeArea(
      child: AnimatedContainer(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: kBackGroundColor,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40.0)
              : BorderRadius.circular(0.0),
        ),
        transform: Matrix4.identity()
          ..translate(xOffSet, yOffSet)
          ..scale(scaleFactor),
        duration: const Duration(milliseconds: 250),
        child: Container(
            height: deviceSize.height,
            child: CustomScrollView(
              controller: _autoController,
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    color: Theme.of(context).primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isDrawerOpen
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    xOffSet = 0;
                                    yOffSet = 0;
                                    scaleFactor = 1;
                                    isDrawerOpen = false;
                                  });
                                },
                                icon: const Icon(Icons.arrow_back_ios),
                              )
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    xOffSet = deviceSize.width * 0.6;
                                    yOffSet = deviceSize.height * 0.2;
                                    scaleFactor = 0.6;
                                    isDrawerOpen = true;
                                  });
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  size: 40,
                                ),
                              ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: _serchBarFolded ? 56 : deviceSize.width * 0.5,
                          height: 56,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.0),
                              color: _serchBarFolded ? kPrimary : Colors.white),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: !_serchBarFolded
                                      ? TextField(
                                          autofocus: true,
                                          controller: _searchController,
                                          decoration: const InputDecoration(
                                              hintText: 'Search',
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              border: InputBorder.none),
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(32.0),
                                    onTap: () {
                                      setState(() {
                                        _serchBarFolded = !_serchBarFolded;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        _serchBarFolded
                                            ? Icons.search
                                            : Icons.close,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    height: deviceSize.height * 0.2,
                    decoration: BoxDecoration(
                      color: kPrimary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(45.0),
                        bottomRight: Radius.circular(45.0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(children: [
                          Positioned(
                            top: 5,
                            left: 5,
                            child: CircleAvatar(
                              backgroundImage:
                                  const AssetImage('assets/images/profile.png'),
                              backgroundColor: kSecondary,
                              radius: 45.0,
                            ),
                          ),
                          Container(
                            child: CircularProgressIndicator(
                              color: kRedColor,
                            ),
                            width: 100,
                            height: 100,
                          )
                        ]),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FadeTransition(
                                  opacity: _animationController,
                                  child: const Text(
                                    'Sultan Ibne Usman',
                                    style: const TextStyle(
                                        fontFamily: 'Circular',
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Text(
                                  'App Developer',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 20.0),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'My Tasks',
                                style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: kSecondary,
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  onPressed: () {
                                    pickDate(context);
                                  },
                                  icon: const Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        tasksList(Icons.alarm, 'To Do',
                            '5 tasks now. 1 started', kRedColor, () {}),
                        tasksList(Icons.timer, 'In Progress',
                            '1 tasks now. 1 started', kPrimary, () {
                          _autoController.scrollToIndex(0,
                              preferPosition: AutoScrollPosition.begin);
                        }),
                        tasksList(Icons.check, 'Done',
                            '18 tasks now. 13 started', Colors.blue, () {})
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 20.0,
                    ),
                    child: Text(
                      'Active Projects',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(20.0),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return AutoScrollTag(
                        key: ValueKey(index),
                        controller: _autoController,
                        index: index,
                        child: ActiveProjectsCard(
                          deviceSize: deviceSize,
                          index: index,
                        ),
                      );
                    }, childCount: 4),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (deviceSize.width * 0.4) /
                            (deviceSize.height * 0.3),
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget tasksList(IconData icon, String title, String subtitle, Color color,
      VoidCallback onTap) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        color: kBackGroundColor,
        child: InkWell(
          splashColor: color,
          onTap: onTap,
          child: ListTile(
            leading: CircleAvatar(
                radius: 30.0,
                backgroundColor: color,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 25.0,
                )),
            title: Text(
              title,
              style: TextStyle(
                  color: kTextColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black45,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> pickDate(BuildContext context) async {
  final initialDate = DateTime.now();
  final newDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    lastDate: DateTime(DateTime.now().year + 5),
    firstDate: DateTime(DateTime.now().year - 5),
  );
}
