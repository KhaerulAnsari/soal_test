import 'package:flutter/material.dart';
import 'package:soal_test/theme.dart';
import 'package:soal_test/ui/pages/tab_view/list_employee_page.dart';
import 'package:soal_test/ui/pages/tab_view/list_user_page.dart';
import 'package:soal_test/ui/pages/tab_view/profile_page.dart';

class TabPage extends StatefulWidget {
  int selectedIndex;
  TabPage({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  onItemClick(int index) {
    setState(
      () {
        widget.selectedIndex = index;
        tabController!.index = widget.selectedIndex;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          const ListUserPage(),
          ListEmployeePage(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: const Offset(0, 1),
              blurRadius: 3.0,
              spreadRadius: 0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_add,
              ),
              label: 'User',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.document_scanner_outlined,
              ),
              label: 'Employee',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile',
            ),
          ],
          unselectedItemColor: greyColor,
          selectedItemColor: orangeColor,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: textStyle.copyWith(
            fontSize: 12,
            fontWeight: light,
          ),
          unselectedLabelStyle: textStyle.copyWith(
            fontSize: 12,
            fontWeight: light,
          ),
          showUnselectedLabels: true,
          currentIndex: widget.selectedIndex,
          onTap: onItemClick,
        ),
      ),
    );
  }
}
