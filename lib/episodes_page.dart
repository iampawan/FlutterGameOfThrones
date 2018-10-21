import 'package:flutter/material.dart';
import 'package:gotapp/got.dart';

class EpisodesPage extends StatelessWidget {
  final List<Episodes> episodes;
  final GOT got;

  EpisodesPage({this.episodes, this.got});

  showSummary(BuildContext context, String summary) {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      summary,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Hero(
              tag: got.name,
              child: CircleAvatar(
                backgroundImage: NetworkImage(got.image.medium),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text("All Episodes"),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.0),
        itemCount: episodes.length,
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                showSummary(context, episodes[index].summary);
              },
              child: Card(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.network(
                      episodes[index].image.original,
                      fit: BoxFit.cover,
                      color: Colors.black.withOpacity(0.2),
                      colorBlendMode: BlendMode.darken,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            episodes[index].name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      top: 0.0,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "${episodes[index].season.toString()}-${episodes[index].number.toString()}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
