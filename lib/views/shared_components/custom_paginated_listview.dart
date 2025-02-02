import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_db/views/shared_components/custom_error_widget.dart';
import 'package:movies_db/views/shared_components/page_loading_widget.dart';

class CustomPaginatedGridview<ItemType> extends StatefulWidget {
  final Widget Function(BuildContext, ItemType, int) itemBuilder;
  final PagingController<dynamic, ItemType> pagingController;
  final bool applyHorizontalPadding;
  final Widget? firstPageLoading;

  const CustomPaginatedGridview(
      {super.key,
      required this.itemBuilder,
      this.firstPageLoading,
      this.applyHorizontalPadding = true,
      required this.pagingController});

  @override
  State<CustomPaginatedGridview> createState() =>
      _CustomPaginatedGridviewState<ItemType>();
}

class _CustomPaginatedGridviewState<ItemType>
    extends State<CustomPaginatedGridview<ItemType>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        widget.pagingController.refresh();
      },
      child: PagedGridView<dynamic, ItemType>(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.5,
              crossAxisSpacing: 10.sp,
              mainAxisSpacing: 10.sp),
          padding: EdgeInsets.symmetric(
              horizontal: widget.applyHorizontalPadding ? 10.sp : 0.w,
              vertical: 12.h),
          pagingController: widget.pagingController,
          builderDelegate: PagedChildBuilderDelegate<ItemType>(
              firstPageErrorIndicatorBuilder: (context) => SizedBox(
                    height: 0.5.sh,
                    child: Center(
                      child: CustomErrorWidget(
                        msg: widget.pagingController.error,
                        onReload: () {
                          widget.pagingController.refresh();
                        },
                      ),
                    ),
                  ),
              newPageErrorIndicatorBuilder: (context) => CustomErrorWidget(
                    msg: widget.pagingController.error,
                    onReload: () {
                      widget.pagingController.retryLastFailedRequest();
                    },
                  ),
              noItemsFoundIndicatorBuilder: (context) => Column(
                    children: [
                      Text(
                        'No Items Found',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(
                        'The list is currently empty',
                        style: TextStyle(),
                      ),
                    ],
                  ),
              firstPageProgressIndicatorBuilder: (context) =>
                  widget.firstPageLoading ?? const PageLoadingWidget(),
              newPageProgressIndicatorBuilder: (context) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.sp),
                    child: const PageLoadingWidget(),
                  ),
              itemBuilder: widget.itemBuilder
          )
      ),
    );
  }
}
