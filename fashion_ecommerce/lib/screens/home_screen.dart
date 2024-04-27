import 'package:fashion_ecommerce/app_state.dart';
import 'package:fashion_ecommerce/lang_state.dart';
import 'package:fashion_ecommerce/models.dart';
import 'package:fashion_ecommerce/screens/cart_screen.dart';
import 'package:fashion_ecommerce/screens/login_screen.dart';
import 'package:fashion_ecommerce/screens/my_cards_screen.dart';
import 'package:fashion_ecommerce/screens/product_detail_screen.dart';
import 'package:fashion_ecommerce/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Brand {
  String imagePath;
  String name;

  Brand({required this.imagePath, required this.name});
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Brand> brandList = [
    Brand(imagePath: 'lib/assets/images/puma.jpg', name: 'Puma'),
    Brand(imagePath: 'lib/assets/images/kinetix.jpg', name: 'Kinetix'),
    Brand(imagePath: 'lib/assets/images/nike.jpg', name: 'Nike'),
    Brand(imagePath: 'lib/assets/images/reebok.jpg', name: 'Reebok')
  ];
  List<Product> productList = [
    Product(
        id: 1423904,
        imagePath: 'lib/assets/images/product_1.jpg',
        title: 'Jordan Essentials Jumpman',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        price: 99,
        isFavorite: false,
        stockAmount: 7),
    Product(
        id: 21231923,
        imagePath: 'lib/assets/images/product_3.jpg',
        title: 'Dri-FIT One Luxe Crop Tank',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        price: 99,
        isFavorite: true,
        stockAmount: 7),
    Product(
        id: 39834543,
        imagePath: 'lib/assets/images/product_4.jpg',
        title: 'Tank Slim',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        price: 99,
        isFavorite: true,
        stockAmount: 7),
    Product(
        id: 4040234,
        imagePath: 'lib/assets/images/product_1.jpg',
        title: 'Jordan Essentials Jumpman',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        price: 99,
        isFavorite: false,
        stockAmount: 7),
    Product(
        id: 53459043,
        imagePath: 'lib/assets/images/product_1.jpg',
        title: 'Tank Slim DRE',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        price: 99,
        isFavorite: false,
        stockAmount: 7),
    Product(
        id: 6132132,
        imagePath: 'lib/assets/images/product_3.jpg',
        title: 'Dri-FIT One Luxe Crop Tank',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        price: 99,
        isFavorite: false,
        stockAmount: 7),
    Product(
        id: 7234923,
        imagePath: 'lib/assets/images/product_2.jpg',
        title: 'Jordan Essentials Jumpman',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        price: 99,
        isFavorite: false,
        stockAmount: 7),
  ];
  bool isLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<ThemeState>(
      builder: (context, state, _) => Scaffold(
        backgroundColor: state.isLight ? Colors.white : Colors.black,
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: state.isLight ? Colors.black : Colors.white),
          backgroundColor: state.isLight ? Colors.white : Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              const Text(
                'Clotya',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CartScreen()));
                },
                child: Stack(clipBehavior: Clip.none, children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: state.isLight ? Colors.black : Colors.white,
                  ),
                  Positioned(
                      right: -5,
                      bottom: -5,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: BlocBuilder<CartCubit, List<Order>>(
                              builder: (context, count) => Text(
                                    count.length.toString(),
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  )),
                        ),
                      ))
                ]),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<LangState>(
              builder: (context, langState, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    langState.lang == "tr" ? "Merhaba" : "Hello",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: state.isLight ? Colors.black : Colors.white),
                  ),
                  Text(
                    langState.lang == 'en'
                        ? 'Welcome to Clotya'
                        : 'Clotya\'ya hoşgeldiniz',
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                hintText: langState.lang == 'en'
                                    ? 'Search...'
                                    : 'Arama...',
                                hintStyle: const TextStyle(color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.cyan),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        langState.lang == 'en' ? 'Choose Brand' : 'Tür Seçiniz',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: state.isLight ? Colors.black : Colors.white),
                      ),
                      Text(
                        langState.lang == 'en' ? 'View All' : 'Tümünü Göster',
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final item in brandList)
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(item.imagePath),
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      item.name,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        langState.lang == 'en' ? 'New Arraival' : 'Yeni Sezon',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: state.isLight ? Colors.black : Colors.white),
                      ),
                      Text(
                        langState.lang == 'en' ? 'View All' : 'Tümünü Göster',
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Wrap(spacing: 8, children: [
                    for (final product in productList)
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(product: product)));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(product.imagePath))),
                              ),
                              Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Icon(
                                    Icons.favorite,
                                    color: product.isFavorite
                                        ? Colors.red
                                        : Colors.white,
                                  ))
                            ]),
                            Text(
                              product.title,
                              style: TextStyle(
                                  color: state.isLight
                                      ? Colors.black
                                      : Colors.white),
                            ),
                            Text(
                              '\$${product.price}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: state.isLight
                                      ? Colors.black
                                      : Colors.white),
                            )
                          ],
                        ),
                      )
                  ])
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      trailing: Switch(
                          value: state.isLight,
                          onChanged: (val) {
                            state.changeTheme();
                          }),
                      title: Consumer<LangState>(
                          builder: (context, langState, _) =>
                              Text(langState.lang == 'en' ? 'Theme' : 'Tema')),
                    ),
                    Consumer<LangState>(
                      builder: (context, langState, _) => ListTile(
                        leading: GestureDetector(
                          onTap: () {
                            langState.changeLang(
                                langState.lang == 'tr' ? 'en' : 'tr');
                          },
                          child: const Icon(
                            Icons.change_circle,
                            color: Colors.green,
                          ),
                        ),
                        title: Text(
                          langState.lang == 'en'
                              ? 'Language ${langState.lang}'
                              : 'Dil ${langState.lang}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.more_vert),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Eva Collins',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200),
                                      child: const Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Center(
                                          child: Text(
                                            '4 orders',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Consumer<LangState>(
                                      builder: (context, langState, _) => Text(
                                        langState.lang == 'en'
                                            ? 'Verified Profile'
                                            : 'Doğrulanmış Profil',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 12,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer<LangState>(
                      builder: (context, langState, _) => ListTile(
                        leading: const Icon(Icons.info),
                        title: Text(langState.lang == 'en'
                            ? 'Account Information'
                            : 'Profil Bilgileri'),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MyCardsScreen()));
                      },
                      leading: const Icon(Icons.wallet),
                      title: Consumer<LangState>(
                          builder: (context, langState, _) => Text(
                              langState.lang == 'en'
                                  ? 'My Cards'
                                  : 'Kartlarım')),
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite),
                      title: Consumer<LangState>(
                          builder: (context, langState, _) => Text(
                              langState.lang == 'en'
                                  ? 'Wishlist'
                                  : 'İstek Listesi')),
                    ),
                    ListTile(
                      leading: const Icon(Icons.question_mark),
                      title: Consumer<LangState>(
                          builder: (context, langState, _) => Text(
                              langState.lang == 'en'
                                  ? 'Help Center'
                                  : 'Yardım Merkezi')),
                    ),
                    ListTile(
                      leading: const Icon(Icons.policy),
                      title: Consumer<LangState>(
                          builder: (context, langState, _) => Text(
                              langState.lang == 'en'
                                  ? 'Privacy Policy'
                                  : 'Hizmet Şartları')),
                    )
                  ],
                ),
                isLoggedIn
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            isLoggedIn = false;
                          });
                        },
                        child: ListTile(
                          leading: const Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          title: Consumer<LangState>(
                            builder: (context, langState, _) => Text(
                              langState.lang == 'en' ? 'Logout' : 'Çıkış Yap',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                        },
                        child: ListTile(
                          leading: const Icon(
                            Icons.login,
                            color: Colors.blue,
                          ),
                          title: Consumer<LangState>(
                            builder: (context, langState, _) => Text(
                              langState.lang == 'en' ? 'Login' : 'Giriş Yap',
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                ),
                label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: 'My Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Profile')
          ],
          currentIndex: 0,
          selectedItemColor: Colors.cyan,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            //Do nothing
          },
        ),
      ),
    ));
  }
}
