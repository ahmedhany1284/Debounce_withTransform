import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable  {
  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final String query;

  SearchLoaded(this.query);

}