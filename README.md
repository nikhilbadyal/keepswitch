# Settings UI for Flutter

  <img src="https://i.imgur.com/1qQ5DAm.jpg" height="150px" alt="">
<br>
<br>
<br>
  <img src="https://i.imgur.com/UUXFoV5.jpg" height="150px" alt="">
<br>
<br>
<br>

  <img src="https://i.imgur.com/1uBpDpf.jpg" height="150px" alt="">
<br>
<br>
<br>
  <img src="https://i.imgur.com/CFR3GJV.jpg" height="150px" alt="">
<br>
<br>
<br>
  <img src="https://i.imgur.com/onXwC6k.jpg" height="150px" alt="">
<br>
<br>
<br>
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
    return ListTile(
        leading: leading,
        trailing: KeepSwitch(
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
