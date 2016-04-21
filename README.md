#DKPopMenu

####Dankal下拉菜单框架，研发中。。。
****

####使用方法

**1.首先你需要创建一个数组去储存你的选项标题**

```
	NSArray *buttonTitles = @[@"按钮一",@"按钮二",@"按钮三",@"按钮四",@"按钮五",@"按钮六",@"按钮七"];
   
```

**2.设置popMenu的位置和尺寸**

```
    CGFloat popW = 100;
    CGFloat popH = 200;
    CGFloat popX = self.view.frame.size.width / 2 - popW / 2;
    CGFloat popY = 70;
    
    ALPopMenu *menu = [ALPopMenu showInRect:CGRectMake(popX, popY, popW, popH)];

```
**3.把刚才的数组赋值给buttonTitles属性**

```
	menu.buttonTitles = self.buttonTitles;
```

**4.选择你想要的类型（单选/多选）**

```
    menu.menuType = ALMenuTypeMultiSelections;  //这是多选
    menu.menuType = ALMenuTypeSingleSelection;  // 这是单选
```

**5.如果你想监听下拉菜单里面按钮的点击事件**

```
    menu.popMenuDelegate = self;
```

**6.代理方法如下**

```
/**
 *  当Type为单选 ALMenuTypeSingleSelection 的时候要用到的代理方法
 *
 *  @param btn 当前选择的选项
 */
- (void)singleOptionDidClick:(UIButton *)btn;

/**
 *  当Type为多选 ALMenuTypeMultiSelections 的时候要用到的代理方法
 *
 *  @param currentOption 当前选择的选项
 *  @param options       所有选中的选项
 */
- (void)multiOptionsDidClick:(UITableViewCell *)currentOption allOptions:(NSArray *)options;

```

**隐藏技能**

- 这样子的话可以给你的下拉菜单添加图片

```
	menu.menuImage = [UIImage imageNamed:@"1"];
    menu.menuType = ALMenuTypeImage;
```
- 另外，其实你可以给ALPopMenu实例的contentView属性赋值任何类型的View，然后这个下拉菜单你想显示什么就显示什么，甚至放一个放navigaionController的rootViewController的view进去或许也可以