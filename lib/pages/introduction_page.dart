import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: _scaleHeight(570),
              child: PageView(
                controller: controller,
                children: [
                  _buildPage(
                      'assets/images/step1.png',
                      'Более 100 профессиональных и проверенных мастеров',
                      'Мастер свяжется с вами в течении 20 минут'),
                  _buildPage(
                    'assets/images/step2.png',
                    'Стоимость работы расчитывает приложение мастера',
                    'Вы можете выбрать почасовой или договорной способ оплаты',
                  ),
                  _buildPage(
                    'assets/images/step3.png',
                    'Самая низкая цена без потери качества',
                    'От 300 рублей за час или мелкую работу',
                  ),
                  _buildPage(
                    'assets/images/step4.png',
                    'Например: замена 2-х смесителей',
                    'Обычно: 1000-1500 руб. У нас: 500-700 рубю с выездом и покупкой материалов',
                  ),
                  _buildPage(
                    'assets/images/step5.png',
                    'Следите за мастером на карте',
                    'Вы знаете, где ваш мастер и когда он приедет в нужный день',
                  ),
                ],
              ),
            ),
            DotsIndicator(
                controller: controller,
                itemCount: 5,
                dotHeight: _scaleHeight(5),
                dotWidth: _scaleWidth(19)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: _scaleHeight(50),
            width: _scaleWidth(308) > 500 ? 500 : _scaleWidth(308),
            child: new FloatingActionButton(
                elevation: 0.0,
                backgroundColor: Color.fromRGBO(1, 127, 233, 1),
                child: Text(
                  'Дальше',
                  style: TextStyle(
                    fontSize: _scaleHeight(20),
                    fontFamily: 'SFProText-Semibold',
                    letterSpacing: -0.48,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                onPressed: () {
                  print('Taping Дальше');
                  controller.nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                }),
          ),
          SizedBox(
            height: _scaleHeight(50),
            width: _scaleWidth(308) > 500 ? 500 : _scaleWidth(308),
            child: Center(
              child: GestureDetector(
                child: Text(
                  'Пропустить',
                  style: TextStyle(
                    fontFamily: 'SFProText-Regular',
                    color: Color.fromRGBO(153, 153, 153, 1),
                    fontSize: _scaleHeight(20),
                    letterSpacing: -0.48,
                  ),
                ),
                onTap: () {
                  print('Taping Пропустить');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildPage(
      String imagePath,
      String blueText,
      String blackText) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(
            '$imagePath',
            height: _scaleHeight(280),
          ),
        ),
        _buildBlueString(blueText),
        _buildBlackString(blackText),
      ]),
    );
  }

  _buildBlueString(String text) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromRGBO(1, 127, 233, 1),
          fontFamily: 'SFProText-Medium',
          fontSize: _scaleHeight(30),
          letterSpacing: -0.72,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  _buildBlackString(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'SFProText-Regular',
        letterSpacing: -0.48,
        color: Color.fromRGBO(0, 0, 0, 1),
        fontSize: _scaleHeight(20),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  double _scaleHeight(double value) {
    return MediaQuery.of(context).size.height / 800 * value;
  }

  double _scaleWidth(double value) {
    return MediaQuery.of(context).size.width / 400 * value;
  }
}

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.dotHeight,
    required this.dotWidth,
  }) : super(listenable: controller);

  final PageController controller;
  final int itemCount;
  final double dotHeight;
  final double dotWidth;

  Widget _buildDot(int index) {
    Color _blueColor = Color.fromRGBO(1, 127, 233, 1);
    return new Container(
      margin: EdgeInsets.all(dotHeight),
      width: dotWidth,
      height: dotHeight,
      color: controller.page == null && index == 0
          ? _blueColor
          : controller.page == index
              ? _blueColor
              : Colors.grey,
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
