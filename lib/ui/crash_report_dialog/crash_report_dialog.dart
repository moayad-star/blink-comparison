// Copyright (C) 2022-2024 Yaroslav Pronin <proninyaroslav@mail.ru>
//
// This file is part of Blink Comparison.
//
// Blink Comparison is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Blink Comparison is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Blink Comparison.  If not, see <http://www.gnu.org/licenses/>.

import 'dart:async';

import 'package:blink_comparison/ui/widget/widget.dart';
import 'package:flutter/material.dart';

import '../../locale.dart';

typedef OnReportCallback = FutureOr<bool> Function(String? message);

class CrashReportDialog extends StatefulWidget {
  final Object error;
  final StackTrace? stackTrace;
  final OnReportCallback? onReport;

  const CrashReportDialog({
    super.key,
    required this.error,
    this.stackTrace,
    this.onReport,
  });

  @override
  State<CrashReportDialog> createState() => _CrashReportDialogState();
}

class _CrashReportDialogState extends State<CrashReportDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).error),
      scrollable: true,
      content: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 300),
        child: _Body(
          controller: _controller,
          error: widget.error,
          stackTrace: widget.stackTrace,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            S.of(context).close,
            textAlign: TextAlign.end,
          ),
        ),
        TextButton(
          onPressed: () async {
            if (await widget.onReport?.call(_getComment()) ?? true) {
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            }
          },
          child: Text(
            S.of(context).crashDialogReport,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  String? _getComment() {
    final text = _controller.text;
    return text.isEmpty ? null : text;
  }
}

class _Body extends StatelessWidget {
  final TextEditingController controller;
  final Object error;
  final StackTrace? stackTrace;

  const _Body({
    required this.controller,
    required this.error,
    this.stackTrace,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).crashDialogSummary),
        const SizedBox(height: 8.0),
        Text(S.of(context).crashDialogExtraInfo),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(controller: controller),
        ),
        CustomExpansionTile(
          title: Text(S.of(context).crashDialogMoreDetails),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              [
                error.toString(),
                if (stackTrace != null) stackTrace.toString(),
              ].join('\n'),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontFamily: 'RobotoMono'),
            ),
          ],
        ),
      ],
    );
  }
}
