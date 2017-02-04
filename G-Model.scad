// *****************************************************************************
// ( )/ )(_  _)(_  _)___(  _ \(  _  )(  _ \(  _  )(_  _)(_  _)/ __)/ __)
//  )  (  _)(_   )( (___))   / )(_)(  ) _ < )(_)(   )(   _)(_( (__ \__ \
// (_)\_)(____) (__)    (_)\_)(_____)(____/(_____) (__) (____)\___)(___/
// *****************************************************************************
// Written by bcantin@kitchissippi-robotics.com
// Copyright (c) 2017 Kitchissippi Robotics
// -----------------------------------------------------------------------------
// Master Mockup File for the Model G Printer
// *****************************************************************************

include <./include/Dimensions.scad>
include <./include/Dimensions.scad>

// Enable multipart mode - this disables built in support material and automatic
// rendering of the parts

MultiPartMode = true;
AssemblyMode = true;

// Colour Scheme for Parts

colourPLA= "Yellow";
colourABS = "Black";
colourHardware = "Silver";
