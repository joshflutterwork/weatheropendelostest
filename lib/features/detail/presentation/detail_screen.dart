import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weatherdelostest/features/detail/data/detail_model.dart';

class WeatherDetail extends StatefulWidget {
  final DetailModel? detailModel;
  const WeatherDetail({Key? key, this.detailModel}) : super(key: key);

  @override
  State<WeatherDetail> createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather Detail"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                widget.detailModel!.date!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                widget.detailModel!.time!,
                style: TextStyle(fontSize: 24),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.detailModel!.temp!,
                    style: TextStyle(fontSize: 24),
                  ),
                  Image.network(widget.detailModel!.urlImage!)
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                widget.detailModel!.weather!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Temp(Min)",
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        widget.detailModel!.tempMin!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Temp(Max)",
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        widget.detailModel!.tempMax!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
