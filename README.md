# view_builder
The ViewBuilder package is a convenient and easy-to-use tool for building responsive and dynamic Flutter user interfaces. This package provides three key features to help developers streamline their UI development process: server error handling, empty data widget creation, and loading widget creation.

Server Error Handling:
With ViewBuilder, you can easily handle server errors and display relevant error messages to the user. The package provides pre-built error widgets that you can customize to match your app's design language. Additionally, ViewBuilder makes it easy to handle different types of errors and provide relevant feedback to the user.

Empty Data Widget:
The package also includes a built-in empty data widget that you can use to display custom messages when no data is available. This widget is fully customizable, so you can adjust its appearance to match your app's design language. Furthermore, ViewBuilder provides additional customization options, such as the ability to include custom illustrations or animations within the widget.

Loading Widget:
Lastly, ViewBuilder provides a customizable loading widget that you can use to indicate when data is being loaded. This widget is designed to seamlessly integrate into your app's UI and can be customized to match your app's branding. ViewBuilder also includes advanced customization options, such as the ability to adjust the loading animation or to include custom branding elements within the widget.

In summary, the ViewBuilder package simplifies UI development by providing easy-to-use tools for handling server errors, displaying empty data messages, and creating loading animations. With this package, you can streamline your UI development process and deliver a more polished and responsive user experience.


## Features

 - Show Loading
 - Show Empty data
 - Show Error Data
 - Refresh ViewBuilder
 - Load More data

## Example

For Better Expericnce go to `/example` folder.
 
 
 
 # Installing

Add the package to your pubspec.yaml:

```yaml
dependencies:
  view_builder:
```


Import view_builder in files that it will be used:

```dart
import 'package:view_builder/view_builder.dart';
```

 ## Usage
 
    ViewBuilder(
        length: 10
        loadingStatus: loadingStatus,
        scrollController: scrollController,
        emptyDataText: "No Data!",
        onRefresh:  onRefresh,
        itemBuilder: (context, index) {
          return Card(child: ListTile(leading: Text("index $index")));
        },
    ),

 ```
 

 
