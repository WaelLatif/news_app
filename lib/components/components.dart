// ignore_for_file: prefer_const_constructors

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view_screen.dart';

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 16.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  bool isPassword = false,
  bool isClickable = true,
  IconData? suffix,
  required String label,
  required IconData prefix,
  Function? onSubmit,
  Function? onChanged,
  Function? onTap,
  Function? suffixPressed,
  required  Function validate,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged:(s) {
        onChanged!(s);
      },
      onTap: () {
        onTap!();
      },
      validator:(s)
      { validate(s);
        },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed!(), icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget buildArticleItem(article, context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(

        padding: const EdgeInsets.all(16.0),

        child: Row(

          children: [

            Container(

              width: 120.0,

              height: 120.0,

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(

                  12.0,

                ),

                image: DecorationImage(

                  image: NetworkImage('${article['urlToImage']}'),

                  fit: BoxFit.cover,

                ),

              ),

            ),

            SizedBox(

              width: 16.0,

            ),

            Expanded(

              child: Container(

                height: 120.0,

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [

                    Expanded(

                      child: Text(

                        '${article['title']}',

                        style: Theme.of(context).textTheme.bodyText1,

                        maxLines: 3,

                        overflow: TextOverflow.ellipsis,

                      ),

                    ),

                    Text(

                      '${article['publishedAt']}',

                      style: TextStyle(

                        fontSize: 16.0,

                        color: Colors.grey,

                      ),

                    ),

                  ],

                ),

              ),

            ),

          ],

        ),

      ),
);

Widget articleBuilder(list, context,{isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,
      ),
      fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
