import 'package:flutter/material.dart';

class CountrySelector extends StatefulWidget {
  CountrySelector({super.key});

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  @override
  // void initState() {
  //   getCountryDetails(context);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SafeArea(
          child: Column(
            children: const [
              Text('reached'),
            ],
          ),
        ),
      ),
    );
  }

  // void getCountryDetails(BuildContext context) async {
  //   Locale locale = Localizations.localeOf(context);
  //   var format = NumberFormat.simpleCurrency(locale: locale.toString());
  //   print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
  //   print("CURRENCY NAME ${format.currencyName}"); // USD
  // }
}
