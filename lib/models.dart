import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/list.dart';
import 'package:counter_7/form.dart';
import 'package:flutter/services.dart';

class Budget{
    final String judul;
    final int nominal;
    final String tipeBudget;

    Budget(this.judul, this.nominal, this. tipeBudget);
}

class Budgets {
    static List<Budget> budgets= [];
}