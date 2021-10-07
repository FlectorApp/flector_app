// ignore_for_file: one_member_abstracts

import 'package:flector/features/dashboard/data/models/price_model.dart';
import 'package:flector/features/dashboard/domain/entities/price.dart';
import 'package:smartstruct/smartstruct.dart';

part 'price_model_mapper.mapper.g.dart';

@Mapper(useInjection: false)
abstract class PriceModelMapper {
  static PriceModelMapper get I => PriceModelMapperImpl();

  Price fromModel(PriceModel model);
}
