import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final void Function() onPressed;
  final Color backgroundColor;
  final BoxDecoration decoration;
  final Widget loadingWidget;

  const LoadingButton({
    Key key,
    this.child,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.decoration,
    this.loadingWidget,
  }) : super(key: key);

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  BoxDecoration decoration;
  Widget loadingWidget;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    buildDecoration();
    buildLoadingWidget();
  }

  void buildDecoration() {
    decoration = widget.decoration ??
        BoxDecoration(
          color: widget.backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
        );
  }

  void buildLoadingWidget() {
    loadingWidget = loadingWidget ??
        SizedBox(
          width: 25,
          height: 25,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    buildDecoration();
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: widget.isLoading ? null : widget.onPressed,
            child: AnimatedContainer(
              padding: widget.isLoading
                  ? EdgeInsets.all(10)
                  : EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: widget.isLoading
                  ? decoration.copyWith(
                      borderRadius: BorderRadius.circular(100))
                  : decoration,
              child: widget.isLoading ? loadingWidget : widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
