part of 'transaksi_cubit.dart';

sealed class TransaksiState extends Equatable {
  const TransaksiState();

  @override
  List<Object> get props => [];
}

final class TransaksiInitial extends TransaksiState {
  @override
  List<Object> get props => [];
}

final class TransaksiLoaded extends TransaksiState {
  final List<Transaksi> transaksi;

  TransaksiLoaded(this.transaksi);

  @override
  List<Object> get props => [transaksi];
}

final class FailedTransaksiLoaded extends TransaksiState {
  final String message;

  FailedTransaksiLoaded(this.message);

  @override
  List<Object> get props => [message];
}
