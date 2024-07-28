import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String? img;
  final String? email;
  final String? firstName;


  const CardWidget({super.key, this.img, this.email, this.firstName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration
        (borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),blurRadius:4
          )
        ],
      ),

      child:
      Column(
        children: [
          Container(

            decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                color: Colors.blue
            ),

            // color: Colors.blue,
            child: ListTile(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))),
              dense:true,
              contentPadding: const EdgeInsets.only(left:15, right: 15),
              horizontalTitleGap: 8,
              leading: Container(
                height: 30,
                width: 30,
                decoration:
                BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1,color: Colors.white.withOpacity(0.7)),
                    image:  DecorationImage(
                        image: NetworkImage(img?? 'https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        fit: BoxFit.cover)),),
              tileColor: Colors.blue,
              trailing: const Icon(CupertinoIcons.add_circled,color: Colors.white,size: 28,),
              title:
              Text(email ?? 'inkoop duut te lang',softWrap: true ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,),maxLines: 1,overflow: TextOverflow.ellipsis,),
              subtitle: Text(firstName ??'jimm bkkum',style: TextStyle(color: Colors.white,fontSize: 10),),
              //Image.network(''),

            ),
          ),
          const SizedBox(height: 15,),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Starddatum',style: TextStyle(color: Colors.grey,fontSize: 10),),
                    Text('01-02-2021',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w700),),
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Einddatum',style: TextStyle(color: Colors.grey,fontSize: 10),),
                    Text('11-02-2021',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w700),),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text('status',style: TextStyle(color: Colors.grey,fontSize: 10),),
                SizedBox(width: 47,),
                Text('Lopend',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w700),),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text('OK status',style: TextStyle(color: Colors.grey,fontSize: 10),),
                SizedBox(width: 30,),
                Text('IN orde',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w700),),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Analyseer lange doorlooptijd',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w300),),
                Icon(Icons.keyboard_arrow_right,size: 20,),
              ],
            ),
          ),
        ],
      ) ,
    );
  }
}
