import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:softkodes/config.dart';
import 'package:softkodes/models/productmodel.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ShowCards extends StatefulWidget {
  final ProductModel productModel;
  const ShowCards({Key? key, required this.productModel}) : super(key: key);

  @override
  State<ShowCards> createState() => _ShowCardsState();
}

class _ShowCardsState extends State<ShowCards> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          hover = value;
        });
      },
      child: hover
          ? ProductCard2(productModel: widget.productModel)
          : ProductCard(productModel: widget.productModel),
    );
  }
}

class AddidasCArd extends StatelessWidget {
  const AddidasCArd({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(mediaHeight * .1),
      width: mediaWidth,
      height: mediaHeight * .2,
      color: w,
      child: Row(
        children: [
          Container(
            width: 83,
            height: 82,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset("assets/e.png"),
          ),
          sb('w', dp),
          Text(
            "Adidda Sport wears",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: "Inter",
              fontWeight: FontWeight.w700,
            ),
          ),
          esb('w', dp),
          for (int x = 1; x < 6; x++)
            Container(
              width: 65,
              height: 65,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/addidaslogo.png'))),
            ),
          sb('h', dp),
          Container(
            width: 67,
            height: 67,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xb2000000),
            ),
            padding: const EdgeInsets.only(
              left: 16,
              right: 13,
              top: 22,
              bottom: 21,
            ),
            child: Text(
              "10+",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          sb('w', dp)
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int x = 1; x < 6; x++)
          Container(
            margin: EdgeInsets.all(10),
            width: mediaWidth * .1,
            height: 51,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 17,
            ),
            child: Text(
              "Converse Shoes",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          )
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;

  // bool hover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: kIsWeb ? 500 : mediaWidth * .4,
      height: kIsWeb ? mediaHeight * .31 : mediaHeight * .55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(
        bottom: 28,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 259,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: productModel.image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                  ),
                ),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  numformat(productModel.price),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard2 extends StatelessWidget {
  final ProductModel productModel;
  const ProductCard2({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 339,
      // height: 409,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(
        bottom: 18,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 339,
            // height: 253.86,
            decoration: BoxDecoration(
              color: b,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              // "assets/shoe.png",
              productModel.image,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  productModel.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  numformat(productModel.price),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Container(
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffd78484),
                    ),
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
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
