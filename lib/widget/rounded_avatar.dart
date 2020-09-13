import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon_2/constants/common_size.dart';

class RoundedAvatar extends StatelessWidget {
  final double size;
  const RoundedAvatar({
    this.size = avatar_size,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: 'https://picsum.photos/100',
        width: size,
        height: size,
      ),
    );
  }
}
