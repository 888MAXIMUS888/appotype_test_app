import 'package:appotype_test_app/presentation/extensions/ui_extensions.dart';
import 'package:appotype_test_app/presentation/views/widgets/full_name.dart';
import 'package:appotype_test_app/presentation/views/widgets/main_scaffold.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/user_entity.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    UserEntity arguments = context.getArguments<UserEntity>();

    return MainScaffold(
        inNeedLeading: false,
        title: 'User Details',
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                width: 150,
                height: 150,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(arguments.avatar),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FullName(
                firstName: arguments.firstName, lastName: arguments.lastName),
            Text(arguments.email)
          ],
        ));
  }
}
