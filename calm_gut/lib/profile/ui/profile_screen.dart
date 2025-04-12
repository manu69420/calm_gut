import 'package:authentication_repository/authentication_repository.dart';
import 'package:calm_gut/profile/medical_records/ui/medical_records_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed:
                () async =>
                    await context.read<AuthenticationRepository>().logOut(),
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            _ProfileIcon(),
            _Email(),
            Divider(),
            MedicalRecordsScreen(),
          ],
        ),
      ),
    );
  }
}

class _Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthenticationRepository>().currentUser;
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      title: Text(user.email ?? 'Unknown email'),
      leading: Icon(Icons.email, color: colorScheme.onSurface.withAlpha(150)),
    );
  }
}

class _ProfileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment(0, 0),
      child: Icon(Icons.person, size: 80),
    );
  }
}
