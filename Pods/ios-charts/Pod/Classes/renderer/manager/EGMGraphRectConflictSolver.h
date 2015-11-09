//
//  EGMGraphRectConflictSolver.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 02/12/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EGMGraphConflictSolver.h"

@interface EGMGraphRectConflictSolver : NSObject<EGMGraphConflictSolver>

- (void)solveConflictsForDataPointRenderers:(NSArray *)dataPointRenderers;

@end
