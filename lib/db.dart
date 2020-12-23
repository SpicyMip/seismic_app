import 'package:firebase_database/firebase_database.dart';
import 'Temblores.dart';

class Database {
  final databaseReference = FirebaseDatabase.instance.reference();

  Future<List<Temblores>> getTemblores() async {
    DataSnapshot dataSnapshot =
        await databaseReference.child('temblores/').once();
    List<Temblores> temblores = [];
    if (dataSnapshot.value != null) {
      dataSnapshot.value.forEach((key, value) {
        Temblores temblor = createTemblor(value);
        temblores.add(temblor);
      });
    }
    return temblores;
  }
}
