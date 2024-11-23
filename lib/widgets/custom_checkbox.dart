import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCheckbox extends StatefulWidget {
  final dynamic object;
  final Function(bool?) onChanged;
  
  const CustomCheckbox({super.key, required this.object, required this.onChanged});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.object.isDropDownMenu  ? GestureDetector(child: SvgPicture.asset('assets/dropdown.svg', width: 8.0, height: 8.0,), onTap: (){
          // implementacja dropdownu
        }) : const SizedBox(),
        const SizedBox(width: 15.0),
        Text(
          '${widget.object.name} ${widget.object.isSelected}',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500, fontSize: 16.0, 
            color: widget.object.isSelected ? Colors.blue.shade900 : Colors.black,
          ),
        ),
        const Spacer(),
        Checkbox(
          value: widget.object.isSelected,
          onChanged: (value) {
            setState(() {
              widget.onChanged(value); // Przekazanie wartości do głównego widgetu
            });
          },
        ),
      ],
    );
  }
}


