A Dart interface to use with Robin Herbot's InputMask: 
https://github.com/RobinHerbots/Inputmask

*Not all* options are added.  
But you can file an issue and I will add what you need.


## Usage

A simple usage example:

```dart
import 'package:input_mask/input_mask.dart';

class MyComponent {
  Mask mask;
  
  @ViewChild('inp') InputElement inputElement;
    
  OnInit() {
    // or you can get it like:
    // final inputElement = document.createElement('input'); 
    
    mask = new Mask(new MaskOptions(
        showMaskOnHover: false,
        alias: 'integer',
        rightAlign: false,
        oncomplete: allowInterop((dynamic a){
          String clean = mask.unmaskedvalue();
  
          print('Complete: $clean');
        }),
        onincomplete: allowInterop((dynamic a){
          print('Incomplete');
        }),
        oncleared: allowInterop((a){
          print('Cleared');
        })
    )).mask(inputElement);
  }
}
```
