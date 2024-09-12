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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.h),
              Text(
                'بتحبني يا قطقوطة؟',
                style: AppTextStyles.headline1,
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<LoveMeBloc>().add(YesEvent());
                    },
                    icon: const Icon(Icons.favorite),
                    label: Text('نعم', style: AppTextStyles.button),
                  ),
                  SizedBox(width: 16.w),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<LoveMeBloc>().add(NoEvent());
                    },
                    icon: const Icon(Icons.close),
                    label: Text('لا', style: AppTextStyles.button),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              BlocBuilder<LoveMeBloc, LoveMeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state.answer == 'لا') {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Column(
                        key: ValueKey<String>(state.answer),
                        children: [
                          if (state.answer.isNotEmpty)
                            ListTile(
                              title: Text(state.answer, style: AppTextStyles.bodyText1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              contentPadding: const EdgeInsets.all(10),
                            ),
                          ...state.networkDetails.map(_buildNetworkDetailTile),
                        ],
                      ),
                    );
                  }

                  if (state.answer == 'نعم') {
                    return ListTile(
                      title: Text(state.answer, style: AppTextStyles.bodyText1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNetworkDetailTile(NetworkDetail detail) {
    return ListTile(
      leading: Icon(_getIconForNetworkDetail(detail.type)),
      title: Text(detail.type, style: TextStyle(fontSize: 16.sp)),
      subtitle: Text(detail.value, style: TextStyle(fontSize: 14.sp)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      contentPadding: const EdgeInsets.all(10),
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