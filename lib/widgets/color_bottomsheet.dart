import 'package:flutter/material.dart';

class ColorBottomSheet extends StatelessWidget {
  const ColorBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375,
      child: Column(children: [
        const SizedBox(height: 30),
        Text('Select size', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 15),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          sizeandColorContainer("Blue"),
          sizeandColorContainer("Black"),
          sizeandColorContainer("White")
        ]),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          sizeandColorContainer("Red"),
          sizeandColorContainer("Purpal"),
          const SizedBox(
            width: 100,
            height: 40,
          )
        ]),
        const SizedBox(height: 15),
        const Divider(),
        ListTile(
          title:
              Text('Color info', style: Theme.of(context).textTheme.bodyLarge),
          trailing: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios, size: 15)),
        ),
        const Divider(),
        const SizedBox(height: 15),
        ElevatedButton(
            onPressed: () {},
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

  Container sizeandColorContainer(String childText,
      {double? w, double? h, Color? c}) {
    return Container(
        width: w ?? 100,
        height: h ?? 40,
        decoration: BoxDecoration(
            color: c ?? Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffABB4BD))),
        child: Center(child: Text(childText)));
  }
}
