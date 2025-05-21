import 'package:carrental/model/cars/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addUser() {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  return users
      .add({
    'full_name': 'John Doe',
    'company': 'Stokes and Sons',
    'age': 42
  })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<List<Car>> fetchCars() async {
  final snapshot = await FirebaseFirestore.instance.collection('cars').get();
  return snapshot.docs
      .map((doc) => Car.fromFirestore(doc.data(), doc.id))
      .toList();
}

/*

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']}");
        }

        return Text("loading");
      },
    );
  }
}
*/
