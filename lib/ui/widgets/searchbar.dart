import 'package:flutter/material.dart';
import 'package:yumyum_amicta/shared/theme.dart';


// class CustomSearchBar2 extends StatelessWidget {
//   final String search;
//   final double width;
//   const CustomSearchBar( {
//     required this.search,
//     this.width = 275,
//     super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: greyColor)
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.search_outlined, color: greyColor,),
//           const SizedBox(width: 10,),
//           Text(search, style: greyTextStyle.copyWith(),)
//         ],
//       ),
//     );
//   }
// }

class CustomSearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;

  CustomSearchBar({
    required this.controller,
    this.onChanged,
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool showClearIcon = false;
  late final VoidCallback _controllerListener;

  @override
  void initState() {
    super.initState();
    _controllerListener = () {
      if (mounted) {
        setState(() {
          showClearIcon = widget.controller!.text.isNotEmpty;
        });
      }
    };
    widget.controller!.addListener(_controllerListener);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: whiteColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: greyColor)
          ),
          hintText: "What are you craving?",
          prefixIcon: const Icon(Icons.search_outlined),
          prefixIconColor: greyColor,
          suffixIcon: showClearIcon ? IconButton(onPressed: (){
            widget.controller!.clear();
          }, icon: Icon(Icons.clear_outlined, size: 20,)) : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 10)
        ),
      ),
    );
  }
}
