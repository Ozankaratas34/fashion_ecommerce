import 'package:fashion_ecommerce/lang_state.dart';
import 'package:fashion_ecommerce/screens/home_screen.dart';
import 'package:fashion_ecommerce/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Consumer<LangState>(
                  builder: (context, langState, _) => Column(
                    children: [
                      const SizedBox(height: 20),
                      Column(
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
                      const SizedBox(height: 100),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            langState.lang == 'en'
                                ? 'Username'
                                : 'Kullanıcı Adı',
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
                                    ? 'Enter your username'
                                    : 'Kullanıcı adınızı girin',
                                hintStyle: const TextStyle(color: Colors.grey)),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            langState.lang == 'en' ? 'Password' : 'Şifre',
                            style: const TextStyle(color: Colors.grey),
                          ),
                          TextField(
                            controller: TextEditingController(),
                            decoration: InputDecoration(
                                suffixText:
                                    langState.lang == 'en' ? 'strong' : 'güçlü',
                                suffixStyle:
                                    const TextStyle(color: Colors.green),
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                filled: true,
                                hintText: langState.lang == 'en'
                                    ? 'Enter your password'
                                    : 'Şifrenizi girin',
                                hintStyle: const TextStyle(color: Colors.grey)),
                          ),
                          const Text(
                            'Email',
                            style: TextStyle(color: Colors.grey),
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
                                    ? 'Enter your email address'
                                    : 'Email adresinizi girin',
                                hintStyle: const TextStyle(color: Colors.grey)),
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
                      const SizedBox(height: 40),
                      Column(
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
                                        ? 'Sign Up'
                                        : 'Kayıt Ol',
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
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            langState.lang == 'en'
                                ? 'Already have an account?'
                                : 'Zaten hesabın var mı?',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                            },
                            child: Text(
                              langState.lang == 'en' ? 'Signin' : 'Giriş Yap',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
