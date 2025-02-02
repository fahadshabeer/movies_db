import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_db/views/shared_components/custom_error_widget.dart';
import 'package:movies_db/views/shared_components/loading_components/loading_grid.dart';
import 'package:movies_db/views/shared_components/loading_components/loading_movie_tile.dart';

class CustomPaginatedGridview<T> extends StatefulWidget {
  final Widget Function(BuildContext, T, int) itemBuilder;
  final PagingController<dynamic, T> pagingController;
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
      _CustomPaginatedGridviewState<T>();
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
        shrinkWrap: true,
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
                    height: 0.4.sh,
                    child: Center(
                      child: CustomErrorWidget(
                        msg: widget.pagingController.error,
                        onReload: () {
                          widget.pagingController.refresh();
                        },
                      ),
                    ),
                  ),
              newPageErrorIndicatorBuilder: (context) => GestureDetector(
                onTap: ()=>widget.pagingController.retryLastFailedRequest(),
                child: Container(
                  padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(10.sp)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.pagingController.error,
                            maxLines: 4,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp
                            ),
                          ),
                          10.verticalSpace,
                          Icon(
                            Icons.refresh,
                            size: 40.sp,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          10.verticalSpace,
                          Text(
                            "Tap to reload",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp,
                              color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
              noItemsFoundIndicatorBuilder: (context) => Column(
                    children: [
                      Text(
                        'No Movies Found',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w600),
                      ),
                      10.verticalSpace,
                      Text(
                        'The list is currently empty',
                        style: TextStyle(),
                      ),
                    ],
                  ),
              firstPageProgressIndicatorBuilder: (context) =>
                  widget.firstPageLoading ?? const LoadingGrid(),
              newPageProgressIndicatorBuilder: (context) => const LoadingMovieTile(),
              itemBuilder: widget.itemBuilder)),
    );
  }
}
