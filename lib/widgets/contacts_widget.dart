import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ContactData {
  final IconData icon;
  final String text;
  final String link;
  
  final Color iconColor, textColor;

  ContactData(this.text, {this.icon, this.link, this.textColor, this.iconColor});
}

class ContactsWidget extends StatelessWidget {

  final List<ContactData> contacts;
  final Color textColor, iconColor;

  final double fontSize;

  ContactsWidget(this.contacts, {this.textColor = Colors.grey, this.iconColor = Colors.grey, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => CarouselSlider(
        items: contacts.map<Widget>((contact) => Container(
          width: constraints.maxWidth,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              if (contact.icon != null) Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(contact.icon,
                  color: contact.iconColor ?? contact.textColor ?? this.iconColor,),
              ),
              Text(contact.text, style: TextStyle(
                color: contact.textColor ?? this.textColor
              ),)
            ],
          ),
        )).toList(), 
        options: CarouselOptions(
          height: constraints.maxHeight,
          viewportFraction: 1,
          autoPlay: true,
          scrollDirection: Axis.vertical
        )
      ),
    );
  }
}