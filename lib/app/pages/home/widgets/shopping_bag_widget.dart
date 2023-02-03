// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dw_delivery_app/app/core/extensions/formatter_extension.dart';
import 'package:dw_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:dw_delivery_app/app/dto/order_product_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDto> bag;

  const ShoppingBagWidget({super.key, required this.bag});

  Future<void> _goOrder(BuildContext context) async {
    // Envio para o order
    final navigator = Navigator.of(context);
    // Erro do SharedPreferences Aula 3 Minuto 2h12m00s
    final sp = await SharedPreferences.getInstance();
    if (!sp.containsKey('accessToken')) {
      // Envio para o login
      final loginResult = await navigator.pushNamed('/auth/login');
    }

    // Envio para o order
  }

  @override
  Widget build(BuildContext context) {
    var totalBag = bag
        .fold<double>(0.0, (total, element) => total += element.totalPrice)
        .currencyPTBR;

    return Container(
      padding: const EdgeInsets.all(20.0),
      width: context.screenWidth,
      height: 90.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          _goOrder(context);
        },
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.shopping_cart_outlined),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Ver sacola',
                style:
                    context.textStyles.textExtraBold.copyWith(fontSize: 14.0),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalBag,
                style:
                    context.textStyles.textExtraBold.copyWith(fontSize: 12.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
