import 'package:flutter/material.dart';

class CountryCodeDropdown extends StatefulWidget {
  final Function(String) onChanged;

  const CountryCodeDropdown({Key? key, required this.onChanged}) : super(key: key);

  @override
  _CountryCodeDropdownState createState() => _CountryCodeDropdownState();
}

class _CountryCodeDropdownState extends State<CountryCodeDropdown> {
  String selectedCode = '+966';

  final List<String> codes = [
    '+962', '+966', '+971', '+965', '+968', '+973', '+974', '+20', '+961', '+963',
    '+964', '+967', '+970', '+212', '+213', '+216', '+218', '+249', '+252', '+222',
    '+269', '+253', '+1', '+44', '+33', '+49', '+39', '+34', '+1', '+61', '+91',
    '+86', '+81', '+82', '+55', '+52', '+7', '+27'
  ];

  @override
  Widget build(BuildContext context) {
    final double textScale = MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.2);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCode,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
          isExpanded: false,
          items: codes.map((code) {
            return DropdownMenuItem<String>(
              value: code,
              child: Text(
                code,
                textScaleFactor: textScale,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedCode = value!;
            });
            widget.onChanged(value!);
          },
        ),
      ),
    );
  }
}
