import 'package:flutter/material.dart';
import 'package:alon/common/values/values.dart';
import 'package:alon/common/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class SignInPage extends GetView<SignInController> {
  // logo
  Widget _buildLogo() {
    return Container(
      width: 110.w,
      margin: EdgeInsets.only(top: (40 + 44.0).h), // 顶部系统栏 44px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 76.w,
            width: 76.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 76.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: const [
                        Shadows.primaryShadow,
                      ],
                      borderRadius: BorderRadius.all(
                          Radius.circular((76 * 0.5).w)), // 父容器的50%
                    ),
                    child: Container(),
                  ),
                ),
                Positioned(
                  top: 13.w,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
                height: 1,
              ),
            ),
          ),
          Text(
            "news",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      // width: 295.w,
      // height: 204,
      // margin: EdgeInsets.only(top: 49.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            // email input
            inputTextEdit(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              labelText: "signIN_email.insert_account".tr,
              // autofocus: true,
            ),
            // password input
            inputTextEdit(
              controller: controller.passController,
              keyboardType: TextInputType.visiblePassword,
              labelText: "signIN_email.insert_pw".tr,
              isPassword: true,
            ),

            Padding(
                padding: EdgeInsets.only(top: 14.h, bottom: 35.h),
                child: btnWidget(
                  onPressed: () {},
                  isbgColor: false,
                  title: 'signIN_email.desc'.tr,
                  fontSize: 12.sp,
                )),

            // 注册、登录 横向布局
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 15.0), //阴影xy轴偏移量
                        blurRadius: 15.0, //阴影模糊程度
                        spreadRadius: 1.0 //阴影扩散程度
                        )
                  ]),
              child: // 登录
                  btnWidget(
                onPressed: () {},
                gbColor: AppColors.primaryElement,
                title: "Sign in",
                isFlex: true,
              ),
            ),
            // Spacer(),

            // Fogot password
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextButton(
                onPressed: controller.handleFogotPassword,
                child: Text(
                  "Fogot password?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.secondaryElementText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    height: 1, // 设置下行高，否则字体下沉
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: 295.w,
      margin: EdgeInsets.only(bottom: 40.h),
      child: Column(
        children: <Widget>[
          // title
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
          // 按钮
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Row(
              children: <Widget>[
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "twitter",
                ),
                const Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "google",
                ),
                const Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "facebook",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 注册按钮
  Widget _buildSignupButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: btnWidget(
        onPressed: controller.handleNavSignUp,
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "Sign up",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  Widget _buildTop() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h, bottom: 6.h),
            padding: EdgeInsets.only(top: 10.h),
            child: Row(
              children: [
                const Spacer(),
                btnWidget(
                    title: "signIN_email.skip".tr,
                    onPressed: () {},
                    isbgColor: false,
                    fontSize: 14.sp,
                    fontColor: const Color(0xff8E8E93))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "signIN_email.title".tr,
              style: TextStyle(color: const Color(0xff323232), fontSize: 24.sp),
            ),
          )
        ],
      ),
      // child: Text('what are you doing?'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            // _buildLogo(),
            _buildTop(),
            _buildInputForm(),
            const Spacer(),
            _buildThirdPartyLogin(),
            _buildSignupButton(),
          ],
        ),
      ),
    );
  }
}
