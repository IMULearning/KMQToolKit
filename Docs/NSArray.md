# NSArray additions

## Basic operaionts

### Intersection

```objc
NSArray *a = @[@"1", @"2", @"3"];
NSArray *b = @[@"3", @"4", @"5"];
[a intersects:b]; // YES
```

### Subarray

```objc
NSArray *a = @[@"1", @"2", @"3"];
NSArray *b = @[@"1", @"2", @"3", @"4"];
[a isSubArrayOf:b]; //YES
```

## TODO
- `find`: based on `indexOfObjectPassingTest`
- `findAll`: based on `indexesOfObjectsPassingTest`
- `collect`
- `unique`
