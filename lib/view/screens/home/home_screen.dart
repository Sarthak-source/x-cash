import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/screens/home/widget/items_section.dart';
import 'package:xcash_app/view/screens/home/widget/top_section.dart';
import 'package:xcash_app/view/screens/home/widget/wallet_card_section.dart';
import 'package:xcash_app/view/screens/home/widget/wallet_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor100,
        body: CustomScrollView(
          slivers: <Widget>[

            SliverAppBar(
              pinned: false,
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: MyColor.primaryColor,
              expandedHeight: 310,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(top: Dimensions.space40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      TopSection(),

                      SizedBox(height: Dimensions.space30),

                      WalletSection(),

                      SizedBox(height: Dimensions.space20),

                      Expanded(
                        child: WalletCardSection()
                      ),

                      SizedBox(height: Dimensions.space20),
                    ],
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                color: MyColor.primaryColor,
                child: Container(
                  decoration: const BoxDecoration(
                      color: MyColor.primaryColor100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      )
                  ),
                  child: const ItemsSection(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
