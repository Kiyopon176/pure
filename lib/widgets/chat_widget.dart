import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget(
        {
          super.key,
          required this.profilePicture,
          required this.message,
          required this.messageTime,
          required this.onTap,
        }
      );

  final Image profilePicture;
  final String message, messageTime;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: profilePicture),
            SizedBox(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    messageTime,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 12,
                  ),
                ),
                Text(
                    message,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
