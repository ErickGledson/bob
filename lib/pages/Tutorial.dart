import 'package:bob/pages/Home.dart';
import 'package:bob/utils/CustomColors.dart';
import 'package:bob/utils/Screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Tutorial extends StatefulWidget {
  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Screen.width(context),
          height: Screen.height(context),
          margin: EdgeInsets.symmetric(vertical: 30),
          child: column(context),
        ),
      ),
    );
  }

  Widget column(context) {
    return Column(
      children: [
        slider(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sliderDot(0),
            sliderDot(1),
            sliderDot(2),
          ],
        ),
        Container(
          width: Screen.width(context) * .6,
          child: RaisedButton(
            color: CustomColors.primary.withOpacity(_current == 2 ? 1 : 0.7),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (_) => Home()
              ));
            },
            child: Text(
              'Acessar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget slider(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
          child: CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (BuildContext ctx, int itemIndex) {
          switch (itemIndex) {
            case 0:
              return sliderOne(context);
            case 1:
              return sliderTwo(context);
            case 2:
              return sliderThree(context);
          }

          return sliderOne(context);
        },
        options: CarouselOptions(
            height: 400,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            reverse: false,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
    );
  }

  Widget sliderDot(position) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: CustomColors.primary.withOpacity(_current == position ? 0.9 : 0.4),
      ),
    );
  }

  Widget sliderOne(context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: 'Este é o',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Bob',
                    style: TextStyle(
                      color: CustomColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
          ),
          SizedBox(height: Screen.height(context) * 0.1),
          Container(
            alignment: Alignment.center,
            child: Lottie.asset(
              'assets/bobCoffee.json',
              height: Screen.height(context) * 0.3,
              width: Screen.width(context) * 0.6,
            ),
          ),
          SizedBox(height: Screen.height(context) * 0.1),
          RichText(
            text: TextSpan(
                text: 'O seu mais novo amigo \n',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'e consultor do seu cartão de crédito',
                    style: TextStyle(
                      color: CustomColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }

  Widget sliderTwo(context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: 'Ele vai ficar de olho em seus',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' gastos...',
                    style: TextStyle(
                      color: CustomColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
          ),
          SizedBox(height: Screen.height(context) * 0.1),
          Container(
            alignment: Alignment.center,
            child: Lottie.asset(
              'assets/bobIdle.json',
              height: Screen.height(context) * 0.3,
              width: Screen.width(context) * 0.6,
            ),
          ),
          SizedBox(height: Screen.height(context) * 0.1),
          RichText(
            text: TextSpan(
                text: 'E reagir de acordo \n',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'com o seu limite de crédito.',
                    style: TextStyle(
                      color: CustomColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }

    Widget sliderThree(context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: 'Espero que sejam bons',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' amigos.',
                    style: TextStyle(
                      color: CustomColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
          ),
          SizedBox(height: Screen.height(context) * 0.1),
          Container(
            alignment: Alignment.center,
            child: Lottie.asset(
              'assets/bobOk.json',
              height: Screen.height(context) * 0.3,
              width: Screen.width(context) * 0.6,
            ),
          ),
          SizedBox(height: Screen.height(context) * 0.1),
          RichText(
            text: TextSpan(
                text: 'E consigam controlar os gastos \n',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'juntos.',
                    style: TextStyle(
                      color: CustomColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }

}
