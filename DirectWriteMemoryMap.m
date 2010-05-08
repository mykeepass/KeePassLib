//
//  WritableMemoryMap.m
//  KeePass2
//
//  Created by Qiang Yu on 1/9/10.
//  Copyright 2010 Qiang Yu. All rights reserved.
//

#import "DirectWriteMemoryMap.h"
#import <stdio.h>
#import <stdlib.h>
#import <sys/types.h>
#import <sys/stat.h>
#import <unistd.h>
#import <fcntl.h>
#import <sys/mman.h>

@implementation DirectWriteMemoryMap
-(id)initWithWritableNewFile:(NSString *)fileName size:(uint32_t)size{
	if(self=[super init]){
		_fd = open([fileName fileSystemRepresentation], O_RDWR|O_CREAT|O_TRUNC, (mode_t)0600);
		if(_fd==-1){
			@throw [NSException exceptionWithName:@"FileSystemException" reason:@"FileSystemException" userInfo:nil];
		}
		if(lseek(_fd, size-1, SEEK_SET)==-1||
		   write(_fd,"",1)!=1){
			@throw [NSException exceptionWithName:@"FileSystemException" reason:@"FileSystemException" userInfo:nil];
		}
		
		_size = size;
		_buffer = mmap(0, _size, PROT_READ|PROT_WRITE, MAP_SHARED, _fd, 0);
		
		if(_buffer == MAP_FAILED){
			close(_fd);
			@throw [NSException exceptionWithName:@"FileSystemException" reason:@"FileSystemException" userInfo:nil];	
		}
	}
	return self;
}

-(uint8_t *)getBufferToWrite{
	return _buffer;
}
@end
