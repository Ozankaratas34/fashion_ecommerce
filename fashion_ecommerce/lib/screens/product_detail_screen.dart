import 'package:fashion_ecommerce/app_state.dart';
import 'package:fashion_ecommerce/lang_state.dart';
import 'package:fashion_ecommerce/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];
  int selectedSizeIndex = 2;
  int amount = 1;
  bool isInCart = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (_) => CartCubit(),
      child: Scaffold(
        body: Consumer<LangState>(
          builder: (context, langState, _) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.product.imagePath),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  left: 24,
                  top: 30,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: const Center(
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 24,
                  top: 30,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    child: const Center(
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                widget.product.title,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (amount == 0) {
                                              amount = 0;
                                              return;
                                            }
                                            amount--;
                                          });
                                        },
                                        child: const Icon(Icons.remove)),
                                    const SizedBox(width: 4),
                                    Text('$amount'),
                                    const SizedBox(width: 4),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (amount ==
                                                widget.product.stockAmount) {
                                              amount =
                                                  widget.product.stockAmount;
                                              return;
                                            }
                                            amount++;
                                          });
                                        },
                                        child: const Icon(Icons.add))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          langState.lang == 'en' ? 'Size' : 'Beden',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (final size in sizeList)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSizeIndex = sizeList.indexOf(size);
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: selectedSizeIndex ==
                                              sizeList.indexOf(size)
                                          ? Colors.cyan
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.grey, width: 2.0)),
                                  child: Center(
                                    child: Text(
                                      size,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          langState.lang == 'en' ? 'Description' : 'Açıklama',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.product.description,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                          maxLines: 3,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              langState.lang == 'en' ? 'Reviews' : 'Yorumlar',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              langState.lang == 'en'
                                  ? 'View All'
                                  : 'Tümünü Göster',
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        for (final commit in widget.product.commits)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        commit.userImagePath),
                                                    fit: BoxFit.cover)),
                                          ),
                                          const SizedBox(width: 8),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                commit.userName,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.schedule,
                                                    color: Colors.grey,
                                                    size: 14,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    "${commit.date.day}/${commit.date.month}/${commit.date.year}",
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                commit.rate.toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                langState.lang == 'en'
                                                    ? 'rating'
                                                    : 'puan',
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              for (int i = 1; i <= 5; i++)
                                                i <= commit.rate
                                                    ? const Icon(
                                                        Icons.star,
                                                        color: Colors.orange,
                                                        size: 14,
                                                      )
                                                    : const Icon(
                                                        Icons
                                                            .star_outline_rounded,
                                                        color: Colors.grey,
                                                        size: 14,
                                                      )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    commit.content,
                                    style: const TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          langState.lang == 'en' ? 'Total Price' : 'Fiyat',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text(
                          '\$ ${widget.product.price}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () => context.read<CartCubit>().increment(Order(
                          product: widget.product,
                          date: DateTime.now(),
                          status: 'Pending')),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                                size: 26,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                langState.lang == 'en'
                                    ? 'Add to Cart'
                                    : 'Sepete Ekle',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
