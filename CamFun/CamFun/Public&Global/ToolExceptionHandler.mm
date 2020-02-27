//
//  ToolExceptionHandler.m
//  CamFun
//
//  Created by 伟龙 on 2020/2/25.
//  Copyright © 2020 伟龙. All rights reserved.
//

#import "ToolExceptionHandler.h"

@implementation ToolExceptionHandler
+(void)startExceptionCatch{
    //此法只能拦截 ns系列闪退
    NSSetUncaughtExceptionHandler(&uncatchExceptionHandle) ;
//    __strong  NSarray
//    Nsarray  两种写法一样
}

void uncatchExceptionHandle(NSException *exc){
    NSArray *arr = [exc callStackSymbols];
    NSString *reason = [exc reason];
    NSString *name = [exc name];
    NSLog(@"+++++%@\n%@\n%@",arr, reason, name);
    NSString  *path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject stringByAppendingFormat:@"/log.log"];
        NSLog(@"+++++%@",path);
    [exc.callStackSymbols writeToFile:path atomically:NO];
    NSString  *apath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject stringByAppendingFormat:@"/loguserinfo.log"];
         NSLog(@"+++++%@",apath);
      [exc.userInfo writeToFile:apath atomically:NO];
}
@end
