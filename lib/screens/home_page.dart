import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:meroapp/model/content_model.dart';
import 'package:meroapp/network/api_services.dart';
import 'package:meroapp/screens/details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meropadai",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [DrawerWidget()],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See 2079",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "IOM Entrance",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "C-MAT Entrance",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "CSIT- Entrance",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: ApiServices.getContent(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ContentModel> result = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                    itemCount: result.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                details: result[index].details!,
                                imageUrl: result[index].imageUrl!,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: double.infinity,
                              color: Colors.grey,
                              child: Image.network(
                                result[index].imageUrl!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                result[index].title!,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child:
                                    Html(data: result[index].shortDescription!)
                                // Text(
                                //   result[index].shortDescription!,
                                //   style: TextStyle(
                                //     fontSize: 16,
                                //   ),
                                // ),
                                ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Container(
                    child: Text("Err"),
                  ),
                );
              }
              return Container();
            }),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ));
  }
}
