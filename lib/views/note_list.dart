import 'package:flutter/material.dart';
import 'package:to_do/models/note_for_listing.dart';
import 'package:to_do/views/note_delete.dart';
import 'package:to_do/views/note_modify.dart';

class NoteList extends StatelessWidget {

  final notes = [
    new NoteForListing(
      noteID: "1",
      createDateTime: DateTime.now(),
      lastEditDateTime: DateTime.now(),
      noteTitle: "Note 1",
    ),
    new NoteForListing(
      noteID: "2",
      createDateTime: DateTime.now(),
      lastEditDateTime: DateTime.now(),
      noteTitle: "Note 2",
    ),
    new NoteForListing(
      noteID: "3",
      createDateTime: DateTime.now(),
      lastEditDateTime: DateTime.now(),
      noteTitle: "Note 3",
    ),
    new NoteForListing(
      noteID: "4",
      createDateTime: DateTime.now(),
      lastEditDateTime: DateTime.now(),
      noteTitle: "Note 4",
    ),
    new NoteForListing(
      noteID: "5",
      createDateTime: DateTime.now(),
      lastEditDateTime: DateTime.now(),
      noteTitle: "Note 5",
    ),
  ];

  String formatDateTime(DateTime dateTime)
  {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NOTES")),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
          separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green,),
          itemBuilder: (_, index){
            return Dismissible(
              key: ValueKey(notes[index].noteID),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction){},
              confirmDismiss: (direction) async{
                final result = await showDialog(
                  context: context,
                  builder: (_) => NoteDelete(),
                );
                print(result);
                return result;
              },
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.only(left: 16),
                child: Align(child: Icon(Icons.delete, color: Colors.white), alignment: Alignment.center,),
              ),
              child: ListTile(
                title: Text(
                  notes[index].noteTitle,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text("Last edited on ${formatDateTime(notes[index].lastEditDateTime)}"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => NoteModify(noteID : notes[index].noteID)));
                },
              ),
            );
          },
          itemCount: notes.length,
      ),
    );
  }
}
