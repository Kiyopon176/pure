import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with profile picture and back button
            Container(
              color: Theme.of(context).colorScheme.background,
              height: MediaQuery.of(context).size.height * 0.15,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(Icons.chevron_left, color: Colors.black),
                              ),
                              const CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage("images/profile_picture.png"),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Middle bar with title
            Container(
              color: Theme.of(context).colorScheme.secondary,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    '🚀 2 общих соблазна',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.close, size: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Main chat area
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(52),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Text(
                  'Начни общение',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            // Input area
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Сообщение...",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: const EdgeInsets.all(8.0),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset("svg/isolation_mode.svg"),
                        ),
                      ),
                      style: const TextStyle(
                        height: 1.0,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_voice_outlined,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 25,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
