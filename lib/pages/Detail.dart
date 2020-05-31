import 'package:bob/model/CostItem.dart';
import 'package:bob/utils/CustomColors.dart';
import 'package:bob/utils/Screen.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {

    String name;
    Color color;
    List<CostItem> items;

    Detail({ Key key, this.items, this.color, this.name }) : super(key: key);

    @override
    _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            IconButton(
                                icon: Icon(Icons.close,
                                    color: Colors.black.withOpacity(0.3),),
                                onPressed: () {
                                    Navigator.pop(context);
                                },
                            ),
                            investiment(context),
                            costList(context)
                        ],
                    ),
                ),
            ),
        );
    }

    Widget costList(context) {
        return Expanded(
            child: ListView.builder(
                itemCount: this.widget.items.length,
                itemBuilder: (_, index) {
                    CostItem item = this.widget.items[index];
                    return ListTile(
                        title: Text(item.name),
                        leading: Text(
                            'R\$${item.amount.toStringAsFixed(2).replaceAll(
                                '.', ',')}',
                            style: TextStyle(
                                color: CustomColors.primary,
                                fontWeight: FontWeight.bold,
                            ),),
                    );
                },
            ),
        );
    }

    Widget investiment(context) {
        var amount = this.widget.items.map<int>((m) =>
            int.parse(m.amount.floor().toString())).reduce((a, b) => a + b);
        return Container(
            width: Screen.width(context),
            height: Screen.height(context) * 0.3,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    RichText(
                        text: TextSpan(
                            text: 'Você gastou\n',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.3),
                                fontSize: 16
                            ),
                            children: [
                                TextSpan(
                                    text: 'R\$${amount.toString()}',
                                    style: TextStyle(
                                        color: CustomColors.primary,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                    )
                                )
                            ]
                        ),
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Mesmo valor investido *\n',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.3),
                                fontSize: 12
                            ),
                            children: [
                                TextSpan(
                                    text: 'R\$${(amount * 1.05).toString()}',
                                    style: TextStyle(
                                        color: CustomColors.primary.withOpacity(
                                            0.6),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                    )
                                )
                            ]
                        ),
                    ),
                ],
            ),
        );
    }

}
