import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

typedef StringValue = void Function(String);

class WalletInput extends StatefulWidget {
  final StringValue onShowRewards;

  const WalletInput({
    Key? key,
    required this.onShowRewards,
  }) : super(key: key);

  @override
  State<WalletInput> createState() => _WalletInputState();
}

class _WalletInputState extends State<WalletInput> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _textController,
          decoration: InputDecoration(
              labelText: 'ADAFlect Address',
              hintText: '0x000...',
              suffixIcon: IconButton(
                onPressed: () {
                  FlutterClipboard.paste().then((value) {
                    _textController.text = value;
                  });
                },
                icon: const Icon(Icons.paste),
              )),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => widget.onShowRewards(_textController.text),
            child: const Text('show rewards'),
          ),
        ),
      ],
    );
  }
}
