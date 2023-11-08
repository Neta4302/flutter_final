import 'package:flutter/material.dart';
import 'package:flutter_final/consts/consts.dart';
import 'package:flutter_final/consts/lists.dart';
import 'package:flutter_final/controllers/product_controller.dart';
import 'package:flutter_final/widgets_common/our_button.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var controller = Get.find<ProductController>();
    return WillPopScope(
      onWillPop: () async {
        controller.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                controller.resetValues();
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
          ],
        ),
        body: Column(children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VxSwiper.builder(
                    autoPlay: true,
                    height: 350,
                    itemCount: data['p_imgs'].length,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    itemBuilder: (context, index) {
                      return Image.network(data['p_imgs'][index],
                          width: double.infinity, fit: BoxFit.cover);
                    }),
                10.heightBox,
                title!.text
                    .size(16)
                    .color(darkFontGrey)
                    .fontFamily(semibold)
                    .make(),
                10.heightBox,
                VxRating(
                    isSelectable: false,
                    value: double.parse(data['p_rating']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    maxRating: 5,
                    size: 25,
                    stepInt: true),
                10.heightBox,
                "${data['p_price']}"
                    .numCurrency
                    .text
                    .color(redColor)
                    .fontFamily(bold)
                    .size(18)
                    .make(),
                10.heightBox,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Seller".text.black.fontFamily(semibold).make(),
                          5.heightBox,
                          "${data['p_seller']}"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make()
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.message_rounded, color: darkFontGrey),
                    ),
                  ],
                )
                    .box
                    .height(60)
                    .padding(const EdgeInsets.symmetric(horizontal: 16))
                    .color(textfieldGrey)
                    .make(),
                Obx(
                  () => Column(
                    children: [
                      //Quantity
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Quantity: ".text.color(darkFontGrey).make(),
                          ),
                          Obx(
                            () => Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      controller.decreaseQuantity();
                                      controller.calculateTotalPrice(
                                          int.parse(data['p_price']));
                                    },
                                    icon: const Icon(Icons.remove)),
                                controller.quantity.value.text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                    onPressed: () {
                                      controller.increaseQuantity(
                                          int.parse(data['p_quantity']));
                                      controller.calculateTotalPrice(
                                          int.parse(data['p_price']));
                                    },
                                    icon: const Icon(Icons.add)),
                                10.widthBox,
                                "(${data['p_quantity']} available)"
                                    .text
                                    .color(darkFontGrey)
                                    .make(),
                              ],
                            ),
                          ),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),

                      //Total
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total: ".text.color(darkFontGrey).make(),
                          ),
                          "${controller.totalPrice.value}"
                              .numCurrency
                              .text
                              .color(redColor)
                              .size(16)
                              .fontFamily(bold)
                              .make(),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                    ],
                  ).box.white.shadowSm.make(),
                ),
                10.heightBox,
                "Description"
                    .text
                    .color(darkFontGrey)
                    .fontFamily(semibold)
                    .make(),
                10.heightBox,
                "${data['p_desc']}".text.color(darkFontGrey).make(),
                10.heightBox,
                //Button
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                    itemDetailButtonList.length,
                    (index) => ListTile(
                      title: itemDetailButtonList[index]
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                      trailing: const Icon(Icons.arrow_forward),
                    ),
                  ),
                ),
                20.heightBox,
                productYouMayLike.text
                    .fontFamily(bold)
                    .size(16)
                    .color(darkFontGrey)
                    .make(),
                10.heightBox,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        6,
                        (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  imgP1,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                10.heightBox,
                                "Laptop 4GB/64GB"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                10.heightBox,
                                "\$600"
                                    .text
                                    .color(redColor)
                                    .fontFamily(bold)
                                    .size(16)
                                    .make()
                              ],
                            )
                                .box
                                .white
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 4))
                                .roundedSM
                                .padding(const EdgeInsets.all(8))
                                .make()),
                  ),
                ),
              ],
            )),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
                color: redColor,
                onPress: () {
                  controller.addToCart(
                      context: context,
                      img: data['p_imgs'][0],
                      qty: controller.quantity.value,
                      sellername: data['p_seller'],
                      title: data['p_name'],
                      price: controller.totalPrice.value);
                  VxToast.show(context, msg: "Added to cart");
                },
                textColor: whiteColor,
                title: "Add to cart"),
          )
        ]),
      ),
    );
  }
}
