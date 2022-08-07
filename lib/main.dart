import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPage',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'マイページ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 15, 15, 241),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40.0,
                      child: ClipRRect(
                        child: Image.asset('assets/profile.png'),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Taka',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          height: 35,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(31, 203, 200, 200),
                              // elevation: 0,
                            ),
                            child: Text('プロフィール編集'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  child: const Text(
                    "社会人2年目 システムエンジニア（主にFlutterとcordovaを使って開発してます",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Tooltip(
                  message: '入会日',
                  child: Row(
                    children: [
                      Icon(
                        Icons.timelapse,
                        color: Color.fromARGB(255, 160, 88, 0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      InkWell(
                        child: Text(
                          '2021/12/7に入会',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Tooltip(
                  message: 'プラン',
                  child: Row(
                    children: [
                      Icon(
                        Icons.computer,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      InkWell(
                        child: Text(
                          '課題学習プラン',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Image.asset(
                        'assets/github.png',
                        width: 18,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      child: Text(
                        'Takatoshi-ish',
                      ),
                      onTap: () async {
                        final url =
                            'https://github.com/Takatoshi-ish/flutter_selfintroduction';
                        launchUrl(Uri.parse(url));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Tooltip(
                  message: '居住地',
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      InkWell(
                        child: Text(
                          '東京',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onTap: () async {
                          final url = 'https://goo.gl/maps/xwvjFVhMnqbhGsAB7';
                          launchUrl(Uri.parse(url));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      child: Text(
                        '650FUT',
                      ),
                      onTap: null,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Tooltip(
                  message: 'エンジニアクラス',
                  child: Row(
                    children: [
                      Icon(
                        Icons.hotel_class,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Flutter 初心者",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(),
                SizedBox(
                  height: 8,
                ),
                Tooltip(
                  message: '取得したバッジ',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.directions_run,
                        color: Colors.black54,
                      ),
                      Text(
                        '取得したバッジ',
                      ),
                      SizedBox(width: 150),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        child: Text(
                          'もっと見る>',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 15, 15, 241),
                          ),
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    BadgeTile("1ヶ月継続", Color.fromARGB(255, 1, 162, 68)),
                    SizedBox(
                      width: 20,
                    ),
                    BadgeTile('3ヶ月継続', Color.fromARGB(255, 239, 127, 35)),
                    SizedBox(
                      width: 20,
                    ),
                    BadgeTile('半年継続', Color.fromARGB(255, 160, 88, 0)),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(),
                SizedBox(
                  height: 8,
                ),
                Tooltip(
                  message: '趣味',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.directions_run,
                        color: Colors.black54,
                      ),
                      Text(
                        'サッカー, 散歩, 読書',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("質問Zoom"),
                            Text("0回"),
                          ],
                        ),
                        Column(
                          children: [
                            Text("共同勉強会"),
                            Text("10回"),
                          ],
                        ),
                        Column(
                          children: [
                            Text("コワーキング"),
                            Text("4回"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      child: Text(
                        'もっとみる',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 15, 15, 241),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(),
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.auto_stories,
                          color: Colors.black54,
                        ),
                        Text(
                          'ポートフォリオ',
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      child: Text(
                        '新しく作成する',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 15, 15, 241),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BadgeTile extends StatelessWidget {
  String peridStr;
  Color color;
  BadgeTile(this.peridStr, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.timelapse,
          color: color,
        ),
        InkWell(
          child: Text(
            '$peridStr',
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
