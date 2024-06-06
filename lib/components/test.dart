// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';

// class TestWidget extends StatefulWidget {
//   const TestWidget({super.key});

//   @override
//   State<TestWidget> createState() => _TestWidgetState();
// }

// class _TestWidgetState extends State<TestWidget> {
//   final List<String> _currencies = ["Food", "Transport", "Personal", "Shopping", "Medical", "Rent", "Movie", "Salary"];
//   List<String> _filteredCurrencies = [];
//   // String? _currentSelectedValue;
//   bool isFocused = false;
//   TextEditingController _textController = TextEditingController();
//   FocusNode _focusNode = FocusNode();
//   Widget menu = const SizedBox(height: 0, width: 0);

//   void _onFocusChange() {
//     // print("Focus: ${_focusNode.hasFocus}");
//     setState(() => isFocused = !isFocused);
//     if (isFocused) {
//       setState(() {
//         menu = Card(
//           elevation: 8,
//           clipBehavior: Clip.antiAlias,
//           child: Container(
//             width: 100,
//             height: 300,
//             decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(16)),
//             child: ListView.builder(
//               itemCount: _currencies.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     print(index);
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Text(_currencies[index]),
//                   ),
//                 );
//               },
//             ),
//           ),
//         );
//       });
//     }
//     // else {
//     //   setState(() => menu = const SizedBox(height: 0, width: 0));
//     // }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(_onFocusChange);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _textController.dispose();
//     _focusNode.removeListener(_onFocusChange);
//     _focusNode.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       clipBehavior: Clip.none,
//       children: [
//         TextField(
//           controller: _textController,
//           onChanged: (value) {
//             print('TEXT: ${_textController.text}');
//             _filteredCurrencies = _currencies.where((element) => element.contains(_textController.text)).toList();
//             print(_filteredCurrencies);
//           },
//           decoration: InputDecoration(
//             label: Text('Select Category', style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.onPrimary, fontSize: 16)),
//             filled: true,
//             fillColor: Theme.of(context).colorScheme.primary,
//             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.65)), borderRadius: BorderRadius.circular(10)),
//             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary), borderRadius: BorderRadius.circular(10)),
//           ),
//           focusNode: _focusNode,
//         ),
//         Positioned(top: 60, child: menu)
//       ],
//     );
//   }
// }
