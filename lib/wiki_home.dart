import 'dart:async';
import 'dart:io' as IO;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikiHome extends StatefulWidget {
  @override
  _WikiHomeState createState() => _WikiHomeState();
}

class _WikiHomeState extends State<WikiHome> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final key = GlobalKey();
  final url = 'https://nia.m.wiktionary.org/wiki/';

  @override
  void initState() {
    if (IO.Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        backgroundColor: Colors.orange[50],
        title: Text(
          'Kamus Zato',
          style: GoogleFonts.cinzelDecorative(
              textStyle: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54)),
        ),
        actions: [
          FutureBuilder<WebViewController>(
            future: _controller.future,
            builder: (BuildContext context,
                AsyncSnapshot<WebViewController> controller) {
              if (controller.hasData) {
                return Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        controller.data!.reload();
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.shuffle_outlined,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        controller.data!.loadUrl(url + 'Special:Random');
                      },
                    ),
                    PopupMenuButton<int>(
                        color: Colors.orange[50],
                        onSelected: (item) {
                          switch (item) {
                            case 0:
                              controller.data!.loadUrl(url + 'Olayama');
                              break;
                            case 1:
                              controller.data!
                                  .loadUrl(url + 'Special:RecentChanges');
                              break;
                            case 2:
                              controller.data!
                                  .loadUrl(url + 'Special:SpecialPages');
                              break;
                            case 3:
                              controller.data!
                                  .loadUrl(url + 'Wiktionary:Angombakhata');
                              break;
                            case 4:
                              controller.data!
                                  .loadUrl(url + 'Wiktionary:Bawagöli_zato');
                              break;
                            case 5:
                              controller.data!
                                  .loadUrl(url + 'Wiktionary:Monganga_afo');
                              break;
                            case 6:
                              controller.data!
                                  .loadUrl(url + 'Wiktionary:Nahia_wamakori');
                              break;
                            case 7:
                              controller.data!.loadUrl(url + 'Kategori:Fanolo');
                              break;
                            case 8:
                              controller.data!
                                  .loadUrl(url + 'Wiktionary:Sangai_halöŵö');
                              break;
                            case 9:
                              controller.data!
                                  .loadUrl(url + 'Wiktionary:Sanandrösa');
                              break;
                          }
                        },
                        itemBuilder: (context) => [
                              PopupMenuItem<int>(
                                  value: 0,
                                  child: ListTile(
                                    leading: Icon(Icons.home_outlined,
                                        color: Colors.orange),
                                    title: Text('home').tr(),
                                  )),
                              PopupMenuItem<int>(
                                  value: 1,
                                  child: ListTile(
                                    leading: Icon(
                                        Icons.local_fire_department_outlined,
                                        color: Colors.orange),
                                    title: Text('recent_changes').tr(),
                                  )),
                              PopupMenuItem<int>(
                                  value: 2,
                                  child: ListTile(
                                    leading: Icon(Icons.security_outlined,
                                        color: Colors.orange),
                                    title: Text('special_pages').tr(),
                                  )),
                              PopupMenuItem<int>(
                                  value: 3,
                                  child: ListTile(
                                    leading: Icon(Icons.notifications,
                                        color: Colors.orange),
                                    title: Text('announcement').tr(),
                                  )),
                              PopupMenuItem<int>(
                                  value: 4,
                                  child: ListTile(
                                    leading: Icon(Icons.meeting_room_outlined,
                                        color: Colors.orange),
                                    title: Text('community_portal').tr(),
                                  )),
                              PopupMenuItem<int>(
                                  value: 5,
                                  child: ListTile(
                                    leading: Icon(
                                        Icons.question_answer_outlined,
                                        color: Colors.orange),
                                    title: Text('village_pump').tr(),
                                  )),
                              PopupMenuItem<int>(
                                  value: 6,
                                  child: ListTile(
                                    leading: Icon(Icons.gesture_outlined,
                                        color: Colors.orange),
                                    title: Text('sandbox').tr(),
                                  )),
                              PopupMenuItem<int>(
                                  value: 7,
                                  child: ListTile(
                                    leading: Icon(Icons.handyman_outlined,
                                        color: Colors.orange),
                                    title: Text('help').tr(),
                                  )),
                              PopupMenuItem<int>(
                                  value: 8,
                                  child: ListTile(
                                    leading: Icon(Icons.people_outlined,
                                        color: Colors.orange),
                                    title: Text('helpers').tr(),
                                  )),
                              PopupMenuItem<int>(
                                  value: 9,
                                  child: ListTile(
                                    leading: Icon(Icons.local_florist_outlined,
                                        color: Colors.orange),
                                    title: Text('about').tr(),
                                  ))
                            ])
                  ],
                );
              }
              return Container(
                child: Center(
                  child: Text('Error'),
                ),
              );
            },
          ),
        ],
      ),
      body: WebView(
        key: key,
        initialUrl: 'https://nia.m.wiktionary.org/wiki/Olayama',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
