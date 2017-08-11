//
//  AuthcodeView.m
//  CaptchaTest
//
//  Created by 赵宏亚 on 2017/8/11.
//  Copyright © 2017年 赵宏亚. All rights reserved.
//

#import "AuthcodeView.h"

#define kCharCount 4
#define kFontSize [UIFont systemFontOfSize:18]
@implementation AuthcodeView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.layer.borderWidth = 1; // 边框宽度
        self.layer.borderColor = [[UIColor darkGrayColor] CGColor];
        self.layer.cornerRadius = 2.0f;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        [self getAuthcode];//获得随机验证码
    }
    return self;
}

#pragma mark 获得随机验证码
- (void)getAuthcode
{
    //字符串素材
    _dataArray = [[NSArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    
    _authCodeStr = [[NSMutableString alloc] initWithCapacity:kCharCount];
    //随机从数组中选取需要个数的字符串，拼接为验证码字符串
    for (int i = 0; i < kCharCount; i++)
    {
        NSInteger index = arc4random() % (_dataArray.count-1);
        NSString *tempStr = [_dataArray objectAtIndex:index];
        _authCodeStr = (NSMutableString *)[_authCodeStr stringByAppendingString:tempStr];
    }
}

#pragma mark 点击界面切换验证码
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self getAuthcode];
    //setNeedsDisplay调用drawRect方法来实现view的绘制
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    //根据要显示的验证码字符串，根据长度，计算每个字符串显示的位置
    NSString *text = [NSString stringWithFormat:@"%@",_authCodeStr];
    
    CGSize cSize = [@"A" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    
    int height = rect.size.height - cSize.height;
    CGPoint point;
    
    //依次绘制每一个字符,可以设置显示的每个字符的字体大小、颜色、样式等
    float pX,pY;
    for ( int i = 0; i<text.length; i++)
    {
        pX = (rect.size.width-3)/text.length * i+3;
        pY = arc4random() % (height-5) + 2.5;
        point = CGPointMake(pX, pY);
        
        unichar c = [text characterAtIndex:i];
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        [textC drawAtPoint:point withAttributes:@{NSFontAttributeName:kFontSize,NSObliquenessAttributeName:@(0.5-(arc4random()%100)/100.0)}];
    }

}



@end
