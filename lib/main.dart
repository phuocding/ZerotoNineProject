// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // build title section row
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          // column of text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Free Code School',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Hanoi, Vietnam',
                  style: TextStyle(
                    color: Colors.orange[500],
                  ),
                ),
              ],
            ),
          ),
          // A star icon, A number
          FavoriteWidget(),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.perm_phone_msg, 'One Call Away'),
          buildButtonColumn(Icons.directions_run, 'Come with me'),
          buildButtonColumn(Icons.screen_share, 'Give then Recieve')
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''One of the best feelings in the world is giving. The positive energy is contagious. With just one act of kindness, you can inspire others to go out and plant seeds of happiness through giving, too. Your greatest gift is the ability to share your blessings; it’s what makes life meaningful. Remember what it means to be a giver with these 10 thoughtful quotes.

        1. “No one has ever become poor by giving.” ―Anne Frank.
        2. “Remember that the happiest people are not those getting more, but those giving more.” ―H. Jackson Brown Jr.
        3. “Since you get more joy out of giving joy to others, you should put a good deal of thought into the happiness that you are able to give.” ―Eleanor Roosevelt.
        4. “We must give more in order to get more. It is the generous giving of ourselves that produces 
        the generous harvest.” ―Orison Swett Marden.
        5. “We make a living by what we get. We make a life by what we give.” ―Winston S. Churchill.
        6. “No one is useless in this world who lightens the burdens of another.” ―Charles Dickens.
        7. “For it is in giving that we receive.” ―St. Francis of Assisi.
        8. “Happiness doesn’t result from what we get, but from what we give.” ―Ben Carson.
        9. “It is every man’s obligation to put back into the world at least the equivalent of what he takes out of it.” ―Albert Einstein.
        10. “The meaning of life is to find your gift. The purpose of life is to give it away.” ―Pablo Picasso.
        ''',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Free Code School',
      theme: ThemeData(
        // primarySwatch: Colors.amber,
        primaryColor: Colors.lightBlueAccent[100],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('FREE { } SCHOOL', style: TextStyle(color: Colors.red)),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(
              'images/code.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 12999;

  void _toggleFavorite() {
    setState(() {
          if (!_isFavorited) {
            _favoriteCount += 1;
            _isFavorited = true;
          } else {
            _favoriteCount -= 1;
            _isFavorited = false;
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.people) : Icon(Icons.people_outline)),
            color: Colors.cyan[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          // width: 18.0,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
