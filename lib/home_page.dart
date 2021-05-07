import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kamuszato/about.dart';
import 'package:kamuszato/wiki_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/letters.webp'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent.withAlpha(65),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 4.0,
          title: Text(
            'Kamus Zato',
            style: GoogleFonts.cinzelDecorative(
                textStyle: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => WikiHome()));
                }),
            PopupMenuButton(
                color: Colors.orange[50],
                onSelected: (item) {
                  switch (item) {
                    case 0:
                      setState(() {
                        context.setLocale(Locale('en'));
                      });
                      break;
                    case 1:
                      setState(() {
                        context.setLocale(Locale('id'));
                      });
                      break;
                    // case 2:
                    //  setState(() {
                    //    context.setLocale(Locale('id'));
                    //  });
                    //   break;
                    case 3:
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AboutKamusZato()),
                      );
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem<int>(
                          value: 0,
                          child: ListTile(
                            leading: Icon(Icons.language_outlined,
                                color: Colors.purple),
                            title: Text('english').tr(),
                          )),
                      PopupMenuItem<int>(
                          value: 1,
                          child: ListTile(
                            leading: Icon(Icons.language_outlined,
                                color: Colors.orange),
                            title: Text('indonesia').tr(),
                          )),
                      // PopupMenuItem<int>(
                      //     value: 2,
                      //     child: ListTile(
                      //       leading: Icon(Icons.language_outlined,
                      //           color: Colors.orange),
                      //       title: Text('nias').tr(),
                      //     )),
                    ]),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 32.0),
              child: Text(
                'tagline',
                style: GoogleFonts.parisienne(
                    textStyle: TextStyle(
                        fontSize: 24.0,
                        // fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ).tr(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => WikiHome()));
                    },
                    child: Text(
                      'Nias Wiktionary',
                      style: GoogleFonts.cinzelDecorative(
                        textStyle: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'goal',
                    style: GoogleFonts.parisienne(
                      textStyle: TextStyle(
                          fontSize: 24.0,
                          // fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ).tr(),
                  SizedBox(height: 24.0),
                  Text(
                    'foto_attribution',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .apply(color: Colors.white),
                    // style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ).tr(),
                  SizedBox(height: 15.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
