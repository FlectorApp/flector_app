import 'package:enume/enume.dart';

part 'currency.g.dart';

@Enume()
enum Currency {
  @Value('\\\$', name: 'symbol')
  @Value('USD', name: 'isoCode')
  usd,
  @Value('€', name: 'symbol')
  @Value('EUR', name: 'isoCode')
  eur,
  @Value('£', name: 'symbol')
  @Value('GPB', name: 'isoCode')
  gbp,
}
