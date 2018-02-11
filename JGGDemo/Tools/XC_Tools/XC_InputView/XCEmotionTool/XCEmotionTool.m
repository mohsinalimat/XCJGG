//
//  XCEmotionTool.m
//  JGGDemo
//
//  Created by gao bin on 2018/2/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "XCEmotionTool.h"
#import "XCEmotionModel.h"

@implementation XCEmotionTool

static NSArray  *_defaultEmotions , *_lxhEmotions , *_qqEmtions;


/*  默认表情数据   **/
+ (NSArray *)defaultEmotions
{
    if (!_defaultEmotions) {
        
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"XEmotionIcons" ofType:@"bundle"];
        NSString * path = [NSString stringWithFormat:@"%@/default/info.plist",bundlePath];
        
        NSArray *emotionArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *emotionModelArr = [NSMutableArray array];
        for (NSDictionary *dic in emotionArr) {
            XCEmotionModel *emotionModel = [[XCEmotionModel alloc] initWithDic:dic];
            [emotionModelArr addObject:emotionModel];
        }
        _defaultEmotions = (NSArray *)emotionModelArr;
    }
    return _defaultEmotions;
}

/**  浪小花   */
+(NSArray *)lxhEmtions
{
    if (!_lxhEmotions) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"XEmotionIcons" ofType:@"bundle"];
        NSString * path = [NSString stringWithFormat:@"%@/lxh/info.plist",bundlePath];
        
        NSArray *emotionArr = [NSArray arrayWithContentsOfFile:path];
                
        NSMutableArray *emotionModelArr = [NSMutableArray array];
        for (NSDictionary *dic in emotionArr) {
            XCEmotionModel *emotionModel = [[XCEmotionModel alloc] initWithDic:dic];
            emotionModel.xcemotionType = XCentionModelTypeLxh ; //设置为浪小花表情
            [emotionModelArr addObject:emotionModel];
        }
        _lxhEmotions = (NSArray *)emotionModelArr;
    }
    return _lxhEmotions;
}

+(NSArray *)qqEmtions
{
    if (!_qqEmtions) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"XEmotionIcons" ofType:@"bundle"];
        NSString * path = [NSString stringWithFormat:@"%@/QQEmotion/QQEmtion.plist",bundlePath];
        
        NSArray *emotionArr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *emotionModelArr = [NSMutableArray array];
        for (NSDictionary *dic in emotionArr) {
            XCEmotionModel *emotionModel = [[XCEmotionModel alloc] initWithDic:dic];
            emotionModel.xcemotionType = XCentionModelTypeQQ ; //设置为qq表情
            [emotionModelArr addObject:emotionModel];
        }
        _qqEmtions = (NSArray *)emotionModelArr;
    }
    return _qqEmtions;
}


@end