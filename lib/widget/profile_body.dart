import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon_2/constants/common_size.dart';
import 'package:instagram_clon_2/constants/screen_size.dart';
import 'package:instagram_clon_2/screen/profile_screen.dart';
import 'package:instagram_clon_2/widget/rounded_avatar.dart';

class ProfileBody extends StatefulWidget {
  final Function onMenuChanged;

  const ProfileBody({Key key, this.onMenuChanged}) : super(key: key);
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

enum SelectedTab { left, right }

class _ProfileBodyState extends State<ProfileBody>
    with SingleTickerProviderStateMixin {
  SelectedTab _selectedTab = SelectedTab.left;
  double _leftImagesPageMargin = 0;
  double _rightImagesPageMargin = size.width;
  AnimationController _iconanimationController;
  @override
  void initState() {
    _iconanimationController =
        AnimationController(duration: duration, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _iconanimationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          transform: Matrix4.translationValues(0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appBar(),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(common_gap),
                              child: RoundedAvatar(
                                size: 80,
                              ),
                            ),
                            Expanded(
                              child: Table(
                                children: [
                                  TableRow(children: [
                                    _valueText('3'),
                                    _valueText('4'),
                                    _valueText('2'),
                                  ]),
                                  TableRow(children: [
                                    _labelText('Post'),
                                    _labelText('Followers'),
                                    _labelText('Following'),
                                  ])
                                ],
                              ),
                            )
                          ],
                        ),
                        _username(),
                        _userBio(),
                        _editProfileBtn(),
                        _tabButton(),
                        _selectedIndicator()
                      ]),
                    ),
                    _imagesPager()
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  Row _appBar() {
    return Row(
      children: [
        SizedBox(
          width: 44,
        ),
        Expanded(
            child: Text(
          '뜨억갈나무',
          textAlign: TextAlign.center,
        )),
        IconButton(
            onPressed: () {
              widget.onMenuChanged();
              setState(() {
                _iconanimationController.status == AnimationStatus.completed
                    ? _iconanimationController.reverse()
                    : _iconanimationController.forward();
              });
            },
            icon: AnimatedIcon(
              progress: _iconanimationController,
              icon: AnimatedIcons.menu_close,
            ))
      ],
    );
  }

  Text _valueText(String value) {
    return Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Text _labelText(String label) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
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
              'Edit Profile',
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
              _tabSelected(SelectedTab.left);
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
              _tabSelected(SelectedTab.right);
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

  void _tabSelected(SelectedTab selectedTab) {
    setState(() {
      switch (selectedTab) {
        case SelectedTab.left:
          _rightImagesPageMargin = size.width;
          _leftImagesPageMargin = 0;
          _selectedTab = SelectedTab.left;
          break;
        case SelectedTab.right:
          _rightImagesPageMargin = 0;
          _leftImagesPageMargin = -size.width;
          _selectedTab = SelectedTab.right;
          break;
      }
    });
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

  SliverToBoxAdapter _imagesPager() {
    return SliverToBoxAdapter(
        child: Stack(children: [
      AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 500),
        transform: Matrix4.translationValues(_leftImagesPageMargin, 0, 0),
        child: _images(),
      ),
      AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500),
          transform: Matrix4.translationValues(_rightImagesPageMargin, 0, 0),
          child: _images()),
    ]));
  }

  GridView _images() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        20,
        (index) => CachedNetworkImage(
          imageUrl: 'https://picsum.photos/id/$index/100/100',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
