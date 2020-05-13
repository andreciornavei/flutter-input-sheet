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

## ✨ Features

- Text
- Longtext
- Masked
- Number
- Datetime
- Photo
- Video

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

### Complete simple example:

```dart
IpsCard(
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
)
```



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
