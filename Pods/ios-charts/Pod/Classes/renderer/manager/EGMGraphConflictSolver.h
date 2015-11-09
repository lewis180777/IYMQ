//
//  EGMGraphConflictSolver.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 02/12/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

@protocol EGMGraphConflictSolver

// Solves renderer conflicts (overlapping) by changing their screen position
// Note that this modifies the passed list via reference
// This doesn't change model data
- (void)solveConflictsForDataPointRenderers:(NSArray *)dataPointRenderers;

@end