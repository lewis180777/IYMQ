//
//  EGMGraphGuidelineManager.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphItemsManager.h"
#import "EGMGraphGuideRenderer.h"


@interface EGMGraphGuidelineManager : EGMGraphItemsManager

@property (nonatomic, strong) NSMutableArray *guides; //TODO immutable

- (void)addGuide:(EGMGraphGuideRenderer *)guideRenderer;

- (void)addOffset:(CGPoint)offset;

- (void)cleanup;

@end
