part of 'services.dart';

class Transactionservice {
  static Future<ApiReturnValue<List<Transaksi>>> getTransaksi() async {
    await Future.delayed(Duration(seconds: 5));

    return ApiReturnValue(value: mockTransaction);
  }

  static Future<ApiReturnValue<Transaksi>> submitTransaksi(
      Transaksi transaksi) async {
    await Future.delayed(Duration(seconds: 2));

    return ApiReturnValue(
        value: transaksi.copyWith(
      id: 123,
      status: TransactionStatus.canceled,
      total: (transaksi.quantity! * transaksi.food!.price! * 1.1).toInt(),
    ));
  }
}
