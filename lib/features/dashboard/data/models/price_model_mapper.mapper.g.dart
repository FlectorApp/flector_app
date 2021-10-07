// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_model_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class PriceModelMapperImpl extends PriceModelMapper {
  PriceModelMapperImpl() : super();

  @override
  Price fromModel(PriceModel model) {
    final price = Price(
        price: model.price,
        token: model.token,
        currency: model.currency,
        marketCap: model.marketCap,
        volume24h: model.volume24h,
        change24h: model.change24h,
        lastUpdated: model.lastUpdated);
    return price;
  }
}
