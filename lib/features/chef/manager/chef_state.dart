import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/models/chef_model.dart';

enum ChefStatus { loading, success, error }

class ChefState extends Equatable {
  final List<ChefModel> chefs;
  final ChefStatus status;
  final String? errorMessage;

  const ChefState({
    required this.chefs,
    required this.status,
    required this.errorMessage,
  });

  factory ChefState.initial() {
    return ChefState(chefs: [], status: ChefStatus.loading, errorMessage: null);
  }

  ChefState copyWidth({
    List<ChefModel>? chefs,
    ChefStatus? status,
    String? errorMessage,
  }) {
    return ChefState(
      chefs: chefs ?? this.chefs,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [chefs, status, errorMessage];
}
