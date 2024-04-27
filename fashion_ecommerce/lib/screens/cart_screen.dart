import 'package:fashion_ecommerce/app_state.dart';
import 'package:fashion_ecommerce/lang_state.dart';
import 'package:fashion_ecommerce/models.dart';
import 'package:fashion_ecommerce/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<ThemeState>(
      builder: (context, state, _) => Scaffold(
          backgroundColor:
              state.isLight ? Colors.grey.shade100 : Colors.grey.shade900,
          appBar: AppBar(
            iconTheme: IconThemeData(
                color: state.isLight ? Colors.black : Colors.white),
            backgroundColor: state.isLight ? Colors.white : Colors.black,
            centerTitle: true,
            title: Consumer<LangState>(
              builder: (context, langState, _) => Text(
                langState.lang == 'en' ? 'My Orders' : 'Siparişlerim',
                style: TextStyle(
                    color: state.isLight ? Colors.black : Colors.white),
              ),
            ),
          ),
          body: BlocBuilder<CartCubit, List<Order>>(
            builder: (context, count) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Consumer<LangState>(
                  builder: (context, langState, _) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final item in count)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        langState.lang == 'en'
                                            ? 'Order No: ${item.product.id}'
                                            : 'Sipariş No: ${item.product.id}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${item.date.day}-${item.date.month}-${item.date.year}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    height: 10,
                                    thickness: 0.8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        item.product.imagePath),
                                                    fit: BoxFit.cover)),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.product.title,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                '\$${item.product.price}',
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(2)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Text(
                                                item.status,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          )),
    ));
  }
}
