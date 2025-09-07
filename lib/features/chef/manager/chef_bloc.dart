import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/data/repositories/chef_repository.dart';
import 'package:recipe_app/features/chef/manager/chef_state.dart';

part 'chef_events.dart';

class ChefBloc extends Bloc<ChefEvents, ChefState> {
  final ChefRepository _repo;

  ChefBloc({required ChefRepository repo})
    : _repo = repo,
      super(ChefState.initial()) {
    on<ChefLoad>(_onChefLoad);
    add(ChefLoad());
  }

  Future<void> _onChefLoad(ChefLoad event, Emitter<ChefState> emit) async {
    try {
      final chefs = await _repo.fetchChefs();
      emit(state.copyWidth(chefs: chefs, status: ChefStatus.success));
    } catch (e) {
      emit(
        state.copyWidth(status: ChefStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
