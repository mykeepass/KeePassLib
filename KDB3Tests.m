//
//  Kdb3Tests.m
//  KeePass2
//
//  Created by Qiang Yu on 2/13/10.
//  Copyright 2010 Qiang Yu. All rights reserved.
//

#import "KDB3Tests.h"
#import "Kdb3Reader.h"
#import "Kdb3Writer.h"
#import "KdbReaderFactory.h"

@interface KDB3Tests(PrivateMethods)
-(void)printGroup:(Kdb3Group *)group;
-(Kdb3Group *)newGroup:(NSString *)title;
-(Kdb3Entry *)newEntry:(NSString *)title;
-(void)addSubGroup:(id<KdbGroup>) group level:(uint8_t)level;
@end


@implementation KDB3Tests

-(void)testNewFile{
	/*Kdb3Writer * writer = [[Kdb3Writer alloc]init];
	[writer newFile:@"/Volumes/Users/qiang/Desktop/test.kdb" withPassword:@"test"];
	[writer release];

	WrapperNSData * source = [[WrapperNSData alloc]initWithContentsOfMappedFile:@"/Volumes/Users/qiang/Desktop/test.kdb"];
	Kdb3Reader * kdb = [KdbReaderFactory newKdbReader:source];

	id<KdbTree> tree = [kdb load:source withPassword:@"test"];	
	
	[self addSubGroup:[tree getRoot] level:0];
	
	writer = [[Kdb3Writer alloc]init];
	[writer persist:tree file:@"/Volumes/Users/qiang/Desktop/test.kdb" withPassword:@"test"];*/
}


-(void)addSubGroup:(id<KdbGroup>) group level:(uint8_t)level{
	static int k=0;
	static int m=0;
	if(level)
		for(int i=0; i<20; i++){
			[group addEntry:[self newEntry:[NSString stringWithFormat:@"entry %d:%d:%d", level,i, k++]]];
		}
	
	if(level==3) return;
	for(int i=0; i<5; i++){
		[group addSubGroup:[self newGroup:[NSString stringWithFormat:@"group %d:%d", level, m++]]];
	}
	
	for(id<KdbGroup> g in [group getSubGroups]){
		[self addSubGroup:g level:level+1];
	}
}


-(void) testNodeManipulation {
	Kdb3Group * root = [[Kdb3Group alloc]init];
	Kdb3Tree * tree = [[Kdb3Tree alloc]init];
	tree._root = root;
	root._title = @"$ROOT$";
	
	
	Kdb3Group * g1 = [self newGroup:@"g"];
	[root addSubGroup:g1];

	Kdb3Entry * e1 = [self newEntry:@"e"];
	[g1 addEntry:e1];
	
	/*
	Kdb3Group * g2 = [self newGroup:@"g2"];
	[root addSubGroup:g2];

	Kdb3Group * g3 = [self newGroup:@"g3"];
	[root addSubGroup:g3];

	Kdb3Group * g2_1 = [self newGroup:@"g2_1"];
	[g2 addSubGroup:g2_1];

	Kdb3Group * g2_2 = [self newGroup:@"g2_2"];
	[g2 addSubGroup:g2_2];

	Kdb3Group * g3_1 = [self newGroup:@"g3_1"];
	[g3 addSubGroup:g3_1];

	Kdb3Group * g2_1_1 = [self newGroup:@"g2_1_1"];
	[g2_1 addSubGroup:g2_1_1];

	Kdb3Group * g3_1_1 = [self newGroup:@"g3_1_1"];
	[g3_1 addSubGroup:g3_1_1];
	
	Kdb3Entry * e1 = [self newEntry:@"g1_e1"];
	[g1 addEntry:e1];

	Kdb3Entry * e2 = [self newEntry:@"g2_2_e1"];
	[g2_2 addEntry:e2];
	
	
	Kdb3Entry * e3 = [self newEntry:@"g2_2_e2"];
	[g2_2 addEntry:e3];

	Kdb3Entry * e4 = [self newEntry:@"g3_1_1_e1"];
	[g3_1_1 addEntry:e4];

	Kdb3Entry * e5 = [self newEntry:@"g3_1_e1"];
	[g3_1 addEntry:e5];

	Kdb3Entry * e6 = [self newEntry:@"g2_1_1_e1"];
	[g2_1_1 addEntry:e6];	
	
	//[self printGroup:[tree getRoot]];	
	
	[g1 deleteEntry:e1];
	[g2 deleteSubGroup:g2_2];
	[g2_2 breakCyclcReference];
	
	
	[self printGroup:[tree getRoot]];
	 */

	Kdb3Writer * writer = [[Kdb3Writer alloc]init];
	[writer persist:tree file:@"/Volumes/Users/qiang/Desktop/a.kdb" withPassword:@"a"];

}


- (void) testOpenFile {
	/*
	WrapperNSData * source = [[WrapperNSData alloc]initWithContentsOfMappedFile:@"/Volumes/Users/qiang/Desktop/a4.kdb"];
	Kdb3Reader * kdb = [KdbReaderFactory newKdbReader:source];
	Kdb3Writer * writer = [[Kdb3Writer alloc]init];
	id<KdbTree> tree = [kdb load:source withPassword:@"a4"];
	
	//[self printGroup:[tree getRoot]];
	
	[writer persist:tree file:@"/Volumes/Users/qiang/Desktop/a5.kdb" withPassword:@"a5"];
	
	[kdb release];
	[source release];
	[writer release];
	 */
}

 
-(Kdb3Group *)newGroup:(NSString *)title{
	Kdb3Group * g = [[Kdb3Group alloc]init];
	g._title = title;
	[g setExpiry:nil];
	[g setLastMod:[NSDate date]];
	[g setLastAccess:[NSDate date]];
	[g setCreation:[NSDate date]];	
	return g;
}

-(Kdb3Entry *)newEntry:(NSString *)title{
	Kdb3Entry * e = [[Kdb3Entry alloc]initWithNewUUID];
	e._title = title;
	e._password = [title stringByAppendingFormat:@":password"];
	e._url = [@"http://" stringByAppendingFormat:title];
	e._username = [title stringByAppendingFormat:@":username"];
	e._comment = [title stringByAppendingFormat:@":comment"];
	[e setExpiry:nil];
	[e setLastMod:[NSDate date]];
	[e setLastAccess:[NSDate date]];
	[e setCreation:[NSDate date]];		
	return e;
}


-(void)printGroup:(Kdb3Group *)group{
	if(!group) return;
	NSLog(@"%@", group);
	for(NSObject * o in group._entries){
		NSLog(@"%@", o);
	}
	NSLog(@"");NSLog(@"");
	for(NSObject * o in group._metaEntries){
		NSLog(@"%@", o);
	}
	NSLog(@"");NSLog(@"");
	for(Kdb3Group * o in group._subGroups){
		[self printGroup:o];
	}
}

@end
