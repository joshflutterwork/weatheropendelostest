import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherdelostest/features/detail/data/detail_model.dart';
import 'package:weatherdelostest/features/detail/presentation/detail_screen.dart';
import 'package:weatherdelostest/features/weather/bloc/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherBloc weatherBloc = WeatherBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherBloc.add(GetWeather());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Screen"),
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        bloc: weatherBloc,
        listener: (context, state) {
          // TODO: implement listener
          if (state is WeatherLoaded) {
            print(state.weatherModel!.city!);
          }
        },
        builder: (context, state) {
          if (state is WeatherLoaded) {
            return ListView.builder(
                itemCount: state.weatherModel!.list!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeatherDetail(
                                  detailModel: DetailModel(
                                      date: DateFormat('EEEE, d MMM yyyy')
                                          .format(
                                            DateTime.parse(state.weatherModel!
                                                .list![index].dtTxt!),
                                          )
                                          .toString(),
                                      temp: (state.weatherModel!.list![index]
                                                      .main!.temp! -
                                                  (273.15))
                                              .toInt()
                                              .toString() +
                                          "C",
                                      tempMax: (state.weatherModel!.list![index]
                                                      .main!.tempMax! -
                                                  (273.15))
                                              .toInt()
                                              .toString() +
                                          "C",
                                      tempMin: (state.weatherModel!.list![index]
                                                      .main!.tempMin! -
                                                  (273.15))
                                              .toInt()
                                              .toString() +
                                          "C",
                                      urlImage:
                                          "https://openweathermap.org/img/wn/${state.weatherModel!.list![index].weather![0].icon}@2x.png",
                                      weather: state.weatherModel!.list![index]
                                          .weather![0].main
                                          .toString(),
                                      time: DateFormat()
                                          .add_jm()
                                          .format(
                                            DateTime.parse(state.weatherModel!
                                                .list![index].dtTxt!),
                                          )
                                          .toString()),
                                )),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 0.2))),
                      child: Row(
                        children: [
                          Image.network(
                              "https://openweathermap.org/img/wn/${state.weatherModel!.list![index].weather![0].icon}@2x.png"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                DateFormat('EEEE, d MMM yyyy')
                                    .add_jm()
                                    .format(
                                      DateTime.parse(state
                                          .weatherModel!.list![index].dtTxt!),
                                    )
                                    .toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              Container(
                                child: Text(state
                                    .weatherModel!.list![index].weather![0].main
                                    .toString()),
                              ),
                              Container(
                                child: Text("Temp: " +
                                    (state.weatherModel!.list![index].main!
                                                .temp! -
                                            (273.15))
                                        .toInt()
                                        .toString() +
                                    "C"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else
            return Container();
        },
      ),
    );
  }
}
