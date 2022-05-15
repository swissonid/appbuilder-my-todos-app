import 'package:flutter/material.dart';

import 'my_divider.dart';

class MyTodoItemListTile extends StatefulWidget {
  const MyTodoItemListTile({
    Key? key,
    required this.title,
    this.subTitle,
    required this.onChanged,
    this.isDone = false,
    this.hideTopLine = false,
    this.hideBottomLine = false,
  }) : super(key: key);
  final Widget title;
  final Widget? subTitle;
  final bool isDone;
  final bool hideTopLine;
  final bool hideBottomLine;
  final ValueChanged<bool> onChanged;

  @override
  State<MyTodoItemListTile> createState() => _MyTodoItemListTileState();
}

class _MyTodoItemListTileState extends State<MyTodoItemListTile> {
  late bool _selected;

  void _handleTouch() {
    setState(() {
      _selected = !_selected;
    });
    widget.onChanged(_selected);
  }

  @override
  void initState() {
    super.initState();
    _selected = widget.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 56),
      child: InkWell(
        onTap: _handleTouch,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.hideTopLine
                ? const MyDivider.transparent()
                : const MyDivider(),
            Row(
              children: [
                _CheckBox(
                  value: _selected,
                  onChanged: (_) => _handleTouch(),
                ),
                Expanded(
                  child: _TextColumn(
                    lineThrougt: _selected,
                    title: widget.title,
                    subTitle: widget.subTitle,
                  ),
                ),
                // const Icon(Icons.menu),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
            widget.hideBottomLine
                ? const MyDivider.transparent()
                : const MyDivider(),
          ],
        ),
      ),
    );
  }
}

class _TextColumn extends StatelessWidget {
  const _TextColumn({
    Key? key,
    required this.title,
    this.subTitle,
    this.lineThrougt = false,
  }) : super(key: key);

  final Widget title;
  final Widget? subTitle;
  final bool lineThrougt;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = lineThrougt
        ? textTheme.bodyText1!.copyWith(decoration: TextDecoration.lineThrough)
        : textTheme.bodyText1!;

    final subTitleStyle = lineThrougt
        ? textTheme.bodySmall!.copyWith(decoration: TextDecoration.lineThrough)
        : textTheme.bodySmall!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTextStyle(
          style: titleStyle,
          child: title,
        ),
        if (subTitle != null)
          DefaultTextStyle(
            style: subTitleStyle,
            child: subTitle!,
          )
      ],
    );
  }
}

class _CheckBox extends StatelessWidget {
  const _CheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);
  final bool value;
  final ValueChanged<bool?> onChanged;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        shape: const CircleBorder(),
        side: BorderSide(width: 0.75, color: Theme.of(context).dividerColor),
      ),
    );
  }
}
