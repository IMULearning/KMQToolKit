# UIViewController additions

## Storyboard

Wrapper API to get a `UIViewController` from storyboard.

```objc
MyViewController *vc = [UIViewController controllerWithIdentifier:@"myVC" fromStoryboardWithName:@"Main" inBundle:[NSBundle mainBundle]];
```

## View controller embedding

Wrapper API to embed a `UIViewController` in a `UIView` of the parent `UIViewController`. Check out [this artical](https://www.objc.io/issues/1-view-controllers/containment-view-controller/). The API works both ways, from either the child view controller or the parent view controller. It will register the child view controller with the parent and reset its frame within the container view. The result is a much more modular way of organizing view controller logic.

```objc
[self addSubController:self.answerTableViewController inView:self.answerTableView];

or

[self addToParentController:self.answerViewController inView:self.answerViewController.answerTableView];
```
