# flutter-input-sheet

[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](LICENSE)

A pack of input types implemented as a sheet! 🚀

## Overview

flutter-input-sheet is a package that show inputs in sheets instead.

It was created for the purpose of make simple and enjoyable extensive app forms. Than you can create beauty and customizable data information and edit it on sheets for each one.

It was developed abstracting and implementing great packages in pub.dev to make a single and simple package to implement forms.

## Installation

Add the latest package version to your pubspeck.yaml dependencies

```yaml
input_sheet: ^0.0.1
```

Also, this package uses some other libraries that need to be imported in your project to work, this libraries is used in some input types that need constants informed at params.

```yaml
camera: ^0.5.7+4
video_compress: ^2.0.0
flutter_masked_text: ^0.8.0
flutter_cupertino_date_picker: ^1.0.12
```


## ✨ Features

- [x] Text
- [x] Longtext
- [x] Masked
- [x] Number
- [x] Datetime
- [x] Photo
- [x] Video
- [ ] Slider
- [ ] Color
- [ ] MultiOption

## 🚀 Basic components

Was created some basic components to show data information on screen before open the input sheet.

- IpsCard
- IpsLabel
- IpsError
- IpsIcon
- IpsValue
- IpsPhoto
- IpsVideo

## ✨ Examples

### Basic component:

This library implements a basic and optional card component to make your forms simple to show yours data. 

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

It will me instanced for each input sheet type you want to invoke, on this Factory you can pass some scope parameters of your sheet.

```dart
InputSheet(context,
  label: "Your name",
  cancelText: "Cancel button",
  doneText: "Done button",
  keyboardAutofocus: true,
);
```
| Parameters | Type | Description |
|-|-|-| 
| label | String | The message showing above input |
| cancelText | String | The cancel button text  |
| doneText | String | The confirmation button text |
| keyboardAutofocus | bool | Auto-focus editable inputs after open sheet |

---

## The input types

### Text
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
| Parameters | Type | Description |
|-|-|-| 
| textInputType | TextInputType | The default keyboard input type
| placeholder | String | Add a placeholder to input |
| value | String | Add a default value to input |
| onDone | Function(String) | Callback function called when done ediding input text |

---

### Longtext
```dart
InputSheet(context).longtext(
    placeholder: "Type here...",
    value: _value,
    onDone: (String value) => setState(() {
        _value = value;
    }),
);
```
| Parameters | Type | Description |
|-|-|-| 
| placeholder | String | Add a placeholder to input |
| value | String | Add a default value to input |
| onDone | Function(String) | Callback function called when done ediding input text |

---

### Mask
The mask input uses [flutter_masked_text](https://pub.dev/packages/flutter_masked_text) package to manage the mask patterns.
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
| Parameters | Type | Description |
|-|-|-| 
| masks | List<\String> | The mask pattern that the input will use according the number of characters value
| textInputType | TextInputType | The default keyboard input type
| placeholder | String | Add a placeholder to input |
| value | String | Add a default value to input |
| onDone | Function(String) | Callback function called when done ediding input text |

---

### Number
The number input uses [flutter_masked_text](https://pub.dev/packages/flutter_masked_text) package to manage symbols and separators.
```dart
InputSheet(context).number(
    leftSymbol: "to pay:",
    rightSylbol: "U$",
    placeholder: "Type here...",
    value: _value,
    onDone: (double value) => setState(() {
        _value = value;
    }),
);
```
| Parameters | Type | Description |
|-|-|-| 
| decimalSeparator | String | Default " . " is used only on input |
| thousandSeparator | String | Default " , " is used only on input  |
| leftSymbol | String | Blank default, is used only on input |
| rightSymbol | String | Blank default, is used only on input |
| placeholder | String | Add a placeholder to input |
| value | String | Add a default value to input |
| onDone | Function(String) | Callback function called when done ediding input text |

---

### Date
The number input uses [flutter_cupertino_date_picker](https://pub.dev/packages/flutter_cupertino_date_picker) to state management and formatters.
```dart
InputSheet(context).date(
    minDateTime: new DateTime.now().subDays(5),
    maxDateTime: new DateTime.now(),
    locale: DateTimePickerLocale.en_us,
    format: "yyyy-MM-dd",
    pickerFormat: "yyyy|MMMM|dd",
    value: _value,
    onDone: (String value) => setState(() {
        _value = value;
    }),
);
```
| Parameters | Type | Description |
|-|-|-| 
| minDateTime | DateTime | The min date available to select |
| maxDateTime | DateTime | The max date abailable to select  |
| locale | DateTimePickerLocale | The locale used to translate data |
| format | String | The format of value inserted in 'value' param |
| pickerFormat | String | Add a placeholder to input |
| value | String | Add a default value to input |
| onDone | Function(String) | Callback function called when select date. It will return with same format of param 'format' |

---

### Options
```dart
InputSheet(context).date(
    options: { '0':'Chocolate' ,'1':'Vanilla', '2':'Strawberry'},
    value: _value,
    onDone: (String value) => setState(() {
        _value = value;
    }),
);
```
| Parameters | Type | Description |
|-|-|-| 
| options | Map<\String, \String> | A map with value-key pair to be selected as an option |
| value | String | A default selected key of options |
| onDone | Function(String) | Callback function called when select an option. It will return the selected key option |

---

### Photo
The photo input uses [camera](https://pub.dev/packages/camera) to handle the camera and need to be imported in your project to pass the parameter `resolution` to perform your camera quality.

The photo input already handler user permission to access camera.

```dart
InputSheet(context).photo(
    url: "url/to/preview/image",
    file: new File("path/to/your/photo"),
    height: 300,
    resolution: ResolutionPreset.high,
    labelInitializingCamera: "Unitializing camera...",
    onDone: (File file, Uint8List thumbnail) => setState(() {
        _value = file;
        _thumb = thumbnail;
    }),
);
```
| Parameters | Type | Description |
|-|-|-| 
| url | String | The uploaded url file to preview the input photo |
| file | File | The local file who will be edited and used as local preview |
| height | double | The height of sheet, by default it uses all screen height |
| resolution | ResolutionPreset | ResolutionPreset is imported from [camera](https://pub.dev/packages/camera) and set the resolution you want to apply on camera to perform quality |
| labelInitializingCamera | String | A default message to show until camera initialize |
| onDone | Function(File, file, Uint8List thumbnail) | Callback function called when photo is captured. It will return the file of image and an Uint8List as memory thumbnail |

---

### Video
The video input uses [camera](https://pub.dev/packages/camera) to handle the camera and need to be imported in your project to pass the parameter `resolution` to perform your camera quality.

The video input also uses [video_compress](https://pub.dev/packages/video_compress) to convert video if neccessary and perform it to reproduce in any web codec environment.

The video input already handler user permission to access camera and mic.

```dart
InputSheet(context).video(
    url: "url/to/preview/video",
    file: new File("path/to/your/video"),
    height: 300,
    resolution: ResolutionPreset.high,
    labelInitializingCamera: "Unitializing camera...",
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
| Parameters | Type | Description |
|-|-|-| 
| url | String | The uploaded url file to preview the input video |
| file | File | The local file who will be edited and used as local preview |
| height | double | The height of sheet, by default it uses all screen height |
| resolution | ResolutionPreset | ResolutionPreset is imported from [camera](https://pub.dev/packages/camera) and set the resolution you want to apply on camera to perform quality |
| labelInitializingCamera | String | A default message to show until camera initialize |
| timeRecordLimit | int | The time limit to record video |
| sufixRecordTimeout | String | The label suffix to remaining record time |
| compress | VideoQuality | VideoQuality is optional and is imported from [video_compress](https://pub.dev/packages/video_compress) package. Is informed, the video will be converted after stop recording. |
| labelCompressing | String | If compress is informed, this message will apper on screen to inform the video conversion.  |
| onDone | Function(File, file, Uint8List thumbnail) | Callback function called when photo is captured. It will return the file of image and an Uint8List as memory thumbnail |

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
