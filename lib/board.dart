import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              leading: InkWell(
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
                onTap: () {
                  Navigator.of(context).pop("home");
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/photos/Img1.jpg",
                      fit: BoxFit.cover,
                      height: 270,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Board 2023",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    subtitle: Row(
                      children: const [
                        Text(
                          "CIS Team.2022-11-26 03:41:24.",
                          style: TextStyle(color: Colors.white54),
                        ),
                        Icon(
                          Icons.mode_comment_outlined,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    "Our new Mentors are ready to complete the journey.         مُتفقين دائمًا إن الأهم من اكتساب المعلومة هي إنها متقفش عندنا وبس، عشان كده جه وقت إننا نعلن عن المينتوز الجُدد الّي قرروا يكملوا الطريق، ويمهدوا طُرق جديدة لناس اكتر.#Technical_Squads#CIS_Team",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  nameField(),
                  commentField(),
                  sendButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding sendButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: MaterialButton(
        height: 50,
        color: Colors.teal,
        onPressed: () {
          showToast(
            'Send Successfully',
            backgroundColor: Colors.greenAccent,
            animation: StyledToastAnimation.scale,
            reverseAnimation: StyledToastAnimation.fade,
            position: StyledToastPosition.center,
            animDuration: const Duration(seconds: 1),
            duration: const Duration(seconds: 4),
            curve: Curves.elasticOut,
            reverseCurve: Curves.linear,
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Text('SEND',
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }

  Padding commentField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white54,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: "Write a comment...",
          hintStyle: const TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        maxLength: 255,
      ),
    );
  }

  Padding nameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white54,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: "Your Name",
          hintStyle: const TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
