import 'package:bob/model/CostItem.dart';
import 'package:bob/pages/Detail.dart';
import 'package:bob/utils/CustomColors.dart';
import 'package:bob/utils/Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
    @override
    _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    double _creditCardLimit = 1000.00;
    double _creditCardLimitTotal = 1000.00;
    int _creditCardAmount = 1000;
    String _bobAnimation = 'assets/bobOk.json';

    List<CostItem> _costItems = [
        new CostItem(1, 'iRango', 30.00, 'food'),
        new CostItem(2, 'iRango', 57.00, 'food'),
        new CostItem(3, 'Curso de Flutter', 30.00, 'education'),
        new CostItem(4, 'Academia S/A', 57.00, 'health'),
        new CostItem(5, 'Urbi', 30.00, 'transport'),
        new CostItem(6, 'Mc Ronaldo', 57.00, 'food'),
        new CostItem(7, 'Curso de NodeJs', 30.00, 'education'),
        new CostItem(8, 'Urbi', 57.00, 'transport'),
        new CostItem(9, 'Farmácia Coração', 30.00, 'health'),
        new CostItem(10, 'Burguer Rei', 57.00, 'food'),
    ];

    @override
    void initState() {
        super.initState();
        setState(() {
            _creditCardAmount = _costItems.map<int>((m) =>
                int.parse(m.amount.floor().toString())).reduce((a, b) => a + b);

            _creditCardLimit = _creditCardLimitTotal - _creditCardAmount;

            if (_creditCardAmount <= 0) _creditCardAmount = 1000;

            if (_creditCardAmount > _creditCardLimitTotal * 0.75) {
                _bobAnimation = 'assets/bobOk.json';
            } else if (_creditCardAmount >= _creditCardLimitTotal * 0.3 &&
                _creditCardAmount <= _creditCardLimitTotal * 0.75) {
                _bobAnimation = 'assets/bobIdle.json';
            } else {
                _bobAnimation = 'assets/bobDeath.json';
            }
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        width: Screen.width(context),
                        child: Column(
                            children: [
                                usernameAndCreditCardLimit(context),
                                SizedBox(height: Screen.height(context) * 0.05),
                                bob(context),
                                SizedBox(height: Screen.height(context) * 0.03),
                                observationText(context),
                                SizedBox(height: Screen.height(context) * 0.05),
                                categories(context),
                                SizedBox(height: Screen.height(context) * 0.05),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }

    Widget bob(context) {
        return GestureDetector(
            onTap: () {
                setState(() {
                    _creditCardAmount = _creditCardAmount - 100;

                    _creditCardLimit = _creditCardLimitTotal - _creditCardAmount;

                    if (_creditCardLimit > 1000) _creditCardLimit = 1000;
                    if (_creditCardAmount <= 0) _creditCardAmount = 1000;

                    if (_creditCardAmount > _creditCardLimit * 0.75) {
                        _bobAnimation = 'assets/bobOk.json';
                    } else if (_creditCardAmount >= _creditCardLimit * 0.3 &&
                        _creditCardAmount <= _creditCardLimit * 0.75) {
                        _bobAnimation = 'assets/bobIdle.json';
                    } else {
                        _bobAnimation = 'assets/bobDeath.json';
                    }
                });
            },
            child: Container(
                child: Lottie.asset(
                    _bobAnimation,
                    height: Screen.height(context) * 0.3,
                    width: Screen.width(context) * 0.6,
                ),
            ),
        );
    }

    Widget usernameAndCreditCardLimit(context) {
        return Container(
            alignment: Alignment.bottomLeft,
            child: RichText(
                text: TextSpan(
                    text: 'Olá, ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22,
                    ),
                    children: <TextSpan>[
                        TextSpan(
                            text: 'Erick! \n',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                        TextSpan(
                            text:
                            'Seu limite é de R\$${_creditCardLimit
                                .toStringAsFixed(2).replaceAll('.', ',')}',
                            style: TextStyle(
                                color: CustomColors.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                        TextSpan(
                            text: '\nValor da próxima fatura \n',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.3),
                            ),
                        ),
                        TextSpan(
                            text:
                            'R\$${_creditCardAmount.toStringAsFixed(2)
                                .replaceAll('.', ',')}',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.3),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                    ]),
            ),
        );
    }

    Widget observationText(context) {
        return Container(
            child: Text(
                'Continue economizando e mantenha o Bob feliz',
                style: TextStyle(color: Colors.black.withOpacity(0.4)),
            ),
        );
    }

    Widget categories(context) {
        return Container(
            width: Screen.width(context),
            height: Screen.height(context) * 0.2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                        'Gastos',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.6),
                        ),
                    ),
                    SizedBox(height: Screen.height(context) * 0.02),
                    Expanded(
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                                categoriesItems(
                                    context, 'Todos', AntDesign.wallet,
                                    Colors.black54, 'all'),
                                categoriesItems(
                                    context, 'Alimentação', Icons.fastfood,
                                    Colors.red, 'food'),
                                categoriesItems(
                                    context, 'Educação', Icons.school,
                                    Colors.deepOrangeAccent, 'education'),
                                categoriesItems(
                                    context, 'Saúde', FontAwesome.heartbeat,
                                    Colors.blueAccent, 'health'),
                                categoriesItems(
                                    context, 'Transporte', FontAwesome.bus,
                                    Colors.indigoAccent, 'transport'),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }

    Widget categoriesItems(context, text, icon, color, category) {
        return GestureDetector(
            onTap: () {
                var items = category == "all" ? _costItems : _costItems.where((
                    i) => i.category.contains(category)).toList();
                Navigator.push(context, MaterialPageRoute(builder: (_) =>
                    Detail(
                        color: color,
                        items: items,
                        name: text,
                    )));
            },
            child: Container(
                width: Screen.width(context) * 0.25,
                margin: EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Icon(
                            icon,
                            color: Colors.white,
                            size: 30,
                        ),
                        Text(
                            text,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                            ),
                        ),
                    ],
                )),
        );
    }
}

