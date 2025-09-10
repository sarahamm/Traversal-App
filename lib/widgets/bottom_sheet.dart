import 'package:favorite_places/generated/l10n.dart';
import 'package:favorite_places/main.dart';
import 'package:favorite_places/models/data_base.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _BottomSheetState();
  }
}

class _BottomSheetState extends State<BottomSheetWidget> {
  bool _isChecked = false;
  late String placeTitle = widget.title;

  @override
void initState() {
  super.initState();
  _loadInitialCheckState();
}

void _loadInitialCheckState() async {
  bool exists = await DataBaseService.instance.checkTagIsExsit(
    placeTitle,
    S().planned,
  );
  setState(() {
    _isChecked = exists;
  });
}

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return theme.colorScheme.primary;
      }
      return Colors.white;
    }

    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (buildContext) {
            return Padding(
              padding: EdgeInsets.all(12),
              child: Wrap(
                spacing: 12.0,
                children: [
                  CheckboxListTile(
                    title: Text(S().visited),
                    checkColor: Colors.white,
                    fillColor: WidgetStateProperty.resolveWith(getColor),
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                        //############## should inseart the tag that linked with the place
                        if (_isChecked) {
                          DataBaseService.instance.saveTagWplace(
                            placeTitle,
                            S().visited,
                          );
                        } else {
                          DataBaseService.instance.removeTagWplace(
                            placeTitle,
                            S().visited,
                          );
                        }
                      });
                      //print('🟡This is Tags With Places :');
                      DataBaseService.instance.printPlacesTagsTable();
                    },
                  ),
                  CheckboxListTile(
                    title: Text(S().favouritePlaces),
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                        if (_isChecked) {
                          DataBaseService.instance.saveTagWplace(
                            placeTitle,
                            S().favouritePlaces,
                          );
                        } else {
                          DataBaseService.instance.removeTagWplace(
                            placeTitle,
                            S().favouritePlaces,
                          );
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(S().wantToVisit),
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                        if (_isChecked) {
                          DataBaseService.instance.saveTagWplace(
                            placeTitle,
                            S().wantToVisit,
                          );
                        } else {
                          DataBaseService.instance.removeTagWplace(
                            placeTitle,
                            S().wantToVisit,
                          );
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(S().planned),
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                        if (_isChecked) {
                          DataBaseService.instance.saveTagWplace(
                            placeTitle,
                            S().planned,
                          );
                        } else {
                          DataBaseService.instance.removeTagWplace(
                            placeTitle,
                            S().planned,
                          );
                        }
                      });
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
