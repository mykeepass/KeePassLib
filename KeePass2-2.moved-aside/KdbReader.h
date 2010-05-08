//
//  KdbReader.h
//  KeePass2
//
//  Created by Qiang Yu on 3/6/10.
//  Copyright 2010 Qiang Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kdb.h"
#import "WrapperNSData.h"

@protocol KdbReader<NSObject>
//load 
-(id<KdbTree>)load:(WrapperNSData *)input withPassword:(NSString *)password;
@end

@interface KdbReaderFactory:NSObject{
}

+(id<KdbReader>)newKdbReader:(WrapperNSData *)input;

@end

