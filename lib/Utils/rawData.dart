import 'package:flutter/material.dart';

List selectedServices = [];
List modelsList=['Sedan','Coupe','Hatchback',

'SUV',
  'MUV',
  'Bike'
];

List modelIcons=[
  'sedan',
  'coupe',
  'hatchback',
  'suv',
  'suv',
  'suv'
];

Map<String, List<String>> slots = {
  'NOV 17': ['11 AM', '1 PM', '3 PM', '4 PM', '11 AM'],
  "NOV 23": ["10 AM", "11 AM"],
  "NOV 25": ["1 PM", "3 PM", "4 PM"],
  "NOV 27": ["1 PM", "3 PM", "4 PM"],
  "NOV 29": ["1 PM", "3 PM", "4 PM"]
};

List services = ['Ceramic Coating', 'Express Washing', 'Wash'
'Schedule Service',
  'AC Service',
  'Wheel Care',
  'Custom Repair'
];

List settings =[
  "Profile Information",
  "Saved Payments",
  "Saved Vehicles",
  "Languages",
  "Help",
"About",
      "Logout"];
List settingsSub=[
  "Update your Account Settings",
  "Your Saved Payments Methods",
  "Your Saved Vehicle Details",
  "Select Languages",
  "Support and Contact Us",
  "About us.",
  "Logout"
];
List settingIcons = [
  Icons.person,
  Icons.book,
  Icons.directions_car,
  Icons.language,
  Icons.chat,
  Icons.info,
  Icons.settings_backup_restore
];