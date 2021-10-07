// dogmapper.dart

// Project imports:
import 'package:flector/features/calculator/data/models/ada_reward_model.dart';
import 'package:flector/features/calculator/domain/entities/ada_reward.dart';
// Package imports:
import 'package:injectable/injectable.dart';
import 'package:smartstruct/smartstruct.dart';

part 'ada_reward_mapper.mapper.g.dart';

@Mapper(useInjection: true)
abstract class AdaRewardMapper {
  AdaReward fromModel(AdaRewardModel model);
  AdaRewardModel fromEntity(AdaReward entity);
}
