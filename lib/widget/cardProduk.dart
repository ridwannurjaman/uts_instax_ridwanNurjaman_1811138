import 'package:flutter/material.dart';
import 'package:uts_instax_ridwannurjaman_18111138/models/modelProduk.dart';
import 'package:uts_instax_ridwannurjaman_18111138/page/pages.dart';

class CardProduk extends StatelessWidget {
  ModelProduk model;
  CardProduk(this.model);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailProduk(
                        model: model,
                      )),
            );
          },
          child: Container(
            height: 150,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            margin: new EdgeInsets.only(right: 30.0, top: 12),
            decoration: BoxDecoration(
              color: model.warna,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Limited Edition', style: TextStyle(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Instax ',
                      style: TextStyle(color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Mini " + model.nama + " 7+",
                            style: TextStyle(fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: RichText(
                    text: TextSpan(
                      text: '\$ ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                            text: model.harga,
                            style: TextStyle(fontWeight: FontWeight.w900)),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailProduk(model: model)),
                    );
                  },
                  child: Text(
                    'Buy',
                    style: TextStyle(color: model.warna),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // <-- Radius
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
            margin: new EdgeInsets.fromLTRB(0, 35, 0, 0),
            alignment: FractionalOffset.centerRight,
            child: Image.asset(model.image, height: 100)),
      ],
    );
  }
}
