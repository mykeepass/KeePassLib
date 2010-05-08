//
//  WritableMemoryMap.h
//  KeePass2
//
//  Created by Qiang Yu on 1/9/10.
//  Copyright 2010 Qiang Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemoryMap.h"

@interface DirectWriteMemoryMap : MemoryMap{
}

-(id)initWithWritableNewFile:(NSString *)fileName size:(uint32_t)size;
-(uint8_t *)getBufferToWrite;

@end
