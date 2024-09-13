import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/widgets/default_error_widget.dart';
import 'package:todo_app/features/Auth/presentation/controller/profile_cubit/profile_cubit.dart';

import 'package:todo_app/features/Auth/presentation/widgets/profile_view_widgets/profile_info_tile.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileFailure) {
          return Center(
            child: DefaultErrorWidget(
              errMessage: state.errMessage,
              onTryAgainPressed: () => cubit.getUserInfo(),
            ),
          );
        } else if (state is ProfileSuccess) {
          return Animate(
            effects: const [FadeEffect()],
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              children: [
                // user name
                ProfileInfoTile(
                  title: 'Name',
                  content: state.user.name,
                ),

                // phone
                ProfileInfoTile(
                  title: 'Phone',
                  content: state.user.phone,
                  suffix: IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: state.user.phone));
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/copy_icon.svg',
                      width: 24.r,
                    ),
                  ),
                ),

                // level
                ProfileInfoTile(
                  title: 'Level',
                  content: state.user.level,
                ),

                // years of experience
                ProfileInfoTile(
                  title: 'Years of experience',
                  content: state.user.experienceYears.toString(),
                ),

                // address
                ProfileInfoTile(
                  title: 'Location',
                  content: state.user.address,
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
