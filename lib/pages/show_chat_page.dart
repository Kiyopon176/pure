import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure/pages/chat_page.dart';
import 'package:pure/widgets/chat_widget.dart';

class ShowChatPage extends StatefulWidget {
  const ShowChatPage({super.key});

  @override
  State<ShowChatPage> createState() => _ShowChatPageState();
}

class _ShowChatPageState extends State<ShowChatPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const PlaceholderWidget(color: Colors.blue), // Replace with your screen
    const ChatListScreen(),
    const PlaceholderWidget(color: Colors.green), // Replace with your screen
    const PlaceholderWidget(color: Colors.red), // Replace with your screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_currentIndex], bottomNavigationBar: navigationBar());
  }

  Widget navigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      enableFeedback: false,
      showUnselectedLabels: false,
      backgroundColor: const Color(0xff212020),
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset("svg/main.svg"),
            label: "",
            backgroundColor: const Color(0xff191818)),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("svg/chat.svg"),
            label: '',
            backgroundColor: const Color(0xff191818)),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("svg/favorites.svg"),
            label: '',
            backgroundColor: const Color(0xff191818)),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("svg/settings.svg"),
            label: '',
            backgroundColor: const Color(0xff191818)),
      ],
    );
  }
}

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              border: const Border(
                bottom: BorderSide( color: Color(0xff393737)),
                left: BorderSide( color: Color(0xff393737)),
                right: BorderSide( color: Color(0xff393737)),
              )
            ),
            child: const ChatList(),
          ),
        )
      ],
    );
  }
}

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  bool isIncognito = true;
  // change canSwitch to True to activate incognito mode
  bool canSwitch = false;
  bool showIncognitoPopUp = false;

  void showCustomDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return customPopUp();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "ЧАТЫ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontSize: 24,
              ),
            ),
            Row(
              children: [
                Text(
                  "OFF",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                    child: isIncognito && canSwitch
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isIncognito = false;
                              });
                            },
                            child: SvgPicture.asset(
                              "svg/incognito.svg",
                              height: 15,
                              width: 20,
                            ),
                          )
                        : SizedBox(
                            width: 40,
                            height: 30,
                            child: FittedBox(
                                fit: BoxFit.fill,
                                child: Switch(
                                    inactiveThumbColor: Colors.transparent,
                                    thumbIcon: MaterialStateProperty.all(const Icon(
                                      Icons.mic_off,
                                      color: Colors.white,
                                      size: 24,
                                    )),
                                    value: isIncognito
                                        ? !isIncognito
                                        : isIncognito,
                                    onChanged: canSwitch
                                        ? (bool value) {
                                            setState(() {
                                              isIncognito = true;
                                            });
                                          }
                                        : (bool value) =>
                                            showCustomDialog(context))),
                          )),
              ],
            )
          ],
        ),
        const SizedBox(height: 16),
        //body
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "svg/likes.svg",
                  height: 60,
                  width: 60,
                ),
                const SizedBox(width: 12),
                Text(
                  "44 человека тебя лайкнули",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
            const Text("•"),
          ],
        ),
        const SizedBox(height: 16),
        ProfileWidget(
          onTap: () {
            Navigator.of(context).push(_createRoute());
          },
          profilePicture: Image.asset("images/profile_picture.png"),
          message: "Отлично выглядишь",
          messageTime: "23 ч 43 мин",
        ),
      ],
    );
  }

  Widget customPopUp() {
    return Container(
        padding: const EdgeInsets.all(32),
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff0D1333),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("svg/incognito_big.svg"),
            RichText(
              text: const TextSpan(
                text: 'РЕЖИМ ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'ИНКОГНИТО ',
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  TextSpan(text: ' НА 24 ЧАСА'),
                ],
              ),
            ),
            Text(
              "Стань невидимой в ленте и чатах, скрой объявление и наслаждайся <Space> незамечанным",
              style: TextStyle(color: Theme.of(context).colorScheme.onTertiary),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                card(1, 99, false, ""),
                card(3, 199, true, "header"),
                card(7, 399, true, "header_2"),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffAA044A),
              ),
              child: const Center(
                child: Text(
                  "Купить",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const Text(
              "УСЛОВИЯ И ПОЛОЖЕНИЯ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ));
  }

  Widget card(int daysCount, int price, bool isHeader, String headerText) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      const SizedBox(
        height: 110,
        width: 120,
      ),
      Container(
        padding: const EdgeInsets.all(16),
        height: 78,
        width: 103.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  daysCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset("svg/incognito.svg"),
              ],
            ),
            Text(
              "${price.toString()} ₽",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      if (isHeader)
        Positioned(
          bottom: 65,
          child: Image.asset("images/$headerText.png"),
        )
    ]);
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const ChatPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  const PlaceholderWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: const Center(
        child: Text(
          'Placeholder Screen',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
