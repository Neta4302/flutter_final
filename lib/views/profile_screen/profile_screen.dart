import 'package:flutter/material.dart';
import 'package:flutter_final/consts/consts.dart';
import 'package:flutter_final/consts/lists.dart';
import 'package:flutter_final/controllers/auth_controller.dart';
import 'package:flutter_final/views/auth_screen/login_screen.dart';
import 'package:flutter_final/views/profile_screen/components/details_card.dart';
import 'package:flutter_final/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Align(alignment: Alignment.topRight, child: Icon(Icons.edit, color: whiteColor)).onTap(() {}),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Image.asset(imgProfile, width: 75, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Nattaphat Sangsunt".text.fontFamily(semibold).white.make(),
                          5.heightBox,
                          "s6407012660193@".text.white.make(),
                          "email.kmutnb.ac.th".text.white.make(),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: whiteColor,
                        )
                      ),
                      onPressed: () async {
                        await Get.put(AuthController()).signoutMethod(context);
                        Get.offAll(() => const LoginScreen());
                      },
                      child: logOut.text.fontFamily(semibold).white.make(),
                    )
                  ],
                ),
              ),

              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(count: "00", title: "in your cart", width: context.screenWidth / 3.4),
                  detailsCard(count: "32", title: "in your wishlist", width: context.screenWidth / 3.4),
                  detailsCard(count: "675", title: "your orders", width: context.screenWidth / 3.4),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const Divider(color: lightGrey);
                },
                itemCount: profileButtonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.asset(
                      profileButtonIcon[index],
                      width: 22
                    ),
                    title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                  );
                },
              ).box.white.rounded.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make()
            ],
          )
        ),
      )
    );
  }
}