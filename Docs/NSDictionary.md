# NSDictionary additions

## Transitive access

Allows access objects located under several levels using a key delimited by a custom delimiter.

### API
```objc
- (id) objectForTransitiveKey:(NSString *)key; // default delimiter is .
- (id) objectForTransitiveKey:(NSString *)key delimiter:(NSString *)delimiter;
```
