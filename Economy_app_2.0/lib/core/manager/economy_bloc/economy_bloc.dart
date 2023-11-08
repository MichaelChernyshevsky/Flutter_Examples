// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class SomeBloc extends Bloc<EconomyBlocEvent, EconomyBlocState> {
  SomeBloc() : super(NotesInitial()) {
    on<DeleteSpendingEvent>(_deleteSpending);
    on<AddSpending>(_createFolder);
    on<GetSpendingsEvent>(_getSpending);
  }

  // ServiceApiNotes service = ServiceApiNotes();

  Future<void> _deleteSpending(
    DeleteSpendingEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    try {
      // await service.deleteFolder(event.id);
      emit(DeleteSucess());
    } catch (error) {
      emit(BlocError());
    }
  }

  Future<void> _createFolder(
    AddSpending event,
    Emitter<EconomyBlocState> state,
  ) async {
    try {} catch (error) {
      emit(BlocError());
    }
  }

  Future<void> _getSpending(
    GetSpendingsEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    try {
      // await service.deleteFolder(event.id);
      emit(DeleteSucess());
    } catch (error) {
      emit(BlocError());
    }
  }
}
