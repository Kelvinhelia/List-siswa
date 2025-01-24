// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:list_siswa_app/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController classesController = TextEditingController();
  TextEditingController majorController = TextEditingController();

  List<Siswa> listSiswa = List.empty(growable: true);
  
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Column(
          children: [
            Text("LIST SISWA SMK PPLG"),
            Text("Kelvin H XII PPLG")
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(
                hintText: "First Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                hintText: "Last Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 2,
              controller: classesController,
              decoration: const InputDecoration(
                hintText: "Classes",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: majorController,
              decoration: const InputDecoration(
                hintText: "Major",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  String firstName = firstNameController.text.trim();
                  String lastName = lastNameController.text.trim();
                  String classes = classesController.text.trim();
                  String major = majorController.text.trim();

                  if(firstName.isNotEmpty && lastName.isNotEmpty && classes.isNotEmpty && major.isNotEmpty) {
                    setState(() {
                      firstNameController.text = "";
                      lastNameController.text = "";
                      classesController.text = "";
                      majorController.text = "";

                      listSiswa.add(Siswa(firstName: firstName, lastName: lastName, classes: classes, major: major));
                    });
                  }
                }, child: const Text("Submit")),
                ElevatedButton(onPressed: () {
                  String firstName = firstNameController.text.trim();
                  String lastName = lastNameController.text.trim();
                  String classes = classesController.text.trim();
                  String major = majorController.text.trim();

                  if(firstName.isNotEmpty && lastName.isNotEmpty && classes.isNotEmpty && major.isNotEmpty) {
                    setState(() {
                      firstNameController.text = "";
                      lastNameController.text = "";
                      classesController.text = "";
                      majorController.text = "";

                      listSiswa[selectedIndex].firstName = firstName;
                      listSiswa[selectedIndex].lastName = lastName;
                      listSiswa[selectedIndex].classes = classes;
                      listSiswa[selectedIndex].major = major;
                      
                      selectedIndex = -1;
                    });
                  }
                }, child: const Text("Update")),
              ],
            ),
            const SizedBox(height: 25),
            listSiswa.isEmpty
                ? const Text(
                    "No Data Available",
                    style: TextStyle(fontSize: 20),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: listSiswa.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
  return Card(
    child: ListTile(
      leading: CircleAvatar(
        child: Text(
          listSiswa[index].firstName[0],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Menjaga agar teks di sebelah kiri
        children: [
          Row(
            children: [
              Text(
                listSiswa[index].firstName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8), // Jarak antara firstName dan lastName
              Text(
                listSiswa[index].lastName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Text(listSiswa[index].classes),
              const SizedBox(width: 8),
              Text(listSiswa[index].major),
            ],
          )
        ],
      ),
      trailing: SizedBox(
        width: 70,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                firstNameController.text = listSiswa[index].firstName;
                lastNameController.text = listSiswa[index].lastName;
                classesController.text = listSiswa[index].classes;
                majorController.text = listSiswa[index].major;
                setState(() {
                  selectedIndex = index;
                });
              },
              child: const Icon(Icons.edit)),
            InkWell(
              onTap: () {
                setState(() {
                  listSiswa.removeAt(index);
                });
              },
              child: const Icon(Icons.delete)),
          ],
        ),
      ),
    ),
  );
}
}

//   Widget getRow(int index) {
//     return Card(
//       child: ListTile(
//         leading: CircleAvatar(
//           child: Text(listSiswa[index].firstName[0],
//           style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           ),
//         title: Column(
//           children: [
//             Text(listSiswa[index].firstName, semanticsLabel: listSiswa[index].lastName),
//             Text(listSiswa[index].classes),
//             Text(listSiswa[index].major),
//           ],
//         ),
//         trailing: const SizedBox(
//           width: 70,
//           child: Row(
//             children: [
//               Icon(Icons.edit),
//               Icon(Icons.delete),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


