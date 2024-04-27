import 'package:fashion_ecommerce/lang_state.dart';
import 'package:fashion_ecommerce/screens/forgot_passwod_scree.dart';
import 'package:fashion_ecommerce/screens/home_screen.dart';
import 'package:fashion_ecommerce/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Consumer<LangState>(
                        builder: (context, langState, _) => Column(
                          children: [
                            Text(
                              langState.lang == 'en' ? 'Welcome' : 'Hoşgeldin',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text(
                              langState.lang == 'en'
                                  ? 'Please enter your data to continue'
                                  : 'Devam etmek için bilgilerinizi girin',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 120),
                      Consumer<LangState>(
                        builder: (context, langState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              langState.lang == 'en'
                                  ? 'Username'
                                  : 'Kullanıcı adı',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            TextField(
                              controller: TextEditingController(),
                              decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: langState.lang == 'en'
                                      ? 'Enter your email'
                                      : 'Email adresiniz',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey)),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              langState.lang == 'en' ? 'Password' : 'Şifre',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            TextField(
                              controller: TextEditingController(),
                              decoration: InputDecoration(
                                  suffixText: langState.lang == 'en'
                                      ? 'strong'
                                      : 'güçlü',
                                  suffixStyle:
                                      const TextStyle(color: Colors.green),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: langState.lang == 'en'
                                      ? 'Enter your password'
                                      : 'Şifrenizi girin',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey)),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ForgotPasswordScreen()));
                                  },
                                  child: Text(
                                    langState.lang == 'en'
                                        ? 'Forgot password?'
                                        : 'Şifreni mi unuttun?',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  langState.lang == 'en'
                                      ? 'Remember me'
                                      : 'Beni hatırla',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Switch(
                                    activeColor: Colors.white,
                                    activeTrackColor: Colors.green,
                                    value: true,
                                    onChanged: (val) {
                                      //Do nothing
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Consumer<LangState>(
                        builder: (context, langState, _) => Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Center(
                                    child: Text(
                                      langState.lang == 'en'
                                          ? 'Login'
                                          : 'Giriş Yap',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade800,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 26, vertical: 14),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.facebook,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            'Facebook',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 26, vertical: 14),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.golf_course,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            'Google',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Consumer<LangState>(
                        builder: (context, langState, _) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              langState.lang == 'en'
                                  ? 'No Account?'
                                  : 'Hesabın yok mu?',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                            ),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()));
                              },
                              child: Text(
                                langState.lang == 'en'
                                    ? 'Create a new one'
                                    : 'Hemen oluştur',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
