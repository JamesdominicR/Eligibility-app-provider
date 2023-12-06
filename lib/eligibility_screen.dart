import 'package:eligibility_app_provider/eligibility_screen_provider.dart';
import 'package:eligibility_app_provider/example_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EligibilityScreen extends StatelessWidget {
  EligibilityScreen({super.key});
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EligibilityScreenProvider>(
      create: (context) => EligibilityScreenProvider(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Consumer<EligibilityScreenProvider>(
                  builder: (context, provider, _) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (provider.isEligible == null)
                              ? Colors.orangeAccent
                              : provider.isEligible
                                  ? Colors.green
                                  : Colors.red),
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: ageController,
                      decoration: const InputDecoration(
                        hintText: "Give your age",
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        child: const Text(
                          "Check",
                          style: TextStyle(
                              backgroundColor: Colors.blue,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          final int age = int.parse(ageController.text.trim());
                          provider.checkEligibility(age);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(provider.eligibilityMessage),
                    IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ExampleCard()));
                        // 1.showCurrencyPicker(
                        //   context: context,
                        //   showFlag: false,
                        //   showCurrencyName: true,
                        //   showCurrencyCode: true,
                        //   onSelect: (Currency currency) {
                        //     print('Select currency: ${currency.name}');
                        //     print('select currency:${currency.number}');
                        //   },
                        // );
                        getCountryDetails(context);
                        // getCurrencyInfo('+91');
                        //getCountryDetails(context, '+91');
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => CountrySelector()));
                      },
                    ),
                  ],
                );
              }),
            ),
          ),
        );
      }),
    );
  }

//Todo: using intl package
//Todo:1
  void getCountryDetails(BuildContext context) async {
    Locale locale = Localizations.localeOf(context);
    var format = NumberFormat.simpleCurrency(locale: locale.toString());
    print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
    print("CURRENCY NAME ${format.currencyName}"); // USD
  }

  // void getCountryDetails(BuildContext context, String countryCode) async {
  //   // final systemLocale = await findSystemLocale();
  //   final locales =
  //       Locale.fromSubtags(countryCode: countryCode, languageCode: 'en');
  //   final format = NumberFormat.simpleCurrency(
  //       locale: locales.toString(), name: countryCode);
  //   final currencySymbol = format.currencySymbol;
  //   final currencyName = format.currencyName;
  //   // Locale locale = Localizations.localeOf(context);
  //   // var format = NumberFormat.simpleCurrency(locale: locale.toString());
  //   // print(format.locale);
  //   print("CURRENCY SYMBOL ${currencySymbol}"); // $
  //   print("CURRENCY NAME ${currencyName}"); // USD
  // }

  //Todo: using countrypicker

//Todo: using country_currency_picker
  // Future<String> showCurrencyPicker(BuildContext context) async {
  //   final country = await showCountryPickerDialog(context);
  //   if (country != null) {
  //     final currency =
  //         await showCurrencyPickerDialog(context, country: country);
  //     if (currency != null) {
  //       return '${currency.symbol} (${currency.isoCode})';
  //     }
  //   }
  //   return 'No currency selected';
  // }
  //Todo: using currency picker
}
