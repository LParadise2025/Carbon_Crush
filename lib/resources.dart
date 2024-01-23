import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
// this imported package is used to launch web pages outside of the app

class resources extends StatefulWidget {
  resources({
    Key? key,
  }) : super(key: key);

  @override
  State<resources> createState() => _resourcesState();
}

class _resourcesState extends State<resources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carbon Crush"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.00),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 7, 93, 5),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Resources',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                 const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    // provides the user links to resources regarding what materials can be recycled and where
                                    "What can be recycled?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(Icons.recycling),
                                  HyperlinkText(
                                      text:
                                      // the text is what is displayed
                                          "Overview of what can be recycled from the EPA",
                                      url:
                                      // the url is where the user is sent 
                                          "https://www.epa.gov/recycle/how-do-i-recycle-common-recyclables"),
                                          const Icon(Icons.recycling),
                                  HyperlinkText(text: "Directory to locations to recycle non-curbside materials", url: "https://search.earth911.com/?what=phone&where=01571&list_filter=all&max_distance=25&family_id=&latitude=&longitude=&country=&province=&city=&sponsor="),
                                  const Icon(Icons.recycling),
                                  HyperlinkText(text: "Guidelines for Pratt single stream curbside recycling", url: "https://pratttrucking.com/recycling/"),
                                  const Icon(Icons.recycling),
                                  HyperlinkText(text: "Recycling information specific to MA with information on local collection centers", url: "https://www.mass.gov/info-details/how-where-to-recycle"),
                                
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                 const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // provides users links to sources regarding the importance of recycling 
                                const Text(
                                  "Why is recycling important?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(Icons.recycling),
                               
                                HyperlinkText(text: "Recycling basics and benefits, outlines challenges to the recycling system", url: "https://www.epa.gov/recycle/recycling-basics-and-benefits"),
                               const Icon(Icons.recycling),
                                HyperlinkText(text: "Benefits of recycling from the National Institutes of Health Environmental Management System", url: "https://nems.nih.gov/environmental-programs/pages/benefits-of-recycling.aspx"),
                                const Icon(Icons.recycling),
                                HyperlinkText(text: "Overview of the United States' recycling 1960-2018", url: "https://www.epa.gov/facts-and-figures-about-materials-waste-and-recycling/national-overview-facts-and-figures-materials")
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                               const Text(
                                // provides the user links on how to clean and sort recyclables
                                  "Information on cleaning and sorting recyclables",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(Icons.recycling),
                                HyperlinkText(text: "Information on what types of labels need to be removed", url: "https://earth911.com/home-garden/recycling-quandary-what-about-labels-on-plastic/"),
                               const Icon(Icons.recycling),
                                HyperlinkText(text: "Explanation of how to clean recyclables and how clean they must be", url: "https://earth911.com/home-garden/clean-recyclables/"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  // provides the user with links to resources regarding the pros and cons of various methods on recycling
                                  "Information on curbside recycling",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(Icons.recycling),
                                HyperlinkText(text: "Comparison of all-in-one, single stream, and source separated recycling", url: "https://zipeco-recycling.com/why-source-separated-recycling-is-best/#:~:text=Single%20stream%20recycling%20involves%20the,by%20type%20when%20discarding%20them."),
                                const Icon(Icons.recycling),
                                HyperlinkText(text: "Information on curbside recycling in the United States", url: "https://earth911.com/home-garden/how-curbside-recycling-works/")
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// this class makes the hyperlinks and displays them to the page
class HyperlinkText extends StatelessWidget {
  final String text;
  final String url;

  HyperlinkText({required this.text, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(),
      // if the link is tapped then the launchURL method is called and the link is launched
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
          // styles the hyperlink
        ),
      ),
    );
  }

// this method launches the url in a browser if the link is tapped
  void _launchURL() async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
