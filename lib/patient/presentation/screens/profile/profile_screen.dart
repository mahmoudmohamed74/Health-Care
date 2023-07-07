
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:health_care/authentication/presentation/screens/user/user_login_screen.dart';
import 'package:health_care/core/app/app.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/patient/presentation/screens/profile/widget/divider.dart';
import 'package:health_care/patient/presentation/screens/profile/widget/profile_item_widget.dart';

class ProfilePatientScreen extends StatelessWidget {
    ProfilePatientScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s12,),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: AppSize.s40,
                backgroundImage: NetworkImage(
                  "https://idsb.tmgrup.com.tr/ly/uploads/images/2022/12/19/247181.jpg",
                ),
              ),
             const SizedBox(width: AppSize.s20,),
             Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "userdata!.name",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorManager.black,
                      fontSize: AppSize.s16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s5,
                  ),
                  Text(
                    "userdata!.email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorManager.black,
                      fontSize: AppSize.s14,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s5,
                  ),
                  Text(
                    "alex",
                    maxLines: 2,
                    style: TextStyle(
                      color: ColorManager.black,
                      fontSize: AppSize.s14,
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconBroken.Edit,
                ),
              ),
            ],
          ),
          const MyDivider(),
          ProfileItemWidget(
            icon: IconBroken.Notification,
            text: 'Notification',
            onTap: (){},
          ),
          const MyDivider(),
          ProfileItemWidget(
            icon: IconBroken.Lock,
            text: 'Security',
            onTap: (){},
          ),
          const MyDivider(),
          ProfileItemWidget(
            icon: Icons.remove_red_eye_outlined,
            text: 'Appearance',
            onTap: (){},
          ),
          const MyDivider(),
          ProfileItemWidget(
            icon: Icons.help_outline_outlined,
            text: 'Help',
            onTap: (){},
          ),
          const MyDivider(),
          ProfileItemWidget(
            icon: Icons.people_outline,
            text: 'Invite Friends',
            onTap: (){},
          ),
          const MyDivider(),
          ProfileItemWidget(
            icon: IconBroken.Logout,
            text: 'Logout',
            onTap: (){
              BottomDialog().showBottomDialog(context);
            },
          ),
        ],
      ),
    );
  }
}

class BottomDialog {
  final AppPreferences _appPreferences = sl<AppPreferences>();


  void showBottomDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: _buildDialogContent( context),
        );
      },
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.maxFinite,
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(AppSize.s16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s25),
            topRight: Radius.circular(AppSize.s25),
          ),
        ),
        child: Material(
          child: Column(
            children: [
              _buildIcon(),
              _buildLogoutText(),
              const SizedBox(height: 16),
              _buildButtons(context),
              const SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    const icon = IconBroken.Logout;
    return const SizedBox(
      height: 88,
      child: Icon(icon,size: 50,),
    );
  }

  Widget _buildLogoutText() {
    return const Text(
      'Are you sure want to logout?',
      style: TextStyle(
        fontSize: AppSize.s16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: AppSize.s130,
          height: AppSize.s40,
          child: OutlinedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                BorderSide(
                  color: ColorManager.primary,
                ),
              ),
              backgroundColor: MaterialStateProperty.all(ColorManager.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s16),
                ),
              ),
            ), child: Text('Cancel',style: TextStyle(
            color: ColorManager.primary,
            fontSize: AppSize.s16,
          ),),
          ),
        ),
        const SizedBox(width: AppSize.s30,),
        SizedBox(
          width: AppSize.s130,
          height: AppSize.s40,
          child: OutlinedButton(
            onPressed: (){
               _appPreferences.logout();
               Constants.isLogout = true;
              Phoenix.rebirth(context);
              print("logeddddddddddddddddddddddd out");

            },
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                BorderSide(
                  color: ColorManager.primary,
                ),
              ),
              backgroundColor: MaterialStateProperty.all(ColorManager.primary),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s16),
                ),
              ),
            ), child: Text('Yes, Logout',style: TextStyle(
            color: ColorManager.white,
            fontSize: AppSize.s16,
          ),),
          ),
        ),
      ],
    );
  }

}
