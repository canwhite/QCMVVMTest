//
//  QCDataSource.h
//  QCMVVM
//
//  Created by EricZhang on 2018/6/1.
//  Copyright © 2018年 BYX. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 这个相当于Model，我们可以在Model里边完成数据的请求，然后在ViewModel中调用
 */

typedef void(^Success)(NSDictionary *dic);
typedef void(^Failure)(NSDictionary *dic);

@interface QCDataSource : NSObject

//获取数据，成功失败
-(void)getDataSuccess:(Success)success AndFailure:(Failure)failure;


@end
