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

import 'package:auto_route/auto_route.dart';
import 'package:blink_comparison/ui/components/widget.dart';
import 'package:blink_comparison/ui/model/xfile_image.dart';
import 'package:blink_comparison/ui/theme.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../locale.dart';

@RoutePage()
class CameraConfirmationPage extends StatefulWidget {
  final XFileImage image;
  final VoidCallback? onRetry;
  final VoidCallback? onAccept;

  const CameraConfirmationPage({
    super.key,
    required this.image,
    this.onRetry,
    this.onAccept,
  });

  @override
  State<CameraConfirmationPage> createState() => _CameraConfirmationPageState();
}

class _CameraConfirmationPageState extends State<CameraConfirmationPage>
    with TickerProviderStateMixin, ExtendedImageDoubleClickMixin {
  static const _minScale = 1.0;
  static const _maxScale = 5.0;
  static const _doubleClickScale = (_maxScale - _minScale) / 2;
  bool _closed = false;

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (light, dark, black) {
        return Theme(
          data: black,
          child: PopScope(
            onPopInvokedWithResult: (didPop, result) {
              if (!_closed) {
                widget.onRetry?.call();
              }
              _closed = true;
            },
            child: Scaffold(
              extendBody: true,
              body: SizedBox.expand(
                child: ExtendedImage(
                  image: widget.image,
                  mode: ExtendedImageMode.gesture,
                  fit: BoxFit.contain,
                  initGestureConfigHandler: (state) {
                    return GestureConfig(
                      minScale: _minScale,
                      maxScale: _maxScale,
                    );
                  },
                  onDoubleTap: (state) => onDoubleTap(
                    scaleDown: _minScale,
                    scaleUp: _doubleClickScale,
                    state: state,
                  ),
                  loadStateChanged: (state) {
                    return switch (state.extendedImageLoadState) {
                      LoadState.loading || LoadState.completed => null,
                      LoadState.failed => const _OpenImageError(),
                    };
                  },
                ),
              ),
              bottomNavigationBar: _ButtonBar(
                onRetry: () {
                  if (!_closed) {
                    widget.onRetry?.call();
                    _closed = true;
                    context.maybePop();
                  }
                },
                onAccept: () {
                  if (!_closed) {
                    widget.onAccept?.call();
                    _closed = true;
                    context.maybePop();
                  }
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniEndFloat,
            ),
          ),
        );
      },
    );
  }
}

class _ButtonBar extends StatelessWidget {
  final VoidCallback? onRetry;
  final VoidCallback? onAccept;

  const _ButtonBar({
    this.onRetry,
    this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInfo) {
      final orientation = MediaQuery.of(context).orientation;
      return Container(
        width: _getAdaptiveWidth(
          sizingInfo: sizingInfo,
          orientation: orientation,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
        child: OutlinedButtonTheme(
          data: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Symbols.refresh),
                label: Text(S.of(context).retry),
              ),
              FilledButton.tonalIcon(
                onPressed: onAccept,
                icon: const Icon(Symbols.done),
                label: Text(S.of(context).accept),
              ),
            ],
          ),
        ),
      );
    });
  }

  double? _getAdaptiveWidth({
    required SizingInformation sizingInfo,
    required Orientation orientation,
  }) {
    if (sizingInfo.isMobile) {
      if (orientation == Orientation.landscape) {
        return sizingInfo.screenSize.width / 2;
      } else {
        return null;
      }
    } else {
      return sizingInfo.screenSize.width / 2.5;
    }
  }
}

class _OpenImageError extends StatelessWidget {
  const _OpenImageError();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Symbols.error,
              color: theme.colorScheme.error,
              size: 64,
            ),
            const SizedBox(height: 8.0),
            Text(
              S.of(context).openCameraError,
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
