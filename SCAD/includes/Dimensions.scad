// *****************************************************************************
// ( )/ )(_  _)(_  _)___(  _ \(  _  )(  _ \(  _  )(_  _)(_  _)/ __)/ __)
//  )  (  _)(_   )( (___))   / )(_)(  ) _ < )(_)(   )(   _)(_( (__ \__ \
// (_)\_)(____) (__)    (_)\_)(_____)(____/(_____) (__) (____)\___)(___/
// *****************************************************************************
// Written by bcantin@kitchissippi-robotics.com
// Copyright (c) 2017 Kitchissippi Robotics
// *****************************************************************************

// Include common assembly hardware dimensions
include <Configuration.scad>

// this adjusts the spacing of Y Axis t-slot and rail assembly
// in an ideal world this can be adjusted at will, however currently there is code in
// YFR_Motor.scad and YFR_Common.scad which uses hard values based on 155mm spacing
 
rpYFR_RailSpacing = 155;  // center-to-center spacing of Y Axis rails

rpYFR_CapThickness = 2;
rpYFR_CapLength = 25;

rpYFR_PlateDepth = 10;
rpYFR_PlateThickness = 3;
rpYFR_PlateWall = 6;

rpYFR_EnableCarriageClearance = false;  // test for carriage

rpYFR_MotorPlateHeight = 45;
rpYFR_MotorPlateWidth = 60;
rpYFR_MotorPlateThickness = 2;
rpYFR_MotorPlateDepth = 23;
rpYFR_MotorPlateWall = 5;
rpYFR_MotorHoleDiameter = 26;

rpYFR_OutterBoltSpacing = 16;
rpYFR_BoltDepth = 5;

rpYFR_MotorHorizontalOffset = -57.5; // offset of motor and belt pulley from center line
rpYFR_MotorVerticalOffset = -21;
rpYFR_MotorInset = 42 + rpYFR_CapThickness + 2;

rpYFR_MotorMountThickness = 10;

hwLR_Rail_Width = 9;
hwLR_Rail_Height = 6.5;
hwLR_Rail_Length = 500;
