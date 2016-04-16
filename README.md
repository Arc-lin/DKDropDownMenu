#DKDropDownMenu

####Dankal下拉菜单框架，研发中。。。
****

####使用方法

**1.首先你需要创建一个数组去储存你的选项**

```
NSArray *array = @[@"测试按钮1",@"测试按钮2",@"测试按钮3",@"测试按钮4",@"测试按钮5",@"测试按钮6",@"测试按钮7"];
```
**2.然后你要把这个下拉菜单放在一个父控件之下**

这里就不解释怎么创建一个父控件了，一般都是以UIButton为父控件来添加下拉菜单，这里就随便搞一个button

```

/**
 *  测试按钮
 */
- (void)setupTestButton
{
    UIButton *button = [[UIButton alloc] init];
    CGRect rect = button.frame;
    rect.size.width = 100;
    rect.size.height = 40;
    button.frame = rect;
    button.center = self.view.center;
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [button setTitle:@"点击测试" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.button = button;
}

```
**3.重点**

你应该设置一下你的每个选项按钮的高度（buttonHeight） 下拉菜单距离父控件的高度（topMargin）还有由于该下拉菜单是可滚动的，所以你应该设置下一页最多显示几个按钮(numberOfShowOptions)

```
 DKDropDownMenu *menu = [[DKDropDownMenu alloc] initDKDropDownMenuWithOptions:array parentView:self.button buttonHeight:40 topMargin:5 numberOfShowOptions:3.5];
```

**4.另外。我提供了一个代理来监听菜单按钮的点击事件**

```
<DKButtonDelegate>
- (void)optionDidClick:(UIButton *)button
```
如果要调用该协议方法，请设置

```
menu.optionDelegate = self;

```


**5.要显示/隐藏 该下拉菜单，请使用**

```
- (void)showMenuWithAnimted:(BOOL)animate
- (void)hideMenuWithAnimted:(BOOL)animate
```

*目前仅支持淡入、淡出动画*


