//
//  KDB4Tests.m
//  KeePass2
//
//  Created by Qiang Yu on 1/1/10.
//  Copyright 2010 Qiang Yu. All rights reserved.
//

#import "KDB4Tests.h"
#import "Kdb4Reader.h"
#import "Kdb4Node.h"
#import "KdbReaderFactory.h"

@interface KDB4Tests (PrivateMethods)
-(void)printGroup:(Kdb4Group *)group;
@end


@implementation KDB4Tests

- (void) testOpenFile {
	WrapperNSData * source = [[WrapperNSData alloc]initWithContentsOfMappedFile:@"/Volumes/Users/qiang/Desktop/abcdefg.kdbx"];
	Kdb4Reader * kdb = [KdbReaderFactory newKdbReader:source];
	[kdb load:source withPassword:@"abcdefg"];
	//Kdb4Group * root = [kdb._tree getRoot];
	NSLog(@"RecycleBin UUID: %@", [kdb._tree getMetaInfo:@"RecycleBinUUID"]);
	//[self printGroup:root];
	//[kdb release];
}

-(void)printGroup:(Kdb4Group *)group{
	if(!group) return;
	NSLog(@"Group: %@", group);
	for(NSObject * o in group._entries){
		NSLog(@"Entry: %@", o);
	}
	NSLog(@"");NSLog(@"");
	for(Kdb4Group * o in group._subGroups){
		[self printGroup:o];
	}
}

@end
