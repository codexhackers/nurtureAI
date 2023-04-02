import 'package:flutter/material.dart';
import 'package:nurtureai/Helper/sharedPreference.dart';

class MessageBubble extends StatefulWidget {
  const MessageBubble({
    required this.content,
    required this.isUserMessage,
    super.key,
  });

  final String content;
  final bool isUserMessage;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  String name = 'You';

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: widget.isUserMessage
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: widget.isUserMessage
                  ? Colors.teal[400]?.withOpacity(0.6)
                  : Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: widget.isUserMessage
                          ? Alignment.topLeft
                          : Alignment.topLeft,
                      child: Text(
                        widget.isUserMessage ? '$name' : 'NurtureAI',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(height: 8),
                  Align(
                    alignment: widget.isUserMessage
                        ? Alignment.topLeft
                        : Alignment.topLeft,
                    child: SelectableText(widget.content),
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}
