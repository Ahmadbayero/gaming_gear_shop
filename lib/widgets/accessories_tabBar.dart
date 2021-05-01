import 'package:flutter/material.dart';

class AccessoriesTabBar extends StatefulWidget {
  const AccessoriesTabBar(
      {Key key, this.onTabChange, this.startIndex, this.tabItems})
      : super(key: key);

  final void Function(int) onTabChange;
  final int startIndex;
  final List<String> tabItems;

  @override
  _AccessoriesTabBarState createState() => _AccessoriesTabBarState();
}

class _AccessoriesTabBarState extends State<AccessoriesTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _activeTabIndex;

  @override
  void initState() {
    _tabController = TabController(
        length: widget.tabItems.length,
        vsync: this,
        initialIndex: widget.startIndex);
    _tabController.addListener(_handleTabChange);
    super.initState();
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) return;
    widget.onTabChange(_tabController.index);
    setState(() {
      this._activeTabIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      physics: BouncingScrollPhysics(),
      labelColor: Colors.blue,
      labelStyle: Theme.of(context).textTheme.caption.copyWith(
            fontFamily: 'Kanit',
            fontSize: 17.5,
          ),
      unselectedLabelColor: Colors.black38,
      unselectedLabelStyle: Theme.of(context).textTheme.caption.copyWith(
            fontFamily: 'Kanit',
            fontSize: 17.0,
          ),
      controller: _tabController,
      isScrollable: true,
      tabs: widget.tabItems.map((t) => Text(t)).toList(),
    );
  }
}
