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
import 'package:blink_comparison/ui/about/model/about_cubit.dart';
import 'package:blink_comparison/ui/about/model/about_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock.dart';

void main() {
  group('AboutCubit |', () {
    late PlatformInfo mockPlatform;
    late AboutCubit cubit;

    setUpAll(() {
      mockPlatform = MockPlatformInfo();
    });

    setUp(() {
      cubit = AboutCubit(mockPlatform);
    });

    blocTest(
      'Initial state',
      build: () => cubit,
      expect: () => [],
    );

    blocTest(
      'Load',
      build: () => cubit,
      act: (AboutCubit cubit) async {
        when(
          () => mockPlatform.appInfo,
        ).thenAnswer(
          (_) async => const AppInfo(
            packageName: '',
            appName: 'Test',
            version: '1.0',
            buildNumber: '',
          ),
        );
        await cubit.load();
      },
      expect: () => [
        const AboutState.loading(),
        const AboutState.loaded(
          appName: 'Test',
          appVersion: '1.0',
        ),
      ],
    );
  });
}
