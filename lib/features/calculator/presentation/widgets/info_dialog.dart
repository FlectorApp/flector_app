import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

const _wallet = '0xFc670D1D34c83Cf59A678a513c50F41360cFE6Ae';
void showInfoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Flector'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 8.0,
              ),
              Text(
                'Development Roadmap:',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text('- prettier design'),
              const Text('- ADAFlect Balance'),
              const Text('- statistics & charts'),
              const Text('- ROI calculator'),
              const Text('- New domain and faster hosting'),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                'Support this project: ',
                style: Theme.of(context).textTheme.headline6,
              ),
              Row(
                children: [
                  const SelectableText(
                    _wallet,
                  ),
                  IconButton(
                    onPressed: () => FlutterClipboard.copy(_wallet),
                    icon: const Icon(Icons.copy),
                  )
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
