//
//  QCViewModel.m
//  QCMVVM
//
//  Created by EricZhang on 2018/6/1.
//  Copyright © 2018年 BYX. All rights reserved.
//

#import "QCViewModel.h"

@interface QCViewModel()

@property(nonatomic,strong) NSArray *bindArr;

@end

@implementation QCViewModel

-(instancetype)init{
    
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;

}

-(void)initialize{
    
    self.successObject = [RACSubject subject];
    self.failureObject = [RACSubject subject];
    self.dataSource = [QCDataSource new];
    
}


-(void)exchangeData{
    
    
    @weakify(self);
    [self.dataSource getDataSuccess:^(NSDictionary *dic) {
        
        @strongify(self);
        NSArray * arr = [dic valueForKey:@"data"];
        [self.successObject sendNext:arr];
        
        
    } AndFailure:^(NSDictionary *dic) {
        
        @strongify(self);
        NSString *str = [dic valueForKey:@"error"];
        if (str.length > 0) {
            [self.failureObject sendNext:str];
        }
    }];
    

}




@end
