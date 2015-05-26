# Material design AlertView
AlertView in material design,support iOS 7 and above.     
![](http://ww3.sinaimg.cn/large/81e9aa8bjw1es63p9mq7wg20ac0i91kx.gif)    


## Usage

```objective-c
MDAlertView *alert = [[MDAlertView alloc]initWithTitle:<#(NSString *)#> message:<#(NSString *)#> image:<#(UIImage *)#> delegate:<#(id)#> cancelButtonTitle:<#(NSString *)#> confirmButtonTitle:<#(NSString *)#>];
alert.delegate = self;
[alert show];
```
