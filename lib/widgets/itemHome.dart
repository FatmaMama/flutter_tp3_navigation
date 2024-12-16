import 'package:flutter/material.dart';

class ItemHome extends StatelessWidget {
  const ItemHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        ListTile(
          title: Text("600dt par mois"),
          subtitle: Text("S+1, 50m"),
          trailing: Icon(Icons.favorite_outline),
        ),
        Container(
          child: Image.asset("assets/house.jpg"),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: OverflowBar(
            children: [
              TextButton(
                  onPressed: () => {},
                  child: Text("Vérifier la disponibilité")),
              TextButton(onPressed: () => {}, child: Text("Contactez nous"))
            ],
          ),
        )
      ]),
    );
  }
}
