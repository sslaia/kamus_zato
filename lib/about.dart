import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AboutKamusZato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'about',
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
        ).tr(),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text('app_desc_heading',
                    style: Theme.of(context).textTheme.headline6)
                .tr(),
            const SizedBox(height: 12.0),
            new Text('app_desc1', style: Theme.of(context).textTheme.bodyText1)
                .tr(),
            const SizedBox(height: 12.0),
            new Text('app_desc2', style: Theme.of(context).textTheme.bodyText1)
                .tr(),
            const SizedBox(height: 12.0),
            new Text('app_task_heading',
                    style: Theme.of(context).textTheme.headline6)
                .tr(),
            const SizedBox(height: 12.0),
            new Text('app_task1', style: Theme.of(context).textTheme.bodyText1)
                .tr(),
            const SizedBox(height: 12.0),
            new Text('app_source', style: Theme.of(context).textTheme.bodyText1)
                .tr(),
            const SizedBox(height: 12.0),
            new Text('nias_greeting',
                    style: Theme.of(context).textTheme.bodyText1)
                .tr(),
          ],
        ),
      ),
    );
  }
}
