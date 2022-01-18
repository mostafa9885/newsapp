
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modules/Webview/web_veiw_screen.dart';

Widget buildArticleItem(article, context) => InkWell(
      onTap: ()
      {
        NavigatorTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.withOpacity(0.95),
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

Widget separatorBuilder() => Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
    );

Widget articleBuilder(list, context) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItem(list[index], context),
          separatorBuilder: (context, index) => separatorBuilder(),
          itemCount: list.length,
        ),
    fallback: (context) => const Center(child: CircularProgressIndicator()));

Widget TextFromFieldDefualt({
  required TextEditingController controller,
  required String label,
  required IconData prefixIcon,
  required TextInputType keyboardType,
  String? Function(String?)? validator,
  Function()? onTap,
  String? Function(String?)? onChange,
  TextStyle? labelStyle,
  TextStyle? styleOutDecoration,
  String? hintText,
  double hintStyleFS = 15,
  double borderSideWidth = 3,
  double borderRadiusCircular = 13,
  Color? prefixIconColor,
}) =>
    TextFormField(
      validator: validator,
      controller: controller,
      onTap: onTap,
      onChanged: onChange,
      keyboardType: keyboardType,
      style: styleOutDecoration,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: hintStyleFS,
          color: Colors.grey,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: prefixIconColor,
        ),
        label: Text(label),
        labelStyle: labelStyle,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: borderSideWidth, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusCircular)),
        ),
      ),
    );

void NavigatorTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => widget),
);
