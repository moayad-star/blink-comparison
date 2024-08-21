// Copyright (C) 2022 Yaroslav Pronin <proninyaroslav@mail.ru>
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

import 'package:blink_comparison/core/platform_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;

import '../../injector.dart';

const _shortDuration = Duration(seconds: 2);
const _longDuration = Duration(seconds: 5);

class Toast {
  final BuildContext context;

  Toast.of(this.context);

  void show({
    required String text,
    bool isLong = false,
  }) {
    final platform = getIt<PlatformInfo>();
    if (platform.isAndroid || platform.isIOS || kIsWeb) {
      fluttertoast.Fluttertoast.showToast(
        msg: text,
        toastLength: isLong
            ? fluttertoast.Toast.LENGTH_LONG
            : fluttertoast.Toast.LENGTH_SHORT,
      );
    } else {
      _showFallbackToast(text: text, isLong: isLong);
    }
  }

  void _showFallbackToast({
    required String text,
    required bool isLong,
  }) {
    final toast = fluttertoast.FToast();
    toast.init(context);

    toast.showToast(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).cardColor.withOpacity(0.8),
        ),
        padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
        child: Text(text),
      ),
      toastDuration: isLong ? _longDuration : _shortDuration,
    );
  }
}
