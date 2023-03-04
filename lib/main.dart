import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button_widget.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //백그라운드 컬러
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //아래의 텍스트들이 휴대폰 위에 배치되는걸 막는다.
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hey, Selena',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                              //투명옵션
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "\$5 194 482",
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ButtonWidget(
                      color: Color(0xFFF2B33A),
                      text: 'Transfer',
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    ButtonWidget(
                      color: Color(0xFF1F2123),
                      text: 'Request',
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Wallets",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                      ),
                    ),
                    Text("View All",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                const CurrencyCard(
                  order: 0,
                  name: 'Euro',
                  code: 'EUR',
                  amount: '6 642',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                ),
                const CurrencyCard(
                  order: 3,
                  name: 'Bitcoin',
                  code: 'BTC',
                  amount: '9 223',
                  icon: Icons.currency_bitcoin,
                  isInverted: true,
                ),
                const CurrencyCard(
                  order: 6,
                  name: 'Dollar',
                  code: 'US',
                  amount: '6 642',
                  icon: Icons.attach_money_outlined,
                  isInverted: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
