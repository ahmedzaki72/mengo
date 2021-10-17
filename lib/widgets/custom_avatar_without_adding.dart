import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/profile_screen/cubit/profile_cubit.dart';
import 'package:mengo/screens/profile_screen/cubit/profile_states.dart';

Widget customAvatarWithAdding({
  BuildContext context,
  String image,
  double radius1,
  double radius2,
}) {
  return BlocConsumer<ProfileCubit, ProfileStates>(
    listener: (context, states) {},
    builder: (context, states) {
      var cubit = ProfileCubit.get(context);
      if(states is! ProfileLoadingStates) {
        return   CircleAvatar(
          radius: radius1,
          backgroundColor: dark_red,
          child: CircleAvatar(
            radius: radius2,
            backgroundColor: bg_color,
            backgroundImage: cubit.profile.profileResponse.profileResult.profile_image == null
                ? NetworkImage(
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png')
                : NetworkImage(cubit.profile.profileResponse.profileResult.profile_image),
          ),
        );
      }
       return spinKit;
    },
  );
}
