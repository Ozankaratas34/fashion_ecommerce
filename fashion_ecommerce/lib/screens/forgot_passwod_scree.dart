import 'package:fashion_ecommerce/lang_state.dart';
import 'package:fashion_ecommerce/screens/confirm_mail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                        ? 'Forgot Password'
                        : 'Şifremi unuttum',
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        langState.lang == 'en'
                            ? 'Email address'
                            : 'Email adresi',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: langState.lang == 'en'
                            ? 'Enter your email'
                            : 'Email adresinizi girin',
                        hintStyle: const TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    langState.lang == 'en'
                        ? 'Please write your email to receive a confirmation code to set a new password'
                        : 'Lütfen email adresinize gönderilen kodu girin',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ConfirmMailScreen()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.cyan),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: Text(
                          langState.lang == 'en'
                              ? 'Confirm Mail'
                              : 'Maili Doğrula',
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
