import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:plus_geo/view/Tela_Anotacao_Screen/Crud.dart';
import 'package:plus_geo/view/Tela_Welcome_Screen/components/brand_image.dart';
import 'package:plus_geo/view/Tela_Welcome_Screen/components/brand_title.dart';
import 'package:plus_geo/view/Tela_Welcome_Screen/components/buttons/default_text_button.dart';
import 'package:plus_geo/view/Tela_Welcome_Screen/components/checkBox.dart';
import 'package:plus_geo/view/Tela_Welcome_Screen/dados/Welcome_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatelessWidget {
  
  bool _checkedBoxValue = false;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea( 
        child: Column(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // BrandTitleWidget(),
            // Center(child: Text('data')),
            SizedBox(height: 20,),
            BrandImageWidget(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * .7,
            ),
            _buildBottomRow(context),
          ],
        )
        ),
    );
  }


_buildBottomRow(BuildContext context) {

  return Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      checkBoxWidget(
        onChanged: (value) { 
        _checkedBoxValue = value;
       },),
      DefaultTextButton(
        text: 'Avançar',
        textFontSize: 24,
        onPressed: () async {
          // print('_checkedBoxValue $_checkedBoxValue');
          var sp = await SharedPreferences.getInstance();
          var ds = WelcomeDataSource(sharedPreferences: sp);

          await ds.registerDontShowAgain(value: _checkedBoxValue);

          Navigator.push(context,
          MaterialPageRoute(builder: (context) => NewListPage()));
        },)
    ],
  );
}
}


