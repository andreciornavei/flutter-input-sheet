# flutter-input-sheet

[![Pub](https://img.shields.io/pub/v/input_sheet.svg)](https://pub.dev/packages/input_sheet)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](LICENSE)

A pack of input types implemented as a sheet! 🚀

![](https://github.com/andreciornavei/images/blob/master/flutter-input-sheet/FlutterInputSheet.gif?raw=true)

## Overview

flutter-input-sheet is a package that shows inputs on sheets.

It was created with the purpose of make simple and pleasant extensive forms. You can create custom components to present your data and edit them in sheets for each one.

It was developed by abstracting and implementing great packages in pub.dev to create a single and simple pack for forms.

## Installation

Add the latest package version to your pubspeck.yaml dependencies

```yaml
input_sheet: <latest_version>
```
### Dependencies

Also, this package uses some other libraries that need to be imported in your project to work, this libraries is used in some input types that need constants informed at params.

```yaml
camera: ^0.5.7+4
video_compress: ^2.0.0
flutter_cupertino_date_picker: ^1.0.12
```

### IOS
You will need to add permissions in your Info.plist to use camera and microphone once the package has an input for photos and videos

```xml
<key>NSCameraUsageDescription</key>
<string>Can I use the camera please?</string>
<key>NSMicrophoneUsageDescription</key>
<string>Can I use the mic please?</string>
```

### Android
You will need to add permissions in your AndroidManifest.xml to read and write external storage and manage the camera once the package has an input for photos and videos

```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" android:maxSdkVersion="18" />
```

## ✨ Features

- [x] Text
- [x] Longtext
- [x] Masked
- [x] Number
- [x] Date
- [x] Time
- [x] DateTime
- [x] Photo
- [x] Video
- [ ] Slider
- [ ] Color
- [ ] MultiOption

## ⭐ Basic components

Was created some basic components to show data information on screen before open the input sheet.

- IpsCard

    ![](https://github.com/andreciornavei/images/blob/master/flutter-input-sheet/IpsCard.png?raw=true)

- IpsLabel

    ![](https://github.com/andreciornavei/images/blob/master/flutter-input-sheet/IpsLabel.png?raw=true)

- IpsError

    ![](https://github.com/andreciornavei/images/blob/master/flutter-input-sheet/IpsError.png?raw=true)

- IpsIcon

    ![](https://github.com/andreciornavei/images/blob/master/flutter-input-sheet/IpsIcon.png?raw=true)

- IpsValue

    ![](https://github.com/andreciornavei/images/blob/master/flutter-input-sheet/IpsValue.png?raw=true)

- IpsPhoto

    ![](https://github.com/andreciornavei/images/blob/master/flutter-input-sheet/IpsPhoto.png?raw=true)

- IpsVideo

    ![](https://github.com/andreciornavei/images/blob/master/flutter-input-sheet/IpsVideo.png?raw=true)


## Examples

### Basic card component:

This library implements a basic and optional card component to simplify its forms when presenting data.

```dart
//Your component to show data
IpsCard(
    label: IpsLabel("Name"),
    value: IpsValue(_name ?? "Touch to edit..."),
    icon: IpsIcon(FeatherIcons.user),
    error: IpsError(_errors['name']),
    onClick: () {
        //Your sheet implementation
    },
);
```

---

### Basic media component:

Also for media types, you may want to preview the media, so I created a simple component to show Photo and Video.

```dart
//Photo component preview file
IpsPhoto(
    file: _photo,
    onClick: (){
        //Your sheet implementation
    }
);

//Video component preview thumbnail
IpsVideo(
    thumbnail: _thumbnailVideo,
    onClick: (){
        //Your sheet implementation
    },
);
```

---

### Opening a sheet:

```dart
InputSheet(
    //InputSheet implements the scope information of sheet
    context,
    label: "Name",
    cancelText: "Cancel",
    doneText: "Confirm",
).text(
    //.text or any other option available type implemets the input type
    placeholder: "Type here...",
    value: _name,
    onDone: (dynamic value) => setState(() {
        _name = value;
    }),
);
```

---

### Complete simple example:

```dart
class _MyHomePageState extends State<MyHomePage> {
  String _name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: IpsCard(
                label: IpsLabel("Name"),
                value: IpsValue(_name ?? "Touch to edit..."),
                icon: IpsIcon(FeatherIcons.user),
                error: IpsError(_errors['name']),
                onClick: () => InputSheet(
                  context,
                  label: "Name",
                  cancelText: "Cancel",
                  doneText: "Confirm",
                ).text(
                  placeholder: "Type here...",
                  value: _name,
                  onDone: (dynamic value) => setState(() {
                    _name = value;
                  }),
                ),
            ),
        ),
      ),
    );
  }
}

```

---

## The InputSheet factory

It will be instanced for each input sheet type you want to invoke, on this Factory you can pass some scope parameters of your sheet.

```dart
InputSheet(context,
  label: "Your name",
  cancelText: "Cancel button",
  doneText: "Done button",
  keyboardAutofocus: true,
);
```

| Parameters        | Type   | Description                                 |
| ----------------- | ------ | ------------------------------------------- |
| label             | String | The message showing above input             |
| cancelText        | String | The cancel button text                      |
| doneText          | String | The confirmation button text                |
| keyboardAutofocus | bool   | Auto-focus editable inputs after open sheet |

---

## The input types

### **Text**

_This input implements a simple text input._

```dart
InputSheet(context).text(
    textInputType: TextInputType.text,
    placeholder: "Type here...",
    value: _value,
    onDone: (String value) => setState(() {
        _value = value;
    }),
);
```

| Parameters    | Type             | Description                                           |
| ------------- | ---------------- | ----------------------------------------------------- |
| textInputType | TextInputType    | The default keyboard input type                       |
| placeholder   | String           | Add a placeholder to input                            |
| value         | String           | Add a default value to input                          |
| onDone        | Function(String) | Callback function called when done ediding input text |

---

### **Longtext**

_This input implements a long text input that break lines and increase the sheet height according the value length._

```dart
InputSheet(context).longtext(
    placeholder: "Type here...",
    value: _value,
    onDone: (String value) => setState(() {
        _value = value;
    }),
);
```

| Parameters  | Type             | Description                                           |
| ----------- | ---------------- | ----------------------------------------------------- |
| placeholder | String           | Add a placeholder to input                            |
| value       | String           | Add a default value to input                          |
| onDone      | Function(String) | Callback function called when done ediding input text |

---

### **Mask**

_This input uses [flutter_masked_text](https://pub.dev/packages/flutter_masked_text) package to manage the mask patterns and switch from pattern to pattern according the value length, see the package to learn about this patterns._

```dart
InputSheet(context).mask(
    masks: ['(00) 0000-0000', '(00) 0 0000-0000'],
    textInputType: TextInputType.text,
    placeholder: "Type here...",
    value: _value,
    onDone: (String value) => setState(() {
        _value = value;
    }),
);
```

| Parameters    | Type             | Description                                                                       |
| ------------- | ---------------- | --------------------------------------------------------------------------------- |
| masks         | List<\String>    | The mask pattern that the input will use according the number of characters value |
| textInputType | TextInputType    | The default keyboard input type                                                   |
| placeholder   | String           | Add a placeholder to input                                                        |
| value         | String           | Add a default value to input                                                      |
| onDone        | Function(String) | Callback function called when done ediding input text                             |

---

### **Number**

_This input uses [flutter_masked_text](https://pub.dev/packages/flutter_masked_text) package to manage symbols and separators, then you can configure it to implement `number` or `currency` inputs._

```dart
InputSheet(context).number(
    leftSymbol: "to pay:",
    rightSymbol: "U\$",
    decimalSeparator: ".",
    thousandSeparator: ",",
    precision: 2,
    placeholder: "Type here...",
    value: _value,
    onDone: (double value) => setState(() {
        _value = value;
    }),
);
```

| Parameters        | Type             | Description                                           |
| ----------------- | ---------------- | ----------------------------------------------------- |
| leftSymbol        | String           | Blank default, is used only on input                  |
| rightSymbol       | String           | Blank default, is used only on input                  |
| decimalSeparator  | String           | Default " . " is used only on input                   |
| thousandSeparator | String           | Default " , " is used only on input                   |
| precision         | int              | The number of decimal places                          |
| placeholder       | String           | Add a placeholder to input                            |
| value             | String           | Add a default value to input                          |
| onDone            | Function(String) | Callback function called when done ediding input text |

---

### **Date**

_This input uses [flutter_cupertino_date_picker](https://pub.dev/packages/flutter_cupertino_date_picker) to manage state and formatters on Date picker._

```dart
InputSheet(context).date(
    minDateTime: DateTime.now().subtract(Duration(days: 365 * 100)),
    maxDateTime: DateTime.now(),
    locale: DateTimePickerLocale.en_us,
    format: "yyyy-MM-dd",
    pickerFormat: "yyyy|MMMM|dd",
    value: _value,
    onDone: (String value) => setState(() {
        _value = value;
    }),
);
```

| Parameters   | Type                 | Description                                                                                  |
| ------------ | -------------------- | -------------------------------------------------------------------------------------------- |
| minDateTime  | DateTime             | Min date available to select                                                             |
| maxDateTime  | DateTime             | Max date abailable to select                                                             |
| locale       | DateTimePickerLocale | `locale` is used to translate labels and must to be imported from [flutter_cupertino_date_picker](https://pub.dev/packages/flutter_cupertino_date_picker) package                                                            |
| format       | String               | The format of value inserted in 'value' param                                                |
| pickerFormat | String               | Add a placeholder to input                                                                   |
| value        | String               | Add a default value to input                                                                 |
| onDone       | Function(String)     | Callback function called when select date. It will return with same format of param 'format' |

---

### **Time**

_This input uses [flutter_cupertino_date_picker](https://pub.dev/packages/flutter_cupertino_date_picker) to manage state and formatters on Time picker._

```dart
InputSheet(context).time(
    minDateTime: DateTime.now().subtract(Duration(hours: 5)),
    maxDateTime: DateTime.now().add(Duration(hours: 5)),
    locale: DateTimePickerLocale.en_us,
    format: "HH:mm",
    pickerFormat: "HH|mm",
    minuteDivider: 15,
    value: _value,
    onDone: (String value) => setState(() {
        _value = value;
    }),
);
```

| Parameters    | Type                 | Description                                                                                  |
| ------------- | -------------------- | -------------------------------------------------------------------------------------------- |
| minDateTime   | DateTime             | Min date available to select                                                             |
| maxDateTime   | DateTime             | Max date abailable to select                                                             |
| locale        | DateTimePickerLocale | `locale` is used to translate labels and must to be imported from [flutter_cupertino_date_picker](https://pub.dev/packages/flutter_cupertino_date_picker) package                                                            |
| format        | String               | The format of value inserted in 'value' param                                                |
| pickerFormat  | String               | Add a placeholder to input                                                                   |
| minuteDivider | int                  | Time between each minute option                                                              |
| value         | String               | Add a default value to input                                                                 |
| onDone        | Function(String)     | Callback function called when select date. It will return with same format of param 'format' |

---

### **Date and Time**

_This input uses [flutter_cupertino_date_picker](https://pub.dev/packages/flutter_cupertino_date_picker) to manage state and formatters on DateTime picker._

```dart
InputSheet(context).datetime(
    minDateTime: DateTime.now(),
    maxDateTime: DateTime.now().add(Duration(days: 7)),
    locale: DateTimePickerLocale.en_us,
    format: "yyyy-MM-dd HH:mm",
    pickerFormat: "yyyy/MM/dd|HH|mm",
    minuteDivider: 15,
    value: _value,
    onDone: (String value) => setState(() {
        _value = value;
    }),
);
```

| Parameters    | Type                 | Description                                                                                  |
| ------------- | -------------------- | -------------------------------------------------------------------------------------------- |
| minDateTime   | DateTime             | Min date available to select                                                             |
| maxDateTime   | DateTime             | Max date abailable to select                                                             |
| locale        | DateTimePickerLocale | `locale` is used to translate labels and must to be imported from [flutter_cupertino_date_picker](https://pub.dev/packages/flutter_cupertino_date_picker) package                                                            |
| format        | String               | The format of value inserted in 'value' param                                                |
| pickerFormat  | String               | Add a placeholder to input                                                                   |
| minuteDivider | int                  | Time between each minute option                                                              |
| value         | String               | Add a default value to input                                                                 |
| onDone        | Function(String)     | Callback function called when select date. It will return with same format of param 'format' |

---

### **Options**

_This input implements options to select_

```dart

InputSheet(context).options(
    options: { '0':'Chocolate' ,'1':'Vanilla', '2':'Strawberry'},
    value: _value,
    onDone: (String value) => setState(() {
        _value = value;
    }),
);
```

| Parameters | Type                  | Description                                                                            |
| ---------- | --------------------- | -------------------------------------------------------------------------------------- |
| options    | Map<\String, \String> | A map with value-key pair to be selected as an option                                  |
| value      | String                | A default selected key of options                                                      |
| onDone     | Function(String)      | Callback function called when select an option. It will return the selected key option |

---

### **Photo**

_This input use [camera](https://pub.dev/packages/camera) to handle camera and need to be imported in your project to pass the parameter `resolution` and perform your camera quality._

The photo input already handler user permission to access camera.

```dart
InputSheet(context).photo(
    url: "url/to/preview/image",
    file: new File("path/to/your/photo"),
    height: 300,
    resolution: ResolutionPreset.high,
    labelInitializingCamera: "Unitializing camera...",
    labelNoCameraAvailable: "There is no camera available on this device",
    onDone: (File file, Uint8List thumbnail) => setState(() {
        _value = file;
        _thumb = thumbnail;
    }),
);
```

| Parameters              | Type                                      | Description                                                                                                                                       |
| ----------------------- | ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| url                     | String                                    | The uploaded url file to preview the input photo                                                                                                  |
| file                    | File                                      | The local file who will be edited and used as local preview                                                                                       |
| height                  | double                                    | The height of sheet, by default it uses all screen height                                                                                         |
| resolution              | ResolutionPreset                          | ResolutionPreset is uset to manage camera quality and must to be imported from [camera](https://pub.dev/packages/camera) package  |
| labelInitializingCamera | String                                    | A default message to show until camera initialize                                                                                                 |
| labelNoCameraAvailable | String                                    | A default message to show when has no camera available                                                                                                 |
| onDone                  | Function(File, file, Uint8List thumbnail) | Callback function called when photo is captured. It will return the file of image and an Uint8List as memory thumbnail                            |

---

### **Video**

_This input use [camera](https://pub.dev/packages/camera) to handle camera and need to be imported in your project to pass the parameter `resolution` and perform your camera quality._

_The video input also use [video_compress](https://pub.dev/packages/video_compress) to convert video if neccessary and perform it to reproduce in any web codec environment._

_The video input already handle user permission to access `camera` and `mic`._

```dart
InputSheet(context).video(
    url: "url/to/preview/video",
    file: new File("path/to/your/video"),
    height: 300,
    resolution: ResolutionPreset.high,
    labelInitializingCamera: "Unitializing camera...",
    labelNoCameraAvailable: "There is no camera available on this device",
    timeRecordLimit: 60,
    sufixRecordTimeout: "Sec remaining "
    compress: VideoQuality.DefaultQuality,
    labelCompressing: "Converting video...",
    onDone: (File file, Uint8List thumbnail) => setState(() {
        _value = file;
        _thumb = thumbnail;
    }),
);
```

| Parameters              | Type                                      | Description                                                                                                                                                                     |
| ----------------------- | ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| url                     | String                                    | The uploaded url file to preview the input video                                                                                                                                |
| file                    | File                                      | The local file who will be edited and used as local preview                                                                                                                     |
| height                  | double                                    | The height of sheet, by default it uses all screen height                                                                                                                       |
| resolution              | ResolutionPreset                          | ResolutionPreset is uset to manage camera quality and must to be imported from [camera](https://pub.dev/packages/camera) package                               |
| labelInitializingCamera | String                                    | A default message to show until camera initialize                                                                                                                               |
| labelNoCameraAvailable | String                                    | A default message to show when has no camera available                                                                                                 |
| timeRecordLimit         | int                                       | The time limit to record video                                                                                                                                                  |
| sufixRecordTimeout      | String                                    | The label suffix to remaining record time                                                                                                                                       |
| compress                | VideoQuality                              | VideoQuality is optional. Is used to convert video after stop recording and must to be imported from [video_compress](https://pub.dev/packages/video_compress) package  |
| labelCompressing        | String                                    | If compress is informed, this message will apper on screen to inform the video conversion.                                                                                      |
| onDone                  | Function(File, file, Uint8List thumbnail) | Callback function called when photo is captured. It will return the file of image and an Uint8List as memory thumbnail                                                          |

---

## 🎉 Acknowledgment

Thanks to all the projects that make this package possible. Especially those that facilitate the management of inputs:

- https://pub.dev/packages/camera
- https://pub.dev/packages/video_compress
- https://pub.dev/packages/video_player
- https://pub.dev/packages/flutter_masked_text
- https://pub.dev/packages/permission_handler
- https://pub.dev/packages/flutter_cupertino_date_picker

---

## License

[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](LICENSE)

Copyright (c) 2020 André Ciornavei

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
