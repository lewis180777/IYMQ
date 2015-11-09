//
//  EGMGraphLabelManager.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphItemsManager.h"
#import "EGMGraphLabelRenderer.h"


@interface EGMGraphLabelManager : EGMGraphItemsManager

@property (nonatomic, strong) NSMutableArray *labels; //TODO immutable

- (void)addLabel:(EGMGraphLabelRenderer *)labelRenderer;

- (void)addOffset:(CGPoint)offset;

@end
