import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/model/models.dart';
import 'package:food_app/service/services.dart';

part 'transaksi_state.dart';

class TransaksiCubit extends Cubit<TransaksiState> {
  TransaksiCubit() : super(TransaksiInitial());

  Future<void> getTransaksi() async {
    ApiReturnValue<List<Transaksi>> result =
        await Transactionservice.getTransaksi();
    if (result.value != null) {
      emit(TransaksiLoaded(result.value!));
    } else {
      emit(FailedTransaksiLoaded(result.message!));
    }
  }

  Future<bool> submitTransaction(Transaksi transaksi) async {
    ApiReturnValue<Transaksi> result =
        await Transactionservice.submitTransaksi(transaksi);

    if (result.value != null) {
      emit(TransaksiLoaded(
        (state as TransaksiLoaded).transaksi + [result.value!],
      ));
      return true;
    } else {
      return false;
    }
  }
}
