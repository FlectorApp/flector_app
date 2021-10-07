// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payout_speed.dart';

// **************************************************************************
// EnumeGenerator
// **************************************************************************

extension PayoutSpeedName on PayoutSpeed {
  String get name => toString().substring(12);
}

extension PayoutSpeedvolume on PayoutSpeed {
  int get volume {
    switch (this) {
      case PayoutSpeed.verySlow:
        return 0;
      case PayoutSpeed.slow:
        return 50000;
      case PayoutSpeed.normal:
        return 150000;
      case PayoutSpeed.perfect:
        return 250000;
    }
  }
}
