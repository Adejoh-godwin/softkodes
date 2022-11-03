import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:softkodes/cards.dart';
import 'package:softkodes/config.dart';
import 'package:softkodes/home.dart';
import 'package:softkodes/models/productmodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:softkodes/widgets/shimmer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  List<ProductModel> _list = [];
  List<ProductModel> _searchList = [];

  bool isSearching = false;
  bool loading = false;
  String _searchText = "";
  _HomeState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          isSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          isSearching = true;
          _searchText = _searchQuery.text;
          _buildSearchList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isSearching = false;
    init();
  }

  void init() async {
    var url =
        "https://1hia8orbrk.execute-api.us-east-1.amazonaws.com/prod/products";
    // print(url);
    try {
      final response = await http.get(Uri.parse(url));
      // print(response.body);
      final body = json.decode(response.body);

      _list = body['Items'].map<ProductModel>(ProductModel.fromJson).toList();
      print(_list);
      setState(() {
        loading = true;
      });
      _searchList = _list;
    } catch (e) {
      print(e);
    }
  }

  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    mediaHeight = MediaQuery.of(context).size.height;
    mediaWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffD9D9D9),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      width: mediaWidth,
                      height: 300,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: (kIsWeb)
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.center,
                        children: [
                          sb('h', dp),
                          Text(
                            "My Products",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          if (kIsWeb) CategoryCard()
                        ],
                      ),
                    ),
                    Container(
                      width: mediaWidth,
                      height: 71,
                      color: Color(0xffd68484),
                    ),
                    Positioned(
                      top: 0,
                      left: (kIsWeb) ? mediaWidth * .35 : mediaWidth * .1,
                      bottom: (kIsWeb) ? mediaHeight * .2 : mediaHeight * .2,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: (kIsWeb) ? mediaWidth * .3 : mediaWidth * .8,
                            height: 73,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.only(
                              left: 21,
                              right: 18,
                              top: 23,
                              bottom: 24,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.search),
                                SizedBox(width: 20),
                                Container(
                                  width: kIsWeb
                                      ? mediaWidth * .15
                                      : mediaWidth * .3,
                                  child: TextFormField(
                                    controller: _searchQuery,
                                    focusNode: searchFocus,
                                    onChanged: (value) {
                                      _handleSearchStart();
                                    },
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        fillColor: b,
                                        hintText: "Search for product...",
                                        hintStyle:
                                            TextStyle(color: Colors.black)),
                                  ),
                                ),
                                esb('w', dp),
                                Transform.rotate(
                                  angle: 1.57,
                                  child: Container(
                                    color: b,
                                    width: 26,
                                    height: 1,
                                  ),
                                ),
                                Text(
                                  "category",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                  if (kIsWeb) AddidasCArd(),
                  sb('h', dp),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: !loading
                  ? EmptyTab()
                  : GridView.builder(
                      shrinkWrap: true,
                      itemCount: _searchList.length,
                      itemBuilder: (context, index) {
                        final productModel = _searchList[index];
                        return ShowCards(
                          productModel: productModel,
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: kIsWeb ? 6 : 2,
                          // crossAxisSpacing: 10,
                          // mainAxisSpacing: 10,
                          // mainAxisExtent: mediaHeight * .33,
                          childAspectRatio: 0.75)),
            )
          ],
        ),
      ),
    );
  }

  List<ProductModel> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = _list;
    } else {
      _searchList = _list
          .where((element) =>
              element.title!
                  .toLowerCase()
                  .contains(_searchText.toLowerCase()) ||
              element.price!.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      // print('${_searchList.length}');
      return _searchList;
    }
  }

  void _handleSearchStart() {
    setState(() {
      isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      isSearching = false;
      _searchQuery.clear();
    });
  }
}
