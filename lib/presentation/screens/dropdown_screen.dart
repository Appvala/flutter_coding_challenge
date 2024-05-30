import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/dropdown_bloc.dart';
import '../../bloc/dropdown_event.dart';
import '../../bloc/dropdown_state.dart';
import '../../../data/models/country.dart';
import '../../../data/models/state.dart';
import '../widgets/custom_dropdown_widget.dart';
import 'summary_screen.dart';

class DropdownScreen extends StatefulWidget {
  const DropdownScreen({super.key});

  @override
  DropdownScreenState createState() => DropdownScreenState();
}

class DropdownScreenState extends State<DropdownScreen> {
  CountryModel? selectedCountry;
  StateModel? selectedState;

  @override
  void initState() {
    super.initState();
    final DropdownBloc dropdownBloc = BlocProvider.of<DropdownBloc>(context);
    dropdownBloc.add(FetchCountries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdowns'),
        centerTitle: true,
      ),
      body: BlocBuilder<DropdownBloc, DropdownState>(
        builder: (context, state) {
          // print('Current state: $state');
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                CustomDropdown<CountryModel>(
                  hint: selectedCountry == null
                      ? 'Select Country'
                      : selectedCountry!.value,
                  value: selectedCountry,
                  items: state.countries ?? [],
                  getItemLabel: (CountryModel country) => country.value,
                  getDropDownItemValue: (CountryModel country) =>
                      country.id.toString(),
                  onChanged: (CountryModel? country) {
                    // print('Fetching states for country: ${country?.value}');
                    final DropdownBloc dropdownBloc =
                        BlocProvider.of<DropdownBloc>(context);
                    if (country != null) {
                      dropdownBloc.add(FetchStates(country.id));
                      setState(() {
                        selectedCountry = country;
                        selectedState = null; // Reset selected state
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),
                if (state.states != null)
                  CustomDropdown<StateModel>(
                    hint: selectedState == null
                        ? 'Select State'
                        : selectedState!.value,
                    value: selectedState,
                    items: state.states ?? [],
                    getItemLabel: (StateModel state) => state.value,
                    getDropDownItemValue: (StateModel state) =>
                        state.id.toString(),
                    onChanged: (StateModel? state) {
                      setState(() {
                        selectedState = state;
                      });
                    },
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Background color
                    foregroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (selectedCountry != null && selectedState != null) {
                      Navigator.pushNamed(
                        context,
                        SummaryScreen.routeName,
                        arguments: {
                          'country': selectedCountry,
                          'state': selectedState,
                        },
                      );
                    } else {
                      const snackBar = SnackBar(
                        content:
                        Text('Please select both a country and a state.'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
