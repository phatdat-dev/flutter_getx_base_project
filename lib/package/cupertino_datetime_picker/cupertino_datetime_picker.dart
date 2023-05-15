// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef PickerConfirmCallback = void Function(DateTime start, DateTime end);

enum DateTimeRangePickerMode {
  time,
  date,
  dateAndTime,
}

class DateTimeRangePicker {
  final String startText;
  final String endText;
  final String doneText;
  final String cancelText;
  final bool use24hFormat;
  final DateTimeRangePickerMode mode;

  DateTime? initialStartTime;
  DateTime? initialEndTime;
  DateTime? minimumTime;
  DateTime? maximumTime;

  final VoidCallback? onCancel;
  final PickerConfirmCallback? onConfirm;

  final int interval;

  DateTimeRangePicker({
    Key? key,
    this.startText = 'Start',
    this.endText = 'End',
    this.doneText = 'OK',
    this.cancelText = 'Cancel',
    this.mode = DateTimeRangePickerMode.dateAndTime,
    this.interval = 15,
    this.use24hFormat = false,
    this.minimumTime,
    this.maximumTime,
    this.initialStartTime,
    this.initialEndTime,
    this.onCancel,
    this.onConfirm,
  });

  void showPicker(BuildContext context) {
    initialStartTime ??= DateTime.now().subtract(const Duration(days: 365));

    // Remove minutes and seconds to prevent exception of cupertino picker: initial minute is not divisible by minute interval
    initialStartTime = initialStartTime!.subtract(Duration(minutes: initialStartTime!.minute, seconds: initialStartTime!.second));

    initialEndTime ??= DateTime.now();
    // initialStartTime!.add(Duration(days: mode == DateTimeRangePickerMode.time ? 0 : 1, hours: mode == DateTimeRangePickerMode.time ? 2 : 0));

    initialEndTime = initialEndTime!.subtract(Duration(minutes: initialEndTime!.minute, seconds: initialEndTime!.second));

    if (minimumTime != null) {
      minimumTime = minimumTime!.subtract(Duration(minutes: minimumTime!.minute, seconds: minimumTime!.second));
    }

    if (maximumTime != null) {
      maximumTime = maximumTime!.subtract(Duration(minutes: maximumTime!.minute, seconds: maximumTime!.second));
    }

    var pickerMode = CupertinoDatePickerMode.dateAndTime;

    switch (mode) {
      case DateTimeRangePickerMode.date:
        {
          pickerMode = CupertinoDatePickerMode.date;
        }
        break;

      case DateTimeRangePickerMode.time:
        {
          pickerMode = CupertinoDatePickerMode.time;
        }
        break;

      default:
        {
          pickerMode = CupertinoDatePickerMode.dateAndTime;
        }
        break;
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.5,
            child: PickerWidget([
              Tab(text: startText),
              Tab(text: endText),
            ], initialStartTime!, initialEndTime!, interval, onCancel, onConfirm, pickerMode, doneText, cancelText, minimumTime, maximumTime,
                use24hFormat),
          );
        });
  }
}

class PickerWidget extends StatefulWidget {
  final List<Tab> _tabs;
  final int _interval;
  final VoidCallback? _onCancel;
  final PickerConfirmCallback? _onConfirm;

  final DateTime _initStart;
  final DateTime _initEnd;
  final CupertinoDatePickerMode _mode;

  final String _doneText;
  final String _cancelText;
  final DateTime? _minimumTime;
  final DateTime? _maximumTime;
  final bool _use24hFormat;

  const PickerWidget(this._tabs, this._initStart, this._initEnd, this._interval, this._onCancel, this._onConfirm, this._mode, this._doneText,
      this._cancelText, this._minimumTime, this._maximumTime, this._use24hFormat,
      {Key? key})
      : super(key: key);

  @override
  _PickerWidgetState createState() => _PickerWidgetState();
}

class _PickerWidgetState extends State<PickerWidget> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  DateTime? _start;
  DateTime? _end;

  @override
  void initState() {
    super.initState();
    _start = widget._initStart;
    _end = widget._initEnd;

    _tabController = TabController(vsync: this, length: widget._tabs.length);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: TabBar(
            controller: _tabController,
            tabs: widget._tabs,
            labelColor: Theme.of(context).primaryColor,
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: 320,
              alignment: Alignment.topCenter,
              child: TabBarView(
                controller: _tabController,
                children: widget._tabs.map((Tab tab) {
                  return CupertinoDatePicker(
                    mode: widget._mode,
                    use24hFormat: widget._use24hFormat,
                    minuteInterval: widget._interval,
                    minimumDate: tab.text == widget._tabs.first.text ? widget._minimumTime : null,
                    maximumDate: tab.text == widget._tabs.last.text ? widget._maximumTime : null,
                    initialDateTime: tab.text == widget._tabs.first.text ? _start : _end,
                    onDateTimeChanged: (DateTime newDateTime) {
                      if (tab.text == widget._tabs.first.text) {
                        setState(() {
                          _start = newDateTime;
                        });
                      } else {
                        setState(() {
                          _end = newDateTime;
                        });
                      }
                    },
                  );
                }).toList(),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (widget._onCancel != null) {
                        widget._onCancel!();
                      }
                    },
                    child: Text(widget._cancelText),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (widget._onConfirm != null) {
                        widget._onConfirm!(_start!, _end!);
                      }
                    },
                    child: Text(widget._doneText),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
