abstract class SearchEvent {
  bool get needsDebounce;
}

class QueryChanged extends SearchEvent {
  final String query;

  QueryChanged(this.query);

  @override
  bool get needsDebounce => true;
}

class DebounceEvent extends SearchEvent {
  @override
  bool get needsDebounce => false;
}
