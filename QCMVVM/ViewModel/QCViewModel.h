//
//  QCViewModel.h
//  QCMVVM
//
//  Created by EricZhang on 2018/6/1.
//  Copyright © 2018年 BYX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa/ReactiveCocoa.h"
#import "QCDataSource.h"

@interface QCViewModel : NSObject

@property(nonatomic,strong) RACSubject *successObject;
@property(nonatomic,strong) RACSubject *failureObject;
@property(nonatomic,strong) QCDataSource *dataSource;


-(void)exchangeData;

@end
