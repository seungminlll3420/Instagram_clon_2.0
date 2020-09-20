import 'package:flutter/material.dart';
import 'package:instagram_clon_2/screen/profile_screen.dart';
import 'package:instagram_clon_2/widget/sign_in_form.dart';
import 'package:instagram_clon_2/widget/sign_up_form.dart';

class FadeStack extends StatefulWidget {
  final int selectedForm;

  const FadeStack({Key key, this.selectedForm}) : super(key: key);
  @override
  _FadeStackState createState() => _FadeStackState();
}

class _FadeStackState extends State<FadeStack>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  List<Widget> forms = [SignInForm(), SignUpForm()];
  @override
  void initState() {
    _animationController = AnimationController(duration: duration, vsync: this);
    _animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(FadeStack oldWidget) {
    if (widget.selectedForm != oldWidget.selectedForm) {
      _animationController.forward(from: 0.0);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: IndexedStack(
        children: forms,
        index: widget.selectedForm,
      ),
    );
  }
}
