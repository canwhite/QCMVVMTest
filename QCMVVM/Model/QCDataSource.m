//
//  QCDataSource.m
//  QCMVVM
//
//  Created by EricZhang on 2018/6/1.
//  Copyright © 2018年 BYX. All rights reserved.
//

#import "QCDataSource.h"

@implementation QCDataSource
-(void)getDataSuccess:(Success)success AndFailure:(Failure)failure{
    //请求下来的数组字典
    NSArray  *result =@[@{@"title":@"我是谁",
                          @"tag":@1,
                          },
                        @{@"title":@"我从哪来",
                          @"img":@2,
                          },
                        @{@"title":@"要到哪去",
                          @"img":@3,
                          }];
    
    if (result.count > 0) {
        //注意小写
        success(@{@"data":result});
        
    }else{
        failure(@{@"error":@"no data"});
        
    }
    
}
@end
