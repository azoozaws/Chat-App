import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/constans.dart';
import 'package:untitled1/model/message_model.dart';
import 'package:untitled1/widgets/chat_buble.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static const String id = 'ChatPage';
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  String message = "";
  final controListView = ScrollController();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> list = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            list.add(
              MessageModel.fromJeson(
                snapshot.data!.docs[i],
              ),
            );
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    height: 60,
                  ),
                  const Text(
                    "Chat",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: controListView,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return list[index].email == email
                          ? ChatBubleForSender(
                              message: list[index],
                            )
                          : ChatBubleForreceiver(
                              message: list[index],
                            );
                    },
                  ),
                ),
                Container(
                  height: 90,
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controller,
                        onChanged: (value) {
                          message = value;
                        },
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            messages.add(
                              {
                                kMessagesCollections: value,
                                kCreatedAt: DateTime.now(),
                                "id": email,
                              },
                            );
                            controller.clear();

                            controListView.animateTo(0,
                                duration: const Duration(milliseconds: 70),
                                curve: Curves.ease);
                          }
                        },
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                          hintText: "Send Message",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              if (message.isNotEmpty) {
                                messages.add(
                                  {
                                    kMessagesCollections: message,
                                    kCreatedAt: DateTime.now(),
                                    "id": email,
                                  },
                                );
                                controller.clear();
                                message = "";

                                controListView.animateTo(0,
                                    duration: const Duration(milliseconds: 70),
                                    curve: Curves.ease);
                              }
                            },
                            child: const Icon(
                              Icons.send,
                              color: Colors.black,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 24, horizontal: 16),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                              color: kPrimaryColor,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                              color: kPrimaryColor,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: kPrimaryColor,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
