import 'package:flutter/material.dart';
import 'package:projet_final/models/videoscreen.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _userController;
  TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    // final logo = Image.asset(
    //   'lib/images/logoalt.png',
    // );

    final userField = TextFormField(
      controller: _userController,
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: '781049659',
        labelText: 'Numéro',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final passwordField = Column(
      children: [
        TextFormField(
          controller: _passwordController,
          cursorColor: Colors.white,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            hintText: 'mot de passe',
            labelText: 'Mot de Passe',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MaterialButton(
              child: Text(
                'Mot de Passe Oublié !',
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.white,
                    ),
              ),
              onPressed: () {
                //!  create forgot password popup.
              },
            ),
          ],
        ),
      ],
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          userField,
          passwordField,
        ],
      ),
    );

    Future navigateToVideoScreen(context) async {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VideoPlayerApp()));
    }

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          'Se connecter',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          navigateToVideoScreen(context);
          //! Handle Authentication Login.
          // try {
          //   User user = (await FirebaseAuth.instance.signInWithPhoneNumber(
          //     _phoneController.text,
          //   )) as User;
          //   if (user != null) {
          //     print('Sign In');
          //     Navigator.of(context).pushNamed(Routes.authAuthentication);
          //   }
          // } catch (e) {
          //   print(e);
          //   print('Failed !');
          //   _phoneController.text = "";
          //   _passwordController.text = "";
          // }
        },
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        loginButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     // Text(
        //     //   'New Membre ?',
        //     //   style: Theme.of(context).textTheme.subtitle1.copyWith(
        //     //         color: Colors.white,
        //     //       ),
        //     // ),
        //     // MaterialButton(
        //     //   child: Text('Inscrire',
        //     //       style: Theme.of(context).textTheme.subtitle1.copyWith(
        //     //             color: Colors.white,
        //     //             decoration: TextDecoration.underline,
        //     //           )),
        //     //   onPressed: () {
        //     //     // Navigator.of(context).pushNamed(Routes.authRegister);
        //     //   },
        //     // ),
        //   ],
        // ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Container(
            height: mq.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // logo,
                fields,
                Padding(
                  padding: EdgeInsets.only(bottom: 35),
                  child: bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
