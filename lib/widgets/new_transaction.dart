// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './adaptive_button.dart';

class NewTransaction extends StatefulWidget {
  // NewTransaction({Key? key}) : super(key: key);

  final Function addTx;

  // ignore: prefer_const_constructors_in_immutables
  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  late DateTime _selectedDate;
  bool _dateSelect = false;

  void _submitData() {
    if (_amountControler.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleControler.text;
    final enteredAmount = double.parse(_amountControler.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _dateSelect == false) {
      return;
    } else {
      widget.addTx(enteredTitle, enteredAmount, _selectedDate);
      Navigator.of(context).pop();
    }
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        _dateSelect = false;
        return;
      }
      setState(() {
        _dateSelect = true;
        _selectedDate = pickedDate;
      });
    });
  }

  bool isDate(int str) {
    try {
      DateTime(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                autocorrect: true,
                cursorColor: Colors.red,
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleControler,
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) => titleInput = val,
              ),
              TextField(
                autocorrect: true,
                cursorColor: Colors.red,
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _amountControler,
                // ignore: prefer_const_constructors
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 45,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _dateSelect == false
                            ? 'No Date chosen!'
                            : 'Selected Date: ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    AdaptiveFlatButton(_presentDatePicker, 'Choose Date'),
                  ],
                ),
              ),
              ElevatedButton(
                //onPressed: ,
                child: const Text('Add New Transaction'),
                // textColor: Colors.purple,
                style: TextButton.styleFrom(
                    primary: Theme.of(context).textTheme.button?.color),
                onPressed: _submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
