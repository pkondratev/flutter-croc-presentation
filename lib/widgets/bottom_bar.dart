import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BottomBarWidget extends StatefulWidget {
  final BottomBarCarouselController bottomCarouselController;

  final Color foregroundColor, backgroundColor;
  final Widget leftWidget, rightWidget;
  final double blocksWidth;

  BottomBarWidget(this.bottomCarouselController,
      {this.backgroundColor,
      this.foregroundColor,
      this.leftWidget,
      this.rightWidget,
      this.blocksWidth = 200});

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int currentPage;
  int totalPages;

  @override
  void initState() {
    this.currentPage = widget.bottomCarouselController?.currentPage ?? 0;
    this.totalPages = widget.bottomCarouselController?.totalPages ?? 1;
    widget.bottomCarouselController?.addListener(onPageChange);
    super.initState();
  }

  @override
  void dispose() {
    widget.bottomCarouselController?.removeListener(onPageChange);
    super.dispose();
  }

  void onPageChange(BottomBarCarouselController controller) {
    setState(() {
      this.currentPage = controller.currentPage;
      this.totalPages = controller.totalPages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor ?? Theme.of(context).primaryColor,
      child: Row(
        children: [
          Container(
            width: this.widget.blocksWidth,
            alignment: Alignment.centerLeft,
            child: this.widget.leftWidget,
          ),
          Expanded(
              child: LayoutBuilder(
                builder: (context, size) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(MaterialIcons.keyboard_arrow_left),
                        color: widget.foregroundColor ?? Theme.of(context).backgroundColor,
                        hoverColor: Colors.transparent, splashColor: Colors.transparent, highlightColor: Colors.transparent,
                        onPressed: currentPage + 1 == 1 ? null : (){
                          widget.bottomCarouselController.previous();
                        }),
                    Text('${currentPage + 1}/$totalPages', style: TextStyle(
                      color: widget.foregroundColor ?? Theme.of(context).backgroundColor,
                      fontSize: size.maxHeight / 2
                    ),),
                    IconButton(
                        icon: Icon(MaterialIcons.keyboard_arrow_right),
                        color: widget.foregroundColor ?? Theme.of(context).backgroundColor,
                        hoverColor: Colors.transparent, splashColor: Colors.transparent, highlightColor: Colors.transparent,
                        onPressed: currentPage + 1 == totalPages ? null : (){
                          widget.bottomCarouselController.next();
                        })
                  ],
                ),
          )),
          Container(
            width: this.widget.blocksWidth,
            alignment: Alignment.centerRight,
            child: this.widget.rightWidget,
          )
        ],
      ),
    );
  }
}

typedef CarouselChangedEvent = void Function(BottomBarCarouselController controller);

class BottomBarCarouselController {
  /// Carousel controller
  final CarouselController carouselController = CarouselController();

  /// Total slides
  final int totalPages;
  //
  int _currentPage = 0;

  BottomBarCarouselController(this.totalPages);

  /// current open page index
  int get currentPage => _currentPage;

  set currentPage(int value) {
    if (value >= totalPages || value < 0) {
      throw RangeError.range(value, 0, totalPages);
    }
    _currentPage = value;
    carouselController.animateToPage(value);
    _invokeListeners();
  }

  void next({Duration duration, Curve curve = Curves.linear}) {
    if (duration == null) duration = Duration(milliseconds: 400);
    if (_currentPage >= totalPages - 1) return;
    _currentPage++;
    carouselController.nextPage(duration: duration, curve: curve);
    _invokeListeners();
  }

  void previous({Duration duration, Curve curve = Curves.linear}) {
    if (duration == null) duration = Duration(milliseconds: 400);
    if (_currentPage <= 0) return;
    _currentPage--;
    carouselController.previousPage(duration: duration, curve: curve);
    _invokeListeners();
  }


  dynamic onPageChangedListener(int page, CarouselPageChangedReason reason) {
    _currentPage = page;
    _invokeListeners();
  }

  void addListener(CarouselChangedEvent listener) {
    _listeners.add(listener);
  }

  void removeListener(CarouselChangedEvent listener) {
    _listeners.remove(listener);
  }

  void _invokeListeners() {
    for (var listener in _listeners) {
      listener(this);
    }
  }

  final _listeners = <CarouselChangedEvent>[];
}
