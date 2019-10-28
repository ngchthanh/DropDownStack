# DropDownStack
DropdownStack is a stack of buttons. Simple, It show short menu such as gender, language, ...etc

<img src='https://i.imgur.com/2xoyNSw.gif' title='Video Walkthrough' width='240' alt='Video Walkthrough' />

## **Installation**
##### **Coacoapods**
To install with CocoaPods, copy and paste this in your Podfile file:
```
pod 'DropDownStack'
```
##### **Manual**
You can always do it the old-fashioned way - just drag the source file into your projects and you are good to go.

## **Usage**
```
let items = [
            DropDownView<Int>.Item(title: "English", model: 0),
            DropDownView.Item(title: "Vietnamese", model: 1),
            DropDownView.Item(title: "Chinese", model: 2),
            DropDownView.Item(title: "Japanese", model: 3),
        ]
let config = DropDownConfiguration(itemSize: .dynamic, checkIcon: UIImage(named: "icon-check"))
let dropDownView = DropDownView(items: items, configuration: config)
dropDownView.didSelect = { item in
  print("did select \(item)")
}
```
