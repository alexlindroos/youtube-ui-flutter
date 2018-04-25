import 'package:flutter/material.dart';

class YoutubeUIPage extends StatefulWidget {

  const YoutubeUIPage({ Key key }) : super(key: key);
  @override
  _YoutubeUIPageState createState() => new _YoutubeUIPageState();
}

class _YoutubeUIPageState extends State<YoutubeUIPage> with SingleTickerProviderStateMixin {

  final List<Tab> myTabs = <Tab>[
    new Tab(icon: new Icon(Icons.home,color: Colors.black.withOpacity(0.85),size: 32.0,)),
    new Tab(icon: new Icon(Icons.whatshot,color: Colors.black.withOpacity(0.85),size: 32.0,)),
    new Tab(icon: new Icon(Icons.person,color: Colors.black.withOpacity(0.85),size: 32.0,)),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home',
          textAlign: TextAlign.start,
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            color: Colors.black.withOpacity(0.5),
            onPressed: () {
              print('Search pressed');
            },
          ),
          new PopupMenuButton(
            itemBuilder: (BuildContext context) {
            },
          ),
        ],
        bottom: new TabBar(
            indicatorColor: Colors.white,
            controller: _tabController,
            tabs: myTabs
        ),
      ),
      body: new Container(
        child: _buildContent(),
      ),
    );
  }
}

Widget _buildContent() {
  return new SingleChildScrollView(
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildVideoContainer(),
        _buildVideoList(),
        _buildVideoContainer(),
        _buildVideoList(),
      ],
    ),
  );
}

Widget _buildVideoContainer() {
  return new Row(
    children: <Widget>[
      new Padding(
        padding: EdgeInsets.all(10.0),
        child: new ClipOval(
          child:new Image.asset(
            'assets/pic1.jpg',
            height: 50.0,
            width: 50.0,
          ),
        ),
      ),
      new Padding(
        padding: EdgeInsets.only(right: 150.0),
        child: new Text(
          'Codemate',
          style: new TextStyle(
            fontSize: 22.0,
            color: Colors.black,
          ),
        ),
      ),
      new PopupMenuButton(
        itemBuilder: (BuildContext context) {
        },
      ),
    ],
  );
}

final video1 = VideoInfo('Codemate on digipalveluiden tekijä', 'Codemate', '1 year ago ', ' 86K views','1:03');
final video2 = VideoInfo('Codemate asiakastarina - Squid', 'Codemate', '10 months ago ', ' 134 views','1:51');
final video3 = VideoInfo('Codemate työpaikkana', 'Codemate', '10 months ago ', ' 47 views','4:56');

Widget _buildVideoList() {
  return new Column(
    children: <Widget>[
      _buildVideoRow('assets/thumbnail1.jpg', video1),
      _buildVideoRow('assets/thumbnail2.jpg', video2),
      _buildVideoRow('assets/thumbnail3.jpg', video3),
      new Container(
        color: Colors.black.withOpacity(0.3),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        width: 400.0,
        height: 1.0,
      ),
    ],
  );
}

Widget _buildVideoRow(String title, VideoInfo videoInfo) {
  return new Row(
    children: <Widget>[
      new Padding(
        padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 5.0, bottom: 5.0),
        child: new ClipRRect(
          borderRadius: new BorderRadius.circular(8.0),
          child: new Stack(
            children: <Widget>[
              new Image.asset(title,
                height: 100.0,
                width: 150.0,
              ),
              new Positioned(
                bottom: 15.0,
                right: 10.0,
                child: _buildTimeButton(videoInfo.videoTime),
              ),
            ],
          ),
        ),
      ),
      _buildVideoInfo(videoInfo),
      new PopupMenuButton(
        itemBuilder: (BuildContext context) {
        },
      ),
    ],
  );
}

Widget _buildTimeButton(String videoTime) {
  return new Material(
    color: Colors.black87,
    type: MaterialType.card,
    child: new InkWell(
      onTap: () {},
      child: new Padding(
        padding: const EdgeInsets.all(5.0),
        child: new Text(
          videoTime,
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Widget _buildVideoInfo(VideoInfo videoInfo) {
  return new Container(
    width: 160.0,
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          videoInfo.videoTitle,
          maxLines: 3,
          style: new TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
        new Text(
          videoInfo.videoAuthor,
          style: new TextStyle(
            fontSize: 13.0,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        new Row(
          children: <Widget>[
            new Text(
              videoInfo.date,
              style: new TextStyle(
                fontSize: 11.0,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            new Text(
              videoInfo.views,
              style: new TextStyle(
                fontSize: 11.0,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ],
        ),
      ],
    ),
  );

}

class VideoInfo {

  VideoInfo(this.videoTitle, this.videoAuthor, this.date, this.views, this.videoTime);

  String videoTitle;
  String videoAuthor;
  String date;
  String views;
  String videoTime;
}

