import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nekomimi/config/theme/fonts.dart';
import 'package:nekomimi/featureas/home/bloc/bloc.dart';
import 'package:nekomimi/featureas/home/widget/appbar/cat_app_bar.dart';
import 'package:nekomimi/featureas/home/widget/drawer/cat_drawer.dart';
class LoveMePage extends StatelessWidget {
  const LoveMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CatAppBar(),
      drawer: const CatDrawer(),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 4,
            child: Container(
              width: 1.sw,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14.r),
                  topRight: Radius.circular(14.r),
                ),
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color:
                              Theme.of(context).colorScheme.surfaceContainerHigh,
                        ),
                        child: Text(
                          'بتحبني يا قطقوطة؟',
                          style: AppTextStyles.headline1,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildButton(
                            context: context,
                            onPressed: () =>
                                context.read<LoveMeBloc>().add(YesEvent()),
                            icon: Icons.favorite,
                            label: 'نعم',
                          ),
                          SizedBox(width: 16.w),
                          _buildButton(
                            context: context,
                            onPressed: () =>
                                context.read<LoveMeBloc>().add(NoEvent()),
                            icon: Icons.close,
                            label: 'لا',
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      BlocBuilder<LoveMeBloc, LoveMeState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const CircularProgressIndicator();
                          }
                          if (state.answer.isNotEmpty) {
                            return _buildAnswer(context, state);
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 24.sp),
      label: Text(label, style: AppTextStyles.button),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }

  Widget _buildAnswer(BuildContext context, LoveMeState state) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Column(
        key: ValueKey<String>(state.answer),
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
            ),
            child: ListTile(
              leading:
                  Icon(state.answer == 'نعم' ? Icons.icecream : Icons.mood_bad),
              title: Text(state.answer, style: AppTextStyles.bodyText1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
              contentPadding: EdgeInsets.all(12.r),
            ),
          ),
          if (state.answer == 'لا') ...[
            SizedBox(height: 16.h),
            ...state.networkDetails
                .map((detail) => _buildNetworkDetailTile(context, detail)),
          ],
        ],
      ),
    );
  }

  Widget _buildNetworkDetailTile(BuildContext context, NetworkDetail detail) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
        ),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            child: Icon(_getIconForNetworkDetail(detail.type)),
          ),
          title: Text(detail.type, style: TextStyle(fontSize: 16.sp)),
          subtitle: Text(detail.value, style: TextStyle(fontSize: 14.sp)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
          contentPadding: EdgeInsets.all(12.r),
        ),
      ),
    );
  }

  IconData _getIconForNetworkDetail(String detailType) {
    switch (detailType) {
      case 'اسم الشبكة':
        return Icons.wifi;
      case 'IP المحلي':
        return Icons.router;
      case 'بوابة الاتصال':
        return Icons.security;
      case 'IP العام':
        return Icons.public;
      default:
        return Icons.error;
    }
  }
}