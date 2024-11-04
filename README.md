
## Animated_FAB
A flutter package contains an animated floating action button.

## Demo
<img src="https://github.com/dv-mahbub/file/blob/main/animated_fab/animated_fab.gif?raw=true" width="250"/>


## How to

```bash
    bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedFAB(
      animatedBox:   //here add a child (widget/widget tree to apperar as action box when the floatingActionButton is pressed)
      
        // you can add other neccessary parameters such as actionBoxHeight, actionBoxWidth, buttonColor, buttonHeight, buttonWidth, durationInMilliseconds, buttonDistanceFromButton, buttonBorderRadius.
      ),
```



