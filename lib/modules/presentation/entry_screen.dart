import 'package:bloc_todo/modules/presentation/entry_cubit/entry_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'entry_cubit/entry_cubit.dart';

class EntryScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  List<String> list = <String>['SE', 'JSE', 'SSE', 'QA'];
  EntryScreen({super.key});
  String dropdownValue = "SE";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<EntryCubit, EntryState>(
                    builder: (BuildContext context, state) {
                  dateInput.text = state.dob!;
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "User Entry Form",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _nameController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Designation             ",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            DropdownMenu<String>(
                              initialSelection: list.first,
                              onSelected: (String? value) {
                                // This is called when the user selects an item.
                                // setState(() {
                                //   dropdownValue = value!;
                                // });
                                dropdownValue = value!;
                                print(dropdownValue);
                              },
                              dropdownMenuEntries: list
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                return DropdownMenuEntry<String>(
                                    value: value, label: value);
                              }).toList(),
                            ),
                          ],
                        ),
                        const Text(
                          "Gender             ",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            ListTile(
                              title: const Text('Male'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.male,
                                groupValue: state.character,
                                onChanged: (SingingCharacter? value) {
                                  BlocProvider.of<EntryCubit>(context)
                                      .updateGender(SingingCharacter.male);
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Female'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.female,
                                groupValue: state.character,
                                onChanged: (SingingCharacter? value) {
                                  BlocProvider.of<EntryCubit>(context)
                                      .updateGender(SingingCharacter.female);
                                  // setState(() {
                                  //   _character = value;
                                  // });
                                },
                              ),
                            ),
                          ],
                        ),
                        Container(
                            padding: const EdgeInsets.all(15),
                            height: MediaQuery.of(context).size.width / 3,
                            child: Center(
                                child: TextField(
                              controller: dateInput,
                              //editing controller of this TextField
                              decoration: const InputDecoration(
                                  icon: Icon(Icons
                                      .calendar_today), //icon of text field
                                  labelText: "Enter Date" //label text of field
                                  ),
                              readOnly: true,
                              //set it true, so that user will not able to edit text
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16

                                  BlocProvider.of<EntryCubit>(context)
                                      .dobUpdate(formattedDate);
                                  // setState(() {
                                  //   dateInput.text =
                                  //       formattedDate; //set output date to TextField value.
                                  // });
                                } else {}
                              },
                            ))),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("SUBMIT"))
                      ]);
                }))));
  }
}
