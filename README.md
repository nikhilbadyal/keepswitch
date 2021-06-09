# Settings UI for Flutter

## Installing:

In your pubspec.yaml

```yaml
dependencies:
  keepswitch: <latest-version>
```

Then in dart file , do

```
import 'package:keepswitch/keepswitch.dart';
```

## Basic Usage:

```

@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    shape: BeveledRectangleBorder(),
    toolbarHeight: 60,
    title: Center(child: const Text('Settings UI')),
  ),
  body: Padding(
    padding: const EdgeInsets.only(top: 10),
    child: SafeArea(
      child: settingsList(),
    ),
  ),
);
}
  
Widget settingsList() {
    return return ListTile(
        leading: leading,
        trailing: CustomSwitch(
          value: switchValue!,
          onChanged: enabled ? onToggle : null,
          activeColor: Theme.of(context).accentColor,
          inactiveColor: Colors.grey,
          inactiveText: 'Off',
          activeText: 'On',
          activeTextColor : Colors.white70,
          inactiveTextColor : Colors.white70,
          isSwitchDisabled : false,
          switchHeight:55,
          switchWidth:27,
          switchButtonColor:Colors.white,

        ),
        title: Text(
          title,
          style: titleTextStyle,
          maxLines: titleMaxLines,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style: subtitleTextStyle ?? titleTextStyle,
                maxLines: subtitleMaxLines,
                overflow: TextOverflow.ellipsis,
              )
            : null,
      );
  }
```

## Example App

https://github.com/ProblematicDude/settings_ui
