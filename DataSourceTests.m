//
//  DataSourceTests.m
//  KeePass2
//
//  Created by Qiang Yu on 2/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DataSourceTests.h"
#import "WrapperNSData.h"
#import "GZipInputData.h"

@implementation DataSourceTests

-(void) testWrappedNSData{ 
	/*
	WrapperNSData * data = [[WrapperNSData alloc] initWithContentsOfMappedFile:@"DataSourceTests.m"];
	uint8_t buffer[64];
	uint32_t read;
	do{
		read = [data readBytes:buffer length:64];
		NSLog(@"# of bytes read: %d", read);
	}while(read);
	*/
}

- (void) testGUnzip{
	/*
	uint32_t total = 0;
	WrapperNSData * data = [[WrapperNSData alloc] initWithContentsOfMappedFile:@"/Volumes/Users/qiang/Desktop/test.gz"];
	GZipInputData * gzip = [[GZipInputData alloc] initWithDataSource:data];
	
	uint8_t buffer[1024];
	uint32_t read;
	do{
		read = [gzip readBytes:buffer length:1024];
		total += read;
	}while(read);	

	NSLog(@"==># of bytes read: %d", total);
	*/
}


@end
