import 'dart:async';

enum LengthEvents { add_length_Blue, add_length_purple }

class LengthBloc {
  double _lengthBlue = 100.0;
  double _lengthPurple = 100.0;

  LengthBloc() {
    _eventLengthController.stream.listen(_mapEventToStream);
  }

  // definisikan event controller
  StreamController<LengthEvents> _eventLengthController =
      StreamController<LengthEvents>();

  // definisikan event sink
  StreamSink<LengthEvents> get eventSinkGreen => _eventLengthController.sink;
  StreamSink<LengthEvents> get eventSinkPurple => _eventLengthController.sink;

  // definisikan state controller
  StreamController _stateGreenController = StreamController();
  StreamController _statePurpleController = StreamController();

  // definisikan state sink
  StreamSink get _stateSinkGreen => _stateGreenController.sink;
  StreamSink get _stateSinkPurple => _statePurpleController.sink;

  // definisikan stream
  Stream get stateGreenStream => _stateGreenController.stream;
  Stream get statePurpleStream => _statePurpleController.stream;

  void _mapEventToStream(LengthEvents lengthEvents) {
    if (lengthEvents == LengthEvents.add_length_Blue) {
      _lengthBlue += 10.0;
      _stateSinkGreen.add(_lengthBlue);
    } else {
      _lengthPurple += 10.0;
      _stateSinkPurple.add(_lengthPurple);
    }
  }

  void dispose() {
    _eventLengthController.close();
    _stateGreenController.close();
    _statePurpleController.close();
  }
}
