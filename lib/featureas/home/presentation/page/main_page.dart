import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nekomimi/featureas/home/bloc/chat/love_me_bloc.dart';
import 'package:nekomimi/featureas/home/bloc/chat/love_me_event.dart';
import 'package:nekomimi/featureas/home/bloc/chat/love_me_state.dart';
import 'package:nekomimi/featureas/home/presentation/widget/chat_bubble.dart';
import 'package:nekomimi/featureas/home/presentation/widget/input_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('مراسلات')),
      body: BlocBuilder<LoveMeBloc, LoveMeState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    return ChatBubble(
                      message: message.content,
                      isUser: message.isUser,
                    );
                  },
                ),
              ),
              ChatInputBar(
                onSendMessage: (message) {
                  context.read<LoveMeBloc>().add(SendMessageEvent(message: message));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
