// *****************************************************************************
// ( )/ )(_  _)(_  _)___(  _ \(  _  )(  _ \(  _  )(_  _)(_  _)/ __)/ __)
//  )  (  _)(_   )( (___))   / )(_)(  ) _ < )(_)(   )(   _)(_( (__ \__ \
// (_)\_)(____) (__)    (_)\_)(_____)(____/(_____) (__) (____)\___)(___/
// *****************************************************************************
// Written by bcantin@kitchissippi-robotics.com
// Copyright (c) 2017 Kitchissippi Robotics
// *****************************************************************************


include <Dimensions.scad>
include <vitamins/extrusion_profile.scad>


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Default Usage:
// Part_YFR_Rear();
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Determine if MultiPartMode is enabled - if not, render the part automatically
// and enable support material (if it is defined)

if (MultiPartMode == undef) {
	MultiPartMode = false;
	EnableSupport = true;

	Part_YFR_Rear();
	Vitamins_YFR();
} else {
	EnableSupport = false;
}


module Vitamins_YFR()
{
	translate([	0, -rpYFR_RailSpacing /2, 0 ])
	rotate([ 0, 90, 0 ])
		Vitamin_AluminumExtrusion(HW_FrameLength);

	translate([	0, rpYFR_RailSpacing /2,	0 ])
	rotate([ 0, 90, 0 ])
		Vitamin_AluminumExtrusion(HW_FrameLength);
}

module Part_YFR_Rear()
{
  // rpYFR_RailSpacing
}
