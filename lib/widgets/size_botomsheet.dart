import 'package:flutter/material.dart';

class SizeBottomSheet extends StatefulWidget {
  String? productSize;
  Function setTheState;
  SizeBottomSheet(
      {super.key, required this.productSize, required this.setTheState});

  @override
  State<SizeBottomSheet> createState() => _SizeBottomSheetState();
}

class _SizeBottomSheetState extends State<SizeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375,
      child: Column(children: [
        const SizedBox(height: 30),
        Text('Select size', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 15),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [salectSize("XS"), salectSize("S"), salectSize("M")]),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          salectSize("L"),
          salectSize("Xl"),
          const SizedBox(
            width: 100,
            height: 40,
          )
        ]),
        const SizedBox(height: 15),
        const Divider(),
        ListTile(
          title:
              Text('Size info', style: Theme.of(context).textTheme.bodyLarge),
          trailing: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios, size: 15)),
        ),
        const Divider(),
        const SizedBox(height: 15),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(343, 48),
                shadowColor: Theme.of(context).colorScheme.primary,
                elevation: 8, //Shadow radius
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Text('Save Info',
                style: Theme.of(context).textTheme.bodyMedium)),
      ]),
    );
  }

  InkWell salectSize(String childText, {double? w, double? h, Color? c}) {
    return InkWell(
      onTap: () {
        widget.productSize = childText;
        widget.setTheState();
      },
      child: Container(
          width: w ?? 100,
          height: h ?? 40,
          decoration: BoxDecoration(
              color: c ?? Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xffABB4BD))),
          child: Center(child: Text(childText))),
    );
  }
}
