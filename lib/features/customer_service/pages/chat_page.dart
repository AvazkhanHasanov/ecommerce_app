import 'package:ecommerce_app/core/context_extensions.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/common/widgets/store_app_bar.dart';
import 'package:ecommerce_app/features/home/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../managers/chat_bloc.dart';
import '../managers/chat_state.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) => _scrollToBottom(),
      builder: (context, state) {
        return Scaffold(
          appBar: StoreAppBar(title: 'Customer Service'),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    itemCount: state.messages.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      final isMine = message["direction"] != "to";
                      return Align(
                        alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 250),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isMine ? AppColors.primary900 : AppColors.primary100,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r),
                              bottomLeft: isMine ? Radius.circular(10.r) : Radius.zero,
                              bottomRight: isMine ? Radius.zero : Radius.circular(10.r),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message["message"],
                                style: AppStyle.b2Regular.copyWith(color: isMine ? Colors.white : Colors.black),
                              ),
                              4.height,
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  DateFormat("HH:mm").format(
                                    DateTime.parse(message["date"]),
                                  ),
                                  style: AppStyle.b3Regular.copyWith(
                                    color: isMine ? AppColors.primary400 : AppColors.primary800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          hintText: 'Write your message...',
                          controller: _controller,
                          needSuffix: false,
                          needPrefix: false,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (_controller.text.trim().isEmpty) return;
                          context.read<ChatBloc>().add(ChatMessageSend(message: _controller.text));
                          _controller.clear();
                          _scrollToBottom();
                        },
                        icon: const Icon(Icons.send, color: AppColors.primary900),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
