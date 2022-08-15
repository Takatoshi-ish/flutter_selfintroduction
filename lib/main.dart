import 'package:flutter/material.dart';
import './data/user_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) {
  return 'マイページ';
});

final userProvider = StateProvider<UserData>(
  (ref) => const UserData(
    avaterUrl: 'assets/profile.png',
    name: 'Taka',
    comment: '社会人2年目 システムエンジニア（主にFlutterとcordovaを使って開発してます',
    joinDate: '2021/12/7に入会',
    plan: '課題学習プラン',
    githubUrl: 'https://github.com/Takatoshi-ish/flutter_selfintroduction',
    residence: '東京',
    futPoint: 650,
    engineerClass: 'エンジニアクラス',
    hobby: 'サッカー, 散歩, 読書',
    questionZoom: 0,
    studySession: 10,
    coworking: 4,
  ),
);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends ConsumerStatefulWidget {
  // final ViewModel viewModel;
  ProfilePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPage',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            ref.watch(titleProvider),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 15, 15, 241),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
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
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(ref
                            .watch(
                                userProvider.select((value) => value.avaterUrl))
                            .toString()),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ref
                              .watch(userProvider.select((value) => value.name))
                              .toString(),
                          style: const TextStyle(
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
                              primary: const Color.fromARGB(31, 203, 200, 200),
                            ),
                            child: const Text(
                              'プロフィール編集',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    ref
                        .watch(userProvider.select((value) => value.comment))
                        .toString(),
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Tooltip(
                  message: '入会日',
                  child: Row(
                    children: [
                      const Icon(
                        Icons.timelapse,
                        color: Color.fromARGB(255, 160, 88, 0),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      InkWell(
                        child: Text(
                          ref
                              .watch(userProvider
                                  .select((value) => value.joinDate))
                              .toString(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Tooltip(
                  message: 'プラン',
                  child: Row(
                    children: [
                      const Icon(
                        Icons.computer,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      InkWell(
                        child: Text(
                          ref
                              .watch(userProvider.select((value) => value.plan))
                              .toString(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
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
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      child: const Text(
                        'タップするとGitHubのリンクに飛びます',
                      ),
                      onTap: () async {
                        final url = ref
                            .watch(userProvider.select((value) => value.name))
                            .toString();
                        launchUrl(Uri.parse(url));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Tooltip(
                  message: '居住地',
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      InkWell(
                        child: Text(
                          ref
                              .watch(userProvider
                                  .select((value) => value.residence))
                              .toString(),
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onTap: () async {
                          const url = 'https://goo.gl/maps/xwvjFVhMnqbhGsAB7';
                          launchUrl(Uri.parse(url));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: null,
                      child: Text(
                        '${ref.watch(userProvider.select((value) => value.futPoint))}FUT',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Tooltip(
                  message: 'エンジニアクラス',
                  child: Row(
                    children: [
                      const Icon(
                        Icons.hotel_class,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        ref
                            .watch(userProvider
                                .select((value) => value.engineerClass))
                            .toString(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(),
                const SizedBox(
                  height: 8,
                ),
                Tooltip(
                  message: '取得したバッジ',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.apps,
                        color: Colors.black54,
                      ),
                      const Text(
                        '取得したバッジ',
                      ),
                      const SizedBox(width: 150),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: null,
                        child: const Text(
                          'もっと見る>',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 15, 15, 241),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    BadgeTile("1ヶ月継続", const Color.fromARGB(255, 1, 162, 68)),
                    const SizedBox(
                      width: 20,
                    ),
                    BadgeTile('3ヶ月継続', const Color.fromARGB(255, 239, 127, 35)),
                    const SizedBox(
                      width: 20,
                    ),
                    BadgeTile('半年継続', const Color.fromARGB(255, 160, 88, 0)),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(),
                const SizedBox(
                  height: 8,
                ),
                Tooltip(
                  message: '趣味',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.directions_run,
                        color: Colors.black54,
                      ),
                      Text(
                        ref
                            .watch(userProvider.select((value) => value.hobby))
                            .toString(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text('質問Zoom'),
                            Text(
                                '${ref.watch(userProvider.select((value) => value.questionZoom)).toString()}回'),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('共同勉強会'),
                            Text(
                                '${ref.watch(userProvider.select((value) => value.studySession)).toString()}回'),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('コワーキング'),
                            Text(
                                '${ref.watch(userProvider.select((value) => value.coworking)).toString()}回'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      child: const Text(
                        'もっとみる',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 15, 15, 241),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
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
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      child: const Text(
                        '新しく作成する',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 15, 15, 241),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(),
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
