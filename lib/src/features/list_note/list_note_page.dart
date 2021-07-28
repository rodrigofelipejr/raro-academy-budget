import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_finance_controller/src/shared/constants/app_colors.dart';
import 'package:flutter_finance_controller/src/shared/models/note_model.dart';
import 'package:flutter_finance_controller/src/shared/widget/note.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class ListNotePage extends StatefulWidget {
  const ListNotePage({Key? key}) : super(key: key);

  @override
  _ListNotePageState createState() => _ListNotePageState();
}

class _ListNotePageState extends State<ListNotePage> {
  @override
  void initState() {
    super.initState();
  }

  final List<NoteModel> notes = NoteModel.getList();
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset("assets/images/app_bar_logo_white.png"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.blueGradientAppBar,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: VsScrollbar(
        showTrackOnHover: true,
        isAlwaysShown: true,
        style: VsScrollbarStyle(
          hoverThickness: 2.0,
          radius: Radius.circular(90),
          thickness: 10.0,
          color: AppColors.roxo,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 10),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.search, size: 30),
                  ),
                  hintText: "Pesquisar",
                  hintStyle: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16.0,
                    letterSpacing: 0.15,
                    color: AppColors.ciano,
                  ),
                  labelStyle: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    letterSpacing: 0.15,
                    color: Colors.black.withOpacity(0.54),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemCount: notes.length,
                  itemBuilder: (BuildContext context, int index) => Note(
                    title: notes[index].title,
                    dateString: notes[index].dateString,
                    text: notes[index].text,
                    color: notes[index].color,
                    hasAttachment: notes[index].hasAttachment,
                    hasDate: notes[index].hasDate,
                    isFavorite: notes[index].isFavorite,
                  ),
                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ListNotePage(),
            ),
          );
        },
        child: Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            gradient: AppColors.blueGradient,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                offset: Offset(0.0, 1.0),
                blurRadius: 18.0,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.14),
                offset: Offset(0.0, 6.0),
                blurRadius: 10.0,
              ),
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0.0, 3),
                  blurRadius: 5.0,
                  spreadRadius: -1.0),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownItemData {
  final Color color;
  final String value;

  DropDownItemData({
    required this.color,
    required this.value,
  });
}
