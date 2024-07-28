import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_zentech/bloc/user_state.dart';
import 'package:test_project_zentech/widgets.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../repository/repository.dart';
import 'card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserBloc bloc = UserBloc(Repository());
  ScrollController _scrollController = ScrollController();
  int _centeredItemIndex = -1;
  int _clickedItemIndex = -1;


  List<IconData> iconTypes = [
    Icons.cake,
    Icons.add_location_sharp,
    Icons.zoom_in_outlined,
    Icons.auto_awesome_motion,
    Icons.call_end_sharp,
    Icons.equalizer_rounded,
    Icons.wifi_lock,
    Icons.mail,
    Icons.cake,
    Icons.add_location_sharp,
    Icons.zoom_in_outlined,
    Icons.auto_awesome_motion,
    Icons.call_end_sharp,
    Icons.equalizer_rounded,
    Icons.wifi_lock,
    Icons.mail,
  ];
  List numbers = [
   "1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"

  ];
bool isChangeClr = false;
  void _onScroll() {
    if (_scrollController.position.haveDimensions) {
      double itemWidth = 60.0; // Adjust according to your item width
      double scrollOffset = _scrollController.offset;
      int centeredIndex = (scrollOffset + (MediaQuery.of(context).size.width / 2)) ~/ itemWidth;

      if (centeredIndex != _centeredItemIndex && centeredIndex >= 0 && centeredIndex < iconTypes.length) {
        setState(() {
          _centeredItemIndex = centeredIndex;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    bloc.add(GetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
      leading: const Icon(Icons.menu_outlined,color: Colors.white,),
      actions:const [Padding(
        padding:  EdgeInsets.only(right: 15),
        child: Icon(Icons.doorbell_outlined,color: Colors.white,),
      )],
        bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 70),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 20),
              child: const Column(
              crossAxisAlignment:  CrossAxisAlignment.stretch,
                        children: [
              Text('Home', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
                        Text('Team bedrijsfbureau', style: TextStyle(fontSize: 15,color: Colors.white),),
                        ],),
            ),

        )
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, state) {
          if(state is LoadingState){
            return Center(child: CircularProgressIndicator(),);
          }
          else  if(state is ErrorState){
            return Center(child: Text(state.msg ?? ''),);
          }
          else  if(state is LoadedDataUser){
           return  Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15),
             child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisSize: MainAxisSize.max,
                 children: [
                   Widgets.spacer(height: 25),
                   const Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Verbetersuggesties',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                       Icon(CupertinoIcons.add_circled_solid,color: Colors.blueAccent,)
                     ],
                   ),
                   Widgets.spacer(height: 3),
                   Container(height: 2,width: 50,color: Colors.blue,),
                   Widgets.spacer(),
                   Container(
                     height: 230,
                     child: GridView.builder(
                       itemCount: state.Data.data?.length ?? 6,
                       physics: AlwaysScrollableScrollPhysics(),
                       scrollDirection: Axis.horizontal,
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 10,childAspectRatio: 1),
                       shrinkWrap: true,
                       itemBuilder: (context, index) {
                         return CardWidget(email: state.Data!.data?[index].email,firstName: state.Data!.data?[index].firstName,img: state.Data!.data?[index].avatar,);
                       },),
                   ),
                   Widgets.spacer(),
                   Widgets.CustomText(data: 'Score',fontSize: 18,fontWeight: FontWeight.bold, ),
               //    const Text('Score',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                   Widgets.spacer(height: 3),
                   Container(height: 2,width: 50,color: Colors.blue,),
                   Widgets.spacer(),
                   Container(
                     width: double.infinity,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                       color: Colors.white,
                       boxShadow: [
                         BoxShadow(
                             color: Colors.black.withOpacity(0.1),blurRadius:4
                         )
                       ],
                     ),
                     child: const Padding(
                       padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                       child: Column(
                         crossAxisAlignment:CrossAxisAlignment.stretch ,
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Icon(Icons.gite),
                               Text('65',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.amber),),
                             ],
                           ),
                           Text('Goed bezig, #1 Emma Green!',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                         ],
                       ),
                     ),
                   ),
                   Widgets.spacer(),
                   const Text('Moodindicator',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                   Widgets.spacer(height: 3),
                   Container(height: 2,width: 50,color: Colors.blue,),
                   Widgets.spacer(),
                   Container(
                     width: double.infinity,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                       color: Colors.white,
                       boxShadow: [
                         BoxShadow(
                             color: Colors.black.withOpacity(0.1),blurRadius:4
                         )
                       ],
                     ),
                     child:  Padding(
                       padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const Text('Hoeveel plzier heb je momenteel in je werk?',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                           const SizedBox(height: 10,),
                           Row(
                             mainAxisSize: MainAxisSize.min,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Icon(Icons.keyboard_arrow_left,color: Colors.grey,size: 20,),
                               SizedBox(width: 3,),
                               Expanded(
                                 child: Container(
                                   height: 50,
                                   child:
                                   ListView.builder(
                                     // controller: _scrollController,
                                     shrinkWrap: true,
                                     scrollDirection: Axis.horizontal,
                                     itemBuilder: (context, index) {
                                       //bool isCentered = index == _centeredItemIndex;
                                       isChangeClr = index == _clickedItemIndex;
                                       return GestureDetector(
                                         onTap: () {
                                           setState(() {
                                             //  isChangeClr = index == _clickedItemIndex;
                                             _clickedItemIndex = index;
                                             // isChangeClr = true;
                                           });
                                         },
                                         child: Container(
                                           color: Colors.transparent,
                                           margin: EdgeInsets.only(right: 15),
                                           child: Column(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             // crossAxisAlignment: CrossAxisAlignment.center,
                                             children: [
                                               Icon(iconTypes[index],color: isChangeClr == true ? Colors.red : Colors.black),
                                               Text(numbers[index],style: TextStyle(color: isChangeClr == true ? Colors.red : Colors.black))
                                             ],),
                                         ),
                                       );
                                     },
                                     itemCount: iconTypes.length,),
                                 ),
                               ),
                               SizedBox(width: 3,),
                               Icon(Icons.keyboard_arrow_right,color: Colors.grey,size: 20,),
                             ],
                           )
                         ],),
                     ),
                   ),
                   Widgets.spacer(height: 25),

                 ],),
             ),
           );
          }
          return Container();
        },
      ),
    );
}}
