import 'package:flutter/material.dart';
import 'package:upevent/screens/home.dart';

TextEditingController eventNameController = TextEditingController();
TextEditingController eventDateController = TextEditingController();
TextEditingController eventTimeStartController = TextEditingController();
TextEditingController eventTimeEndController = TextEditingController();
TextEditingController eventDaysController = TextEditingController();
TextEditingController eventAddressController = TextEditingController();
TextEditingController eventBannerURLController = TextEditingController();
TextEditingController eventDescriptionController = TextEditingController();
void createBottomSheet(BuildContext context) {

  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext) {
        return Padding(
          padding: EdgeInsets.only(
              top: 12.0,
              left: 12.0,
              right: 12.0,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Text(
                    "Create a Event",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: eventNameController,
                  decoration: const InputDecoration(
                      hintText: "Eg. Techno Festival", labelText: "Event Name"),
                ),
                TextField(
                  controller: eventTimeStartController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      hintText: "Eg. 6:45 PM", labelText: "Event Start Time"),
                ),
                TextField(
                  controller: eventTimeEndController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      hintText: "Eg. 10:45 PM", labelText: "Event End Time"),
                ),
                TextField(
                  controller: eventDateController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      hintText: "Eg. 27-FEB-2024", labelText: "Event Date"),
                ),
                TextField(
                  controller: eventDescriptionController,
                  decoration: const InputDecoration(
                      hintText: "Eg. Description of event",
                      labelText: "Event Description"),
                ),
                TextField(
                  controller: eventDaysController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "Eg. 2 days duration", labelText: "Event Days"),
                ),
                TextField(
                  controller: eventAddressController,
                  decoration: const InputDecoration(
                      hintText: "Eg. TMA PAI", labelText: "Event Address"),
                ),
                TextField(
                  controller: eventBannerURLController,
                  decoration: const InputDecoration(
                      hintText: "Eg. url of the event banner image",
                      labelText: "Event Banner URL"),
                ),
                ElevatedButton(
                    onPressed: () {
                      final id = DateTime.now().microsecond.toString();
                      databaseReference.child(id).set({
                        "Event Name": eventNameController.text.toString(),
                        "Event Start Time":
                            eventTimeStartController.text.toString(),
                        "Event End Time": eventTimeEndController.text.toString(),
                        "Event Date": eventDateController.text.toString(),
                        "Event Days": eventDaysController.text.toString(),
                        "Event Address": eventAddressController.text.toString(),
                        "Event ImageURL":
                            eventBannerURLController.text.toString(),
                        "Event Description":
                            eventDescriptionController.text.toString(),
                        "uid": id //this is unique id for each event.
                      });
                      // clearing TextController after add event to the sever.
                      eventNameController.clear();
                      eventTimeStartController.clear();
                      eventTimeEndController.clear();
                      eventDateController.clear();
                      eventDaysController.clear();
                      eventAddressController.clear();
                      eventBannerURLController.clear();
                      eventDescriptionController.clear();
                      // going back to main screen.
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Add Event"),
                    ))
              ],
            ),
          ),
        );
      });
}
