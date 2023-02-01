// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dw_delivery_app/app/models/product_model.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;

  const HomeState(
    this.status,
    this.products,
    this.errorMessage,
  );

  HomeState.initial()
      : status = HomeStateStatus.initial,
        products = [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, products];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
  }) {
    return HomeState(
      status ?? this.status,
      products ?? this.products,
      errorMessage ?? this.errorMessage,
    );
  }
}
