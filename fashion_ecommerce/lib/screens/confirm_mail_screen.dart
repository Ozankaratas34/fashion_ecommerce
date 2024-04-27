import 'package:fashion_ecommerce/lang_state.dart';
import 'package:fashion_ecommerce/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmMailScreen extends StatelessWidget {
  const ConfirmMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Consumer<LangState>(
        builder: (context, langState, _) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    langState.lang == 'en'
                        ? 'Verification Code'
                        : 'Doğrulama Kodu',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'lib/assets/images/forgot-password.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: TextEditingController(),
                              decoration: InputDecoration(
                                  enabled: false,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "0"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: TextField(
                              enabled: false,
                              textAlign: TextAlign.center,
                              controller: TextEditingController(),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "0"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: TextEditingController(),
                              decoration: InputDecoration(
                                  enabled: false,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "0"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: TextEditingController(),
                              decoration: InputDecoration(
                                  enabled: false,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "0"),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '00:20',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          langState.lang == 'en'
                              ? 'resend confirmation code'
                              : 'kodu tekrar gönder',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    )),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.cyan),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: Text(
                          langState.lang == 'en'
                              ? 'Confirm Code'
                              : 'Kodu Doğrula',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
