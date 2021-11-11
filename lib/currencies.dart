
class SingleCurrency {
  late String name;
  late String symbol;
  late String price;
  late String icon;
  late String rank;
  late String marketCap;
  late String change1h;
  late String change1d;
  late String change1w;
  late String totalSupply;
  late String availableSupply;
  late String? websiteUrl;

  SingleCurrency({required this.name, required this.price, required this.symbol,
    required this.change1h, required this.icon, required this.rank,
    required this.marketCap, required this.change1d, required this.change1w,
    required this.websiteUrl, required this.totalSupply, required this.availableSupply});
}
