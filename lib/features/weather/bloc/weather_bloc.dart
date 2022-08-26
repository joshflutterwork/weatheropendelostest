import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherdelostest/features/weather/data/weather_model.dart';
import 'package:weatherdelostest/features/weather/domain/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo = WeatherRepo();

  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeather>(_getWeather);
  }

  _getWeather(GetWeather event, Emitter<WeatherState> emit) async {
    try {
      var resp = await weatherRepo.getWeather();
      WeatherModel weatherModel = resp;
      emit(WeatherLoaded(weatherModel: weatherModel));
    } catch (e) {}
  }
}
