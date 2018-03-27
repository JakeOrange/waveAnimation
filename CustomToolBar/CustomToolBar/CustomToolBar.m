//
//  CustomToolBar.m
//  CustomToolBar
//
//  Created by 陈鹏 on 2018/3/26.
//  Copyright © 2018年 jasonchen. All rights reserved.
//

#import "CustomToolBar.h"
#import "CustomToolBarItem.h"

const NSInteger btnWidth = 50;
const NSInteger minRadius = 50;
@interface CustomToolBar() {
    NSArray<CustomToolBarItem *> *_items;
    CGFloat _forceTouch;
}

@end


@implementation CustomToolBar

/**
 为CustomToolBar添加items，仿UIToolBar布局已经写死

 @param items 为CustomToolBar添加的自定义的item的数组
 */
- (void)setItems:(NSArray<CustomToolBarItem *> *)items {
    for (NSInteger i = 0; i < items.count; i++) {
        CustomToolBarItem *btn = items[i];
        btn.frame = CGRectMake(50 + (50 + btnWidth) * i, (CGRectGetHeight(self.bounds)  - btnWidth) / 2, btnWidth, btnWidth);
        btn.tintColor = self.tintColor;
        [self addSubview:btn];
    }
    _items = items;
}


/**
 暂时想到的通过此方法获取forceTouch

 @param touches touches description
 @param event event description
 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [touches enumerateObjectsUsingBlock:^(UITouch * _Nonnull obj, BOOL * _Nonnull stop) {
        if (@available(iOS 9.0, *)) {
            _forceTouch = obj.force;
        }
        NSLog(@"forceTouch : %f", _forceTouch);
        if ([obj.view isKindOfClass:[CustomToolBarItem class]]) {
            [self forceTounch:obj.view];
        }
    }];
}


/**
 响应点击事件，开始动画

 @param sender 点击到的item
 */
- (void)forceTounch:(id)sender {
    CustomToolBarItem *btn = (CustomToolBarItem *)sender;
    CAShapeLayer *waveLayer = [CAShapeLayer layer];
    waveLayer.backgroundColor = [UIColor brownColor].CGColor;
    waveLayer.opacity = 0.6 * (1 + _forceTouch);
    waveLayer.fillColor = [UIColor whiteColor].CGColor;
    [btn.layer addSublayer:waveLayer];
    
    [self startAnimationInLayer:waveLayer
                         center:CGPointMake(btnWidth / 2.0, btnWidth / 2.0)];
}


/**
 通过贝塞尔曲线生成一个从内向外扩散的圆环平面，在扩散过程中，透明度逐渐变为0

 @param layer 播放动画的layer
 @param center 波纹的中心点
 */
- (void)startAnimationInLayer:(CALayer *)layer center:(CGPoint)center{
    
    UIBezierPath *beginPath = [UIBezierPath bezierPathWithArcCenter:center
                                                             radius:10
                                                         startAngle:0
                                                           endAngle:M_PI * 2
                                                          clockwise:YES];
    UIBezierPath *endPath = [UIBezierPath bezierPathWithArcCenter:center
                                                           radius:minRadius * (1 + _forceTouch)
                                                       startAngle:0
                                                         endAngle:M_PI * 2
                                                        clockwise:YES];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    CABasicAnimation *rippleAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    rippleAnimation.fromValue = (__bridge id)(beginPath.CGPath);
    rippleAnimation.toValue = (__bridge id)(endPath.CGPath);
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:0.6 * (1 + _forceTouch)];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
    
    group.animations = @[rippleAnimation, opacityAnimation];
    group.duration = 6;
    [layer addAnimation:group forKey:@"waveAnimation"];
}



@end
