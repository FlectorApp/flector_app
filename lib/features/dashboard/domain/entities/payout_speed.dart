import 'package:enume/enume.dart';

part 'payout_speed.g.dart';

@Enume()
enum PayoutSpeed {
  @Value(0, name: 'volume')
  verySlow,
  @Value(50000, name: 'volume')
  slow,
  @Value(150000, name: 'volume')
  normal,
  @Value(250000, name: 'volume')
  perfect,
}
