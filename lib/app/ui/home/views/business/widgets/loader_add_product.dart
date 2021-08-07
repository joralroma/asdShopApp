import 'package:flutter/material.dart';

// Utils
import 'package:asdshop/app/utils/responsive.dart';

class AddProductLoader extends StatefulWidget {
  AddProductLoader({Key? key}) : super(key: key);

  @override
  _AddProductLoaderState createState() => _AddProductLoaderState();
}

class _AddProductLoaderState extends State<AddProductLoader> with SingleTickerProviderStateMixin {

  late AnimationController controllerOne;
  late Animation<Color?> animationOne;
  late  Animation<Color?> animationTwo;

  @override
  void initState() {
    super.initState();
    controllerOne = AnimationController( duration: Duration(milliseconds: 2000), vsync: this);
    animationOne = ColorTween(begin: Colors.grey, end: Colors.white70).animate(controllerOne);
    animationTwo = ColorTween(begin: Colors.white70,end: Colors.grey).animate(controllerOne);
    controllerOne.forward();
    controllerOne.addListener((){
      if(controllerOne.status == AnimationStatus.completed){
        controllerOne.reverse();
      } else if(controllerOne.status == AnimationStatus.dismissed){
        controllerOne.forward();
      }
      this.setState((){});
    });
  }

  @override
  void dispose() {
    controllerOne.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect){
        return LinearGradient(
            tileMode: TileMode.mirror,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [animationOne.value!, animationTwo.value!]).createShader(rect,textDirection: TextDirection.ltr);
      },
      child:  LoadingAddProduct()
    );
  }

}

class LoadingAddProduct extends StatelessWidget {

  const LoadingAddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Center(
              child: _buildLine(width: _responsive.wp(70), height: 10),
            ),
            const SizedBox(height: 60),
            Center(child: _buildLine(width: _responsive.wp(80), height: 50)),
            const SizedBox(height: 30),
            Center(child: _buildLine(width: _responsive.wp(80), height: 50)),
            const SizedBox(height: 30),
            Center(child: _buildLine(width: _responsive.wp(80), height: 50)),
            const SizedBox(height: 30),
            Center(child: _buildLine(width: _responsive.wp(80), height: 50)),
            const SizedBox(height: 30),
            Center(child: _buildLine(width: _responsive.wp(80), height: 50)),
            const SizedBox(height: 30),
            Center(child: _buildLine(width: _responsive.wp(80), height: 50)),
            const SizedBox(height: 30),
            Center(child: _buildLine(width: _responsive.wp(80), height: 50)),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }


  Widget _buildLine({double width = 50.0, double height = 5.0}) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  Widget _buildProduct(Responsive responsive) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Colors.white
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLine(width: responsive.width - 260),
              const SizedBox(height: 10),
              _buildLine(width: responsive.width - 250),
              const SizedBox(height: 10),
              _buildLine(width: responsive.width - 230),
              const SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }

}