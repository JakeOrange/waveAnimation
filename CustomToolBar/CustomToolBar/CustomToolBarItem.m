//
//  CustomToolBarItem.m
//  CustomToolBar
//
//  Created by 陈鹏 on 2018/3/27.
//  Copyright © 2018年 jasonchen. All rights reserved.
//

#import "CustomToolBarItem.h"

@interface CustomToolBarItem() {
    NSInteger _itemType;
    NSString *_title;
    UIColor *_tintColor;
}

@property (nonatomic, assign) NSInteger itemType;

@end


@implementation CustomToolBarItem

/**
 生成1个item，不需要用户去创建，直接使用
 
 @param type 自定义item的类型
 @return 返回一个自定义的item
 */
+ (instancetype)customButtonType:(CustomButtonType)type {
    CustomToolBarItem *item = [[CustomToolBarItem alloc] init];
    item.itemType = type;
    switch (type) {
        case CustomButtonTypeTitle:
            {
                UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(item.bounds), CGRectGetHeight(item.bounds))];
                titleLabel.font = [UIFont systemFontOfSize:12];
                titleLabel.textAlignment = NSTextAlignmentCenter;
                [item addSubview:titleLabel];
            }
            break;
        case CustomButtonTypeImage:
            {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(item.bounds), CGRectGetHeight(item.bounds))];
                imageView.contentMode = UIViewContentModeScaleAspectFit;
                [item addSubview:imageView];
            }
            break;
            
        default:
            break;
    }
    return item;
}


/**
 重写title的setter方法，用来更改item显示的文本

 @param title item将要显示的文本
 */
- (void)setTitle:(NSString *)title {
    if (self.itemType == CustomButtonTypeImage) {
        return;
    }
    _title = title;
    if (self.subviews.count > 0) {
        UILabel *subView = self.subviews[0];
        subView.text = title;
    }
}


/**
 重写icon的setter方法，用来更改item显示的icon

 @param icon item将要显示的icon
 */
- (void)setIcon:(UIImage *)icon {
    if (self.itemType == CustomButtonTypeTitle) {
        return;
    }
    icon = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    _icon = icon;
    if (self.subviews.count > 0) {
        UIImageView *subView = self.subviews[0];
        subView.image = icon;
    }
}


/**
 设置title或者icon的颜色

 @param tintColor title或者icon将要展示的颜色
 */
- (void)setTintColor:(UIColor *)tintColor {
    _tintColor = tintColor;
    
    if (self.subviews.count <= 0) {
        return;
    }
    
    switch (self.itemType) {
        case CustomButtonTypeTitle:
        {
            UILabel *subView = self.subviews[0];
            subView.textColor = tintColor;
        }
            break;
        case CustomButtonTypeImage:
        {
            UIImageView *subView = self.subviews[0];
            [subView setTintColor:tintColor];
        }
            break;
        default:
            break;
    }
}


/**
 更改item的位置和大小

 @param frame frame
 */
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    if (self.subviews.count > 0) {
        UILabel *subView = self.subviews[0];
        subView.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
    }
}

@end
