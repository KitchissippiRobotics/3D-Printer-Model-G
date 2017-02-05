// *****************************************************************************
// ( )/ )(_  _)(_  _)___(  _ \(  _  )(  _ \(  _  )(_  _)(_  _)/ __)/ __)
//  )  (  _)(_   )( (___))   / )(_)(  ) _ < )(_)(   )(   _)(_( (__ \__ \
// (_)\_)(____) (__)    (_)\_)(_____)(____/(_____) (__) (____)\___)(___/
// *****************************************************************************
// Written by bcantin@kitchissippi-robotics.com
// Copyright (c) 2017 Kitchissippi Robotics
// -----------------------------------------------------------------------------
// Master Configuration File for the Model G Printer
// *****************************************************************************

// Include common assembly hardware dimensions
// Note this requires the kitchissippi-robotics hardware library installed
include <CommonHardware.scad>

// Frame Options

GCFrame_SquareNutProfile = 0;
GCFrame_TNutProfile = 1;


// Aluminum Extrusion Frame Options

HW_FrameStyle = GCFrame_TNutProfile;	// Square Nut Extrusion Profile
HW_FrameSize = 20;						// 20mm x 20mm square
HW_FrameLength = 500;					// Default Tube Length

// HW_FrameBolt_ dimensions - M4x10mm Allen Head Generally
HW_FrameBolt_Size = hwM4_Bolt_AllenHeadSize;
HW_FrameBolt_Length = 10;
HW_FrameWasher_Size = 12;
HW_FrameWasher_Thickness = 0.9;

// Bevel Settings - default is 2
gcBevelSize = 2;
gcBevelInset = gcBevelSize / 2;
gcBevelDiameter = gcBevelSize * 2;
