
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_application/app/screens/notes_editing_screen/edit_notes.dart';
import 'package:notes_application/app/widgets/bigText.dart';

import '../../models/notes_model.dart';
import '../../providers/providers.dart';
import '../../widgets/small_text.dart';
import '../create_notes/create_notes.dart';

class NotesHomeScreen extends ConsumerWidget {
  NotesHomeScreen({Key? key}) : super(key: key);

  String hours = '';
  String minutes = '';
  DateTime _currDate = DateTime.now();
  String formattedDate = '';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var myUid = ref.watch(firebaseAuthProvider).currentUser?.uid;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.black),
          title: BigText(
            text: 'Your Notes',
            fontFamily: 1,
            weight: 600,
            size: 24.sp,
            color: Colors.black,
          ),
        ),
        body: StreamBuilder<List<Notes>>(
          stream: ref.watch(notesDatabaseProvider)!.getAllNotes(myUid?? ''),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.active &&
                snapshot.data != null){
              if (snapshot.data!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50.h,
                        ),
                        child: BigText(
                          text: "No products yet...",
                          weight: 500,
                          size: 16.sp,
                          fontFamily: 1,
                          color: Colors.black,
                        ),
                      ),
                      Lottie.asset(
                        "lib/app/widgets/anim/empty-box.json",
                        width: 200,
                        repeat: false,
                        height: 250.h,
                      ),
                    ],
                  ),
                );
              }
              else {
                final notes = snapshot.data!;
                return Container(
                  margin: EdgeInsets.only(
                    right: 20.w,
                    left: 20.w,
                    top: 10.h,
                  ),
                  height: MediaQuery.of(context).size.height,
                  child: StaggeredGridView.countBuilder(
                    staggeredTileBuilder: (index) => const StaggeredTile.count(1,1),
                    itemCount: notes.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 14.h,
                    crossAxisSpacing: 10.w,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      _currDate = notes[index].savingTime;
                      formattedDate = DateFormat.MMMEd().format(_currDate);
                      hours = _currDate.hour.toString();
                      minutes = _currDate.minute.toString();
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_)=>
                                  EditNotes(notes: notes[index])));
                        },
                        child: _buildNotes(context, notes[index], ref),
                      );
                    },
                  ),
                );
              }
            }else{
              return const Center(
                  child: CircularProgressIndicator(),
              );
            }
          },
        ),

        floatingActionButton: FloatingActionButton(
          heroTag: 'btn6',

          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CreateNotes())),
        ),
      ),
    );
  }

  Widget _buildNotes(BuildContext context, Notes notes, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(
        right: 6.w,
        left: 6.w,
        top: 6.h
      ),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 4.r,
            offset: const Offset(1,4)
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notes.notesTitle,
                style: GoogleFonts.montserrat(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 5.h
                ),
                child: PopupMenuButton<Widget>(

                  shape:  const CircleBorder(
                    side: BorderSide.none,
                  ),
                  child: Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 15.h,
                  ),
                    itemBuilder: (context) =>[
                      PopupMenuItem(
                        height: 25.h,
                        onTap: () async {
                          await ref.read(notesDatabaseProvider)!
                              .deleteNotes(notes.id);
                        },
                        child: Center(
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 15.h,
                          ),
                        )
                      ),
                    ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10.h,
            ),
            height: 85.h,
            child: Text(
              notes.notes,
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: 'Last Updated :',
                      fontFamily: 1,
                      weight: 500,
                      size: 10.sp,
                      color: Colors.white,
                    ),
                    SmallText(
                      text: '$formattedDate | $hours : $minutes PM',
                      fontFamily: 1,
                      weight: 500,
                      size: 10.sp,
                      color: Colors.white,
                    ),
                  ],
                ),
                // FloatingActionButton(
                //   onPressed: () {
                //     Navigator.of(context).push(
                //         MaterialPageRoute(builder: (_) => EditNotes(notes: notes)));
                //   },
                //   backgroundColor: Colors.blue,
                //   child: const Icon(Icons.edit, color: Colors.white),
                // )
              ],
            )
          )
        ],
      ),
    );
  }
}
