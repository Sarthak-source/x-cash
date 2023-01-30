import 'package:flutter/material.dart';

class InvoiceItemsModel{

  final TextEditingController itemNameController;
  final TextEditingController amountController;

  const InvoiceItemsModel({required this.itemNameController, required this.amountController});
}