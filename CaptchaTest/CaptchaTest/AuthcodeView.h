//
//  AuthcodeView.h
//  验证码生成view
//
//  Created by 赵宏亚 on 2017/8/11.
//  Copyright © 2017年 赵宏亚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthcodeView : UIView

@property (strong, nonatomic) NSArray *dataArray;//字符素材数组

@property (strong, nonatomic) NSMutableString *authCodeStr;//验证码字符串

@end
