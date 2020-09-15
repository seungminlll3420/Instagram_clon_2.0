import 'package:flutter/material.dart';
import 'package:instagram_clon_2/constants/common_size.dart';
import 'package:instagram_clon_2/constants/screen_size.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

enum SelectedTab { left, right }

class _ProfileBodyState extends State<ProfileBody> {
  SelectedTab _selectedTab = SelectedTab.left;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              _username(),
              _userBio(),
              _editProfileBtn(),
              _tabButton(),
              _selectedIndicator()
            ]),
          ),
        ],
      ),
    );
  }

  AnimatedContainer _selectedIndicator() {
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 350),
      alignment: _selectedTab == SelectedTab.left
          ? Alignment.topLeft
          : Alignment.topRight,
      child: Container(
        color: Colors.black87,
        width: size.width / 2,
        height: 2,
      ),
    );
  }

  Padding _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'username',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Padding _userBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        '배고팡',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: SizedBox(
        height: 24,
        child: OutlineButton(
            onPressed: () {},
            child: Text(
              '버튼',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            color: Colors.black45,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      ),
    );
  }

  Row _tabButton() {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            onPressed: () {
              setState(() {
                _selectedTab = SelectedTab.left;
              });
            },
            color: _selectedTab == SelectedTab.left
                ? Colors.black87
                : Colors.black45,
            icon: ImageIcon(AssetImage('assets/images/grid.png')),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              setState(() {
                _selectedTab = SelectedTab.right;
              });
            },
            color: _selectedTab == SelectedTab.left
                ? Colors.black45
                : Colors.black87,
            icon: ImageIcon(AssetImage('assets/images/saved.png')),
          ),
        ),
      ],
    );
  }
}
