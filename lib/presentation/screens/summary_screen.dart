import 'package:flutter/material.dart';
import '../../../data/models/country.dart';
import '../../../data/models/state.dart';

class SummaryScreen extends StatelessWidget {
  static const routeName = '/summary';

  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final CountryModel selectedCountry = args['country'];
    final StateModel selectedState = args['state'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Selected Country :  ',
                style: const TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                      text: selectedCountry.value,
                      style: const TextStyle(
                          color: Colors.pink,
                          fontFamily: "Poppins",
                          fontSize: 22,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'Selected State :  ',
                style: const TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                      text: selectedState.value,
                      style: const TextStyle(
                          color: Colors.pink,
                          fontFamily: "Poppins",
                          fontSize: 22,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
