import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/components/message_bubble.dart';
import 'package:flashchat/constants.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  late String messageText;
  late DateTime messageTime;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() async {
  // 일반적으로 DB에서 데이터를 가져오려면 아래와 같이 'get' 해 주어야 한다.
  //   final messages = await _firestore.collection('messages').get();
  //   for (var message in messages.docs) {
  //     print(message.get('sender') + ' : ' + message.get('text'));
  //   }
  // }

  // void messagesStream() async {
  //   // to listen for the stream of messages thats comming over from firebase.
  //   // stream is like a list of futures. 이 stream 을 firebase 에서 subscribe 한다고 생각하면 된다
  //   // 데이터를 필요 할 때 마다 get 해 올 필요가 없다. (subscribe 개념이므로)
  //   // 데이터가 collection 에 추가되는 시점에 자동으로 코드를 re-run 한다. (trigger)
  //   await for (var snapshot
  //       in _firestore.collection('messages').snapshots()) {
  //     for (var message in snapshot.docs) {
  //       print(message.get('sender') + ' : ' + message.get('text'));
  //     }
  //   }
  //   ;
  // }

  /** ✨ Stream ?
   * - Let's think you are sitting down at conveyor belt sushi shop.
   * - He send the sushi out as soon as he's finished preparing it.
   * - 모든 데이터가 한 번에 보여지는 것이 아니라 나오는 대로 하나씩 보여지는 것. 이것이 snapshot 에 담겨있다.
   * - Data that need to wait : Singular - Future<String>  /  Plural - Stream<String>
   */ ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear(); // send 버튼 누르고 input 창 초기화
                      messageTime = DateTime.now();

                      // 여기서 firestore DB에 저장이 된다. (console 에서 확인 가능)
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                        'dateTime': messageTime,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      // StreamBuilder 에게 데이터 타입을 알려줄 수 있다.
      // stream : 데이터가 어디서 오는가?
      stream: _firestore.collection('messages').orderBy('dateTime').snapshots(),
      // builder : stream builder 가 stream 을 가지고 뭘 해야 하는가?
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        } else {
          // async 스냅샷 (snapshot) 은 firebase 에서 받은 query 스냅샷 (data) 을 포함하고 있다.
          // async snapshot from flutter

          final messages = snapshot.data!.docs.reversed; // 새 메세지가 맨 아래로 가게 정렬한다
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            // document snapshot from firebase
            final messageText = message.get('text');
            final messageSender = message.get('sender');

            final currentUser = loggedInUser.email;

            final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              isMe: currentUser == messageSender,
            );
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true, // 리스트의 가장 마지막 데이터로 붙는다
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: messageBubbles,
            ),
          );
        }
      },
    );
  }
}
