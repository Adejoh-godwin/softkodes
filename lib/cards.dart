import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:softkodes/config.dart';
import 'package:softkodes/models/productmodel.dart';

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

class ShowCards extends StatefulWidget {
  const ShowCards({Key? key, required this.productModel, this.index})
      : super(key: key);
  final ProductModel productModel;
  final index;

  @override
  State<ShowCards> createState() => _ShowCardsState();
}

class _ShowCardsState extends State<ShowCards> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: show
            ? ProductCard2(productModel: widget.productModel)
            : ProductCard(productModel: widget.productModel),
        onTap: () {},
        onHover: (val) {
          print(widget.index);
          setState(() {
            show = val;
          });
        }
        /*val--->true when user brings in mouse
         val---> false when brings out his mouse*/
        );
  }
}

class ProductCard extends StatefulWidget {
  final ProductModel productModel;
  const ProductCard({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18),
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
                imageUrl: widget.productModel.image,
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
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productModel.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  numformat(widget.productModel.price),
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

class ProductCard2 extends StatefulWidget {
  final ProductModel productModel;

  const ProductCard2({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<ProductCard2> createState() => _ProductCard2State();
}

class _ProductCard2State extends State<ProductCard2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 339,
      height: 409,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 339,
            height: 409,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(
              bottom: 18,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 339,
                  height: 253.86,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    "assets/shoe.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(height: 11.97),
                SizedBox(
                  width: 218.58,
                  height: 33.85,
                  child: Text(
                    "Adidas Converse",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 11.97),
                SizedBox(
                  width: 62.83,
                  height: 25.39,
                  child: Text(
                    "1200",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 11.97),
                Container(
                  width: 150,
                  height: 42,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffd78484),
                        ),
                        padding: const EdgeInsets.only(
                          left: 33,
                          right: 32,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.white,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
