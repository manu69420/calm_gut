import 'package:calm_gut/chat/deletion/cubit/deletion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeletionCubit, DeletionState>(
      builder: (context, state) {
        switch (state.status) {
          case DeletionStatus.initial:
            return AlertDialog(
              title: const Text("Confirm Deletion"),
              content: const Text("Do you want to delete chat's history?"),
              actions: [
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text(
                    "Forget",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<DeletionCubit>().deleteHistory();
                  },
                  child: const Text("Confirm"),
                ),
              ],
            );
          case DeletionStatus.waiting:
            return AlertDialog(content: const LinearProgressIndicator());
          case DeletionStatus.success:
            return AlertDialog(
              content: Text("Success!"),
              actions: [
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: const Text("Close"),
                ),
              ],
            );
        }
      },
    );
  }
}
