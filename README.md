<div align="center">

<p><img src="fastlane/metadata/android/en-US/images/icon.png" width="150"></p>
<h2><b>Blink Comparison</b></h2>
<h4>Simplifies comparing photos of tamper-evident seals and patterns using your eyes.</h4>

[<img alt="Get it on F-Droid" height="80" src="https://tachibanagenerallaboratories.github.io/images/badges/F-Droid/get-it-on.png">](https://f-droid.org/packages/org.proninyaroslav.blink_comparison)
[<img alt="Get it on Google Play" height="80" src="https://tachibanagenerallaboratories.github.io/images/badges/Google%20Play/google-play-badge.png">](https://play.google.com/store/apps/details?id=org.proninyaroslav.blink_comparison)
[<img alt="Get it on OpenAPK" height="80" src="https://www.openapk.net/images/openapk-badge.png">](https://www.openapk.net/blink-comparison/org.proninyaroslav.blink_comparison/)
[<img alt="Get it on GitHub" height="80" src="https://tachibanagenerallaboratories.github.io/images/badges/GitHub/get-it-on-github.png">](https://github.com/proninyaroslav/blink-comparison/releases)
[<img alt="Direct APK Download" height="80" src="https://tachibanagenerallaboratories.github.io/images/badges/Direct%20Download/direct-apk-download.png">](https://proninyaroslav.ru/mirror/blink_comparison)

![Current version](https://img.shields.io/github/release/proninyaroslav/blink-comparison.svg?logo=github)
![Made with Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue.svg)
[![Releases](https://img.shields.io/github/downloads/proninyaroslav/blink-comparison/total.svg)](https://github.com/proninyaroslav/blink-comparison/releases)
[![Matrix Room](https://img.shields.io/matrix/blink_comparison:matrix.org?label=Matrix%20Room)](https://matrix.to/#/#blink_comparison:matrix.org)
[![Chat - Telegram](https://img.shields.io/badge/chat-Telegram-blue.svg)](https://t.me/blink_comparison)

</div>

---

## Screenshots

<div align="center">

[<img src="art/screenshots/s1.png" width=160>](art/screenshots/s1.png)
[<img src="art/screenshots/s2.png" width=160>](art/screenshots/s2.png)
[<img src="art/screenshots/s3.png" width=160>](art/screenshots/s3.png)
[<img src="art/screenshots/s4.png" width=160>](art/screenshots/s4.png)

</div>

## Description

The concept of "blink comparison" method is simple - the app allows you to quickly switch pictures without delay so you can see the differences.

"Blink comparison" ([Wikipedia](https://en.wikipedia.org/wiki/Blink_comparator)) method uses high efficiency pattern recognition by human eyes, to permit quick verification between a reference picture and an actual one being taken on the spot. For example, in the goal of detecting tampering in high contrast nail polish tamper-evident seals.

Relative documentation on the tamper-evident glitter nail polish seals concept and why it is hard to beat:

- https://trmm.net/Glitter/
- https://www.wired.com/2013/12/better-data-security-nail-polish/
- https://dys2p.com/en/2021-12-tamper-evident-protection.html

[Use, see, change and share](https://en.wikipedia.org/wiki/Free_software); [with all](https://en.wikipedia.org/wiki/Copyleft).

## 📋 Features

- Free and Open Source software (FOSS)
- Support for various platforms and devices (currently Android only)
- Add and store reference pictures in the app or take a photo on the spot
- Encrypting images (optional), making it harder to steal or replacement
- Compare a reference image with the one just taken using "blink comparison" method
- Helps to take a compared photo in the correct position, at the correct angle, lighting and distance
- Material Design 3
- Night theme
- Responsive UI for different devices form factors

## 🔒 Security

Optionally, during initial setup (or at any time), you can enable encryption of reference images so that they are stored in encrypted form, making them difficult to steal or replace. Currently, [password-based encryption](http://www.crypto-it.net/eng/theory/pbe.html) (PBE) is used. It's based on the [XChaCha20Poly1305](https://www.cryptopp.com/wiki/XChaCha20Poly1305) scheme and using a key derived by [Argon2](https://en.wikipedia.org/wiki/Argon2) function "on the fly" (during the encryption/decryption itself). The password is stored in the app as a hash obtained with Argon2.

## 🖥️💻📱 Available platforms

- Android
- ~~Linux~~ (planned)

## 🌍 Translations

- **English**
- **German**
- **Russian**
- **Spanish** _(thanks andgar2010)_
- **French** _(thanks BNouailhac)_

## 💰 Donation

If you like Blink Comparison you can support developer with these methods. If you have problems with payment or you want to donate in another way, contact me: `proninyaroslav@mail.ru`. Thank you!

- **Bitcoin**: `12isaLkH8nZ4DkFguVFeYrGHqQi7EEgUrM `
- **USDT TRC20**: `TK79fzUYwRtmANuLjk1Zzhz3hjTaFQbxfg`
- **Monero**: `48j4Mo7J7t51EeBf35Lpdmehmi9chUwzSXxHrnjpRJ6fPQafPWvSCdFafw3rA5ZRWievfYEDToNso8VppbJf2RVH9cdZmHa`
- **PayPal**: [paypal.me/YaroslavPronin](https://paypal.me/YaroslavPronin)
- **YooMoney (ЮMoney)**: `410011738561939`
- **Patreon**: [patreon.com/YaroslavPronin](https://patreon.com/YaroslavPronin)
- **Boosty**: [boosty.to/yaroslavpronin/donate](https://boosty.to/yaroslavpronin/donate)
- **Amazon.com eGift Cards**: just choose your amount and type e-mail `proninyaroslav@mail.ru`
  in the gift card details [smile.amazon.com/gp/product/B004LLIKVU](https://smile.amazon.com/gp/product/B004LLIKVU)
- **Liberapay**: [![liberapay](https://liberapay.com/assets/widgets/donate.svg)](https://liberapay.com/proninyaroslav/donate)

## ⚙️ Building

Please see [BUILD.md](BUILD.md)

## 🎉 Contributing

Please see [CONTRIBUTING.md](CONTRIBUTING.md)

#### Developers

- [Yaroslav Pronin](https://github.com/proninyaroslav)

#### Logo

- [Ramy (@rshirwan)](https://t.me/rshirwan)

## 🔒 Privacy Policy

Please see our [Privacy Policy](PRIVACY.md).

## 📄 License

[![Large GPLv3 logo with “Free as in Freedom”](https://www.gnu.org/graphics/gplv3-with-text-136x68.png)](http://www.gnu.org/licenses/gpl-3.0.en.html)

    Copyright (C) 2022 Yaroslav Pronin <proninyaroslav@mail.ru>
    This file is part of Blink Comparison.
    Blink Comparison is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
