import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';
import 'package:plus_geo/view/Tela_Anotacao_Screen/Crud.dart';
import 'package:plus_geo/view/Tela_Welcome_Screen/Welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Tela_Welcome_Screen/dados/Welcome_datasource.dart';



class BlockScreen extends StatefulWidget {
  const BlockScreen({Key? key}) : super(key: key);

  @override
  State<BlockScreen> createState() => _BlockScreenState();
}

class _BlockScreenState extends State<BlockScreen> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

    @override
    initState() {
    super.initState();
    authenticate();
  }

   authenticate() async {
    if (await _isBiometricAvailable()) {
      await _getListOfBiometricTypes();
      await _authenticateUser();
    }
  }

  Future<bool> _isBiometricAvailable() async {
    bool _isAvailable = await _localAuthentication.canCheckBiometrics;
    // setState(() {
    //   status = "Verificando disponibilidade de Biometria";
    // });
     return _isAvailable;
  }

  Future<void> _getListOfBiometricTypes() async {
    List<BiometricType> ListOfBiometrics = 
    await _localAuthentication.getAvailableBiometrics(); 
  }

  Future<void> _authenticateUser() async {
    final isAuthenticated =
        await _localAuthentication.authenticate(
      localizedReason: "Use a biometria para prosseguir",
      options: const AuthenticationOptions(
       useErrorDialogs: true,
       stickyAuth: true,
      ),
     
    );

    if (isAuthenticated) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => 
       FutureBuilder(
        future: _buildHome(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return snapshot.data;
          }

          return Container();
        },
       )
      ));
      // .push(
      //   MaterialPageRoute(
      //     builder: (context) => NoteListPage(),
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Autentique-se'),),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 3,),
          Center(child: Text('Bem Vindo ao Seu App de anotações!'),),
          SizedBox(height: 10),
          ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 230, height: 60),
              child: ElevatedButton.icon(
                
                onPressed: () => _authenticateUser(),
                icon: Icon(Icons.fingerprint, size: 40),
                
                label: Text('Toque aqui! para se autenticar', style: TextStyle(fontSize: 15)),
              ),
            ),
            SizedBox(height: 3,)
        ],

      ),

      //  Container(
      //   color: Colors.white10,
      //   child: Center(
      //     child: Text('Use a digital para prosseguir'),

      //   ),
      // ),
    );
  }

  Future<Widget> _buildHome() async {
    // return WelcomePage();
    
    var sp = await SharedPreferences.getInstance();
    var ds = WelcomeDataSource(sharedPreferences: sp);

    if(ds.getDontShowAgain()) {
      return NewListPage();
    }

    return WelcomePage();
  }
}