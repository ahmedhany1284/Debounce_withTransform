import 'package:bloc/bloc.dart';
import 'package:counter_task/bloc/events.dart';
import 'package:counter_task/bloc/states.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<QueryChanged>(
          (event, emit)  {
        print(event.query) ;
        emit(SearchLoaded(event.query));
      },
      transformer: (events, mapper) {
        final debouncedEvents = events
            .where((event) => event.needsDebounce)
            .debounceTime(const Duration(milliseconds: 3000));
        final notDebouncedEvents =
        events.where((event) => !event.needsDebounce);
        return MergeStream([debouncedEvents, notDebouncedEvents])
            .flatMap(mapper);
      },
    );
  }
}

