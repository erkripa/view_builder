library view_builder;

import 'package:flutter/material.dart';
import 'package:view_builder/vb_constant.dart';
import 'loading.dart';

class ViewBuilder extends StatelessWidget {
  const ViewBuilder({
    Key? key,
    this.length = 0,
    this.emptyDataText,
    required this.itemBuilder,
    required this.onRefresh,
    this.scrollController,
    this.loadingStatus = LoadingStatus.completed,
    this.isMoreLoading = LoadingStatus.completed,
    this.loadingWidget,
    this.errorText,
    this.errorWidget,
    this.emptyWidget,
    this.padding,
  }) : super(key: key);

  final int length;
  final Future<void> Function() onRefresh;
  final Widget Function(BuildContext, int) itemBuilder;
  final String? emptyDataText;
  final String? errorText;
  final ScrollController? scrollController;
  final LoadingStatus loadingStatus;
  final LoadingStatus isMoreLoading;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: padding ?? EdgeInsets.zero,
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: loadingStatus == LoadingStatus.loading
                      ? 1
                      : length == 0
                          ? length + 1
                          : length,
                  shrinkWrap: length == 0 ? true : false,
                  itemBuilder: (context, index) {
                    if (loadingStatus == LoadingStatus.error) {
                      return Container(
                        constraints:
                            BoxConstraints(minHeight: constraints.maxHeight),
                        child: Center(
                          child: errorWidget ??
                              Text(
                                errorText ?? "Server Error",
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.center,
                              ),
                        ),
                      );
                    } else if (loadingStatus == LoadingStatus.loading) {
                      return Container(
                        constraints:
                            BoxConstraints(minHeight: constraints.maxHeight),
                        child: loadingWidget ?? const LoadingWidget(),
                      );
                    } else if (length == 0) {
                      return Container(
                        constraints:
                            BoxConstraints(minHeight: constraints.maxHeight),
                        child: Center(
                          child: emptyWidget ??
                              Text(
                                emptyDataText ?? 'No Data!',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                        ),
                      );
                    } else {
                      return itemBuilder(context, index);
                    }
                  },
                ),
              ),
              if (isMoreLoading == LoadingStatus.loading)
                Container(
                  margin: const EdgeInsets.only(bottom: 4, top: 4),
                  child: const LoadingWidget(
                    isStyle1: false,
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
