import 'package:enume/enume.dart';

part 'token.g.dart';

@Enume(nameMethod: false)
enum Token {
  @Value('cardano', name: 'id')
  @Value('Cardano', name: 'name')
  @Value('ada', name: 'symbol')
  ada,
  @Value('adaflect', name: 'id')
  @Value('ADAFlect', name: 'name')
  @Value('ADAFlect', name: 'symbol')
  adaflect,
}
