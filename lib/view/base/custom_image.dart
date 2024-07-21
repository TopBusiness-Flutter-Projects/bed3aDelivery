import 'package:flutter/cupertino.dart';
import 'package:bed3aDelivery/utill/images.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit fit;
  const CustomImage(
      {Key? key,
      required this.image,
      this.height,
      this.width,
      this.fit = BoxFit.cover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: height,
      width: width,
      fit: BoxFit.cover,
      errorBuilder: (context, url, error) => Image.asset(Images.placeholder,
          height: height, width: width, fit: fit),
    );
  }
}
