// ignore_for_file: prefer_const_constructors

import 'package:daily_expenditure_tracker/Controllers/AuthController.dart';
import 'package:daily_expenditure_tracker/Controllers/HomeScreencontroller.dart';
import 'package:daily_expenditure_tracker/Utils/Constant.dart';
import 'package:daily_expenditure_tracker/models/Textcontrolerrmodel.dart';
import 'package:daily_expenditure_tracker/models/types.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class addExpense extends GetView<homeScreenController> {
  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find<AuthController>();
    return GetBuilder(
      init: Get.find<homeScreenController>(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Appcolors.backgroundColor,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width(30)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Expense",
                          style: TextStyle(
                              color: Appcolors.buttonColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: () {
                            dateTImePicker(context);
                          },
                          child: Text(
                            DateFormat('yyyy-MM-dd')
                                .format(DateTime.now())
                                .toString(),
                            style: TextStyle(
                                color: Appcolors.buttonColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    size.HeightSpace(20),
                    appTextField(
                      labelText: "Price",
                      textEditingController: controller.priceController,
                      onchange: (value) {
                        if (controller.checkBoxList.length > 0) {
                          controller.val =
                              int.parse(value) / controller.checkBoxList.length;
                        } else {
                          controller.val = int.parse(value).toDouble();
                        }
                        controller.update();
                      },
                    ),
                    size.HeightSpace(20),
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        //Add isDense true and zero Padding.
                        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        labelText: "Types",
                        labelStyle: TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Appcolors.buttonColor, width: 0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Appcolors.buttonColor, width: 0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Appcolors.buttonColor, width: 0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        //Add more decoration as you want here
                        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Select Your Type',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                      items: auth.types
                          .map((item) => DropdownMenuItem<typeModel>(
                                value: item,
                                child: Text(
                                  "${item.name}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select gender.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        controller.selectedValue = value?.name ?? "";
                      },
                      style: TextStyle(color: Colors.white),
                      onSaved: (value) {
                        controller.selectedValue = value.toString();
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 60,
                      ),
                      iconStyleData: IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Appcolors.buttonColor,
                        ),
                        iconSize: 30,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          color: Appcolors.cardColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    size.HeightSpace(20),
                    Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      children: [
                        for (int i = 0; i < auth.users.length; i++)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Theme(
                                data: ThemeData(
                                  unselectedWidgetColor: Appcolors
                                      .buttonColor, // Set the border color when unchecked
                                ),
                                child: Checkbox(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1,
                                          color: Appcolors.buttonColor),
                                      borderRadius: BorderRadius.circular(5)),
                                  side:
                                      BorderSide(color: Appcolors.buttonColor),
                                  value:
                                      controller.checkcontains(auth.users[i]),
                                  onChanged: (bool? newValue) {
                                    if (!newValue!) {
                                      controller.checkBoxList.removeWhere(
                                          (element) =>
                                              element.id == auth.users[i].id);

                                      controller.nameController.removeWhere(
                                          (element) =>
                                              element.id == auth.users[i].id);
                                      controller.val = int.parse(
                                              controller.priceController.text) /
                                          controller.checkBoxList.length;
                                    } else {
                                      controller.checkBoxList
                                          .add(auth.users[i]);
                                      TextEditingController cont =
                                          TextEditingController();

                                      controller.nameController.add(
                                          txtController(
                                              id: auth.users[i].id!,
                                              controller: cont));
                                      if (controller.checkBoxList.length > 0) {
                                        controller.val = int.parse(controller
                                                .priceController.text) /
                                            controller.checkBoxList.length;
                                      }
                                    }
                                    controller.update();
                                  },
                                  activeColor: Appcolors
                                      .buttonColor, // Set the color of the checkbox when checked
                                ),
                              ),
                              Text(
                                "${auth.users[i].username}",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ],
                          ),
                      ],
                    ),
                    size.HeightSpace(20),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.checkBoxList.length,
                      itemBuilder: (context, index) {
                        controller.nameController[index].controller.text =
                            controller.val.toString();
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            appTextField(
                              labelText:
                                  controller.checkBoxList[index].username ?? "",
                              textEditingController:
                                  controller.nameController[index].controller,
                            ),
                            size.HeightSpace(20)
                          ],
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.addData();
                      },
                      child: Center(child: Text("Add")),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) => Appcolors.buttonColor)),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  dateTImePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Material(
            color: Appcolors.cardColor,
            borderRadius: BorderRadius.circular(10),
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.dark(
                  primary: Appcolors.buttonColor,
                ),
              ),
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 1),
                lastDate: DateTime(DateTime.now().year + 1),
                onDateChanged: (value) {
                  Get.back();
                  controller.selectedDate =
                      DateFormat('yyyy-MM-dd').format(value);
                },
              ),
            ),
          ),
        ));
      },
    );
  }
}
