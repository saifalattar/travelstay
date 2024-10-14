import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:travelstay/shared/sharedFunctions.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared/sharedWidgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TravelStayAppBar(
        context: context,
      ),
      drawer: TravelStayDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: rootBundle.loadString("assets/terms_and_conditions.md"),
                builder: (ctx, ss) {
                  if (ss.hasData) {
                    return Markdown(
                      onTapLink: (text, href, title) {
                        if (href!.contains("mailto")) {
                          launchUrlString(href);
                        } else {
                          Functions.navigateWithNewTab(href);
                        }
                      },
                      styleSheet: MarkdownStyleSheet(
                        p: themeData.textTheme.labelLarge,
                      ),
                      data: ss.data!,
                      shrinkWrap: true,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            const TravelStayFooter(isUnbeatableStackShown: false)
          ],
        ),
      ),
    );
  }
}
