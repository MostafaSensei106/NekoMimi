import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nekomimi/featureas/home/bloc/bloc.dart';

class LoveMePage extends StatelessWidget {
  const LoveMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Love Me Page', style: TextStyle(fontSize: ScreenUtil().setSp(18))),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.h),
              Text(
                'بتحبني يا قطقوطة؟',
                style: TextStyle(fontSize: ScreenUtil().setSp(24), fontWeight: FontWeight.bold),
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
                    label: Text('نعم', style: TextStyle(fontSize: ScreenUtil().setSp(16))),
                  ),
                  SizedBox(width: 16.w),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<LoveMeBloc>().add(NoEvent());
                    },
                    icon: const Icon(Icons.close),
                    label: Text('لا', style: TextStyle(fontSize: ScreenUtil().setSp(16))),
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
                              title: Text(state.answer, style: TextStyle(fontSize: ScreenUtil().setSp(16))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              contentPadding: const EdgeInsets.all(10),
                            ),
                          ...state.networkDetails.map((detail) => ListTile(
                            leading: Icon(
                              _getIconForNetworkDetail(detail['نوع'] ?? ''),
                            ),
                            title: Text(detail['نوع'] ?? '', style: TextStyle(fontSize: ScreenUtil().setSp(16))),
                            subtitle: Text(detail['قيمة'] ?? '', style: TextStyle(fontSize: ScreenUtil().setSp(14))),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            contentPadding: const EdgeInsets.all(10),
                          )),
                        ],
                      ),
                    );
                  }

                  if (state.answer == 'نعم') {
                    return ListTile(
                      title: Text(state.answer, style: TextStyle(fontSize: ScreenUtil().setSp(16))),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    );
                  }

                  return Container();
                },
              ),
            ],
          ),
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
