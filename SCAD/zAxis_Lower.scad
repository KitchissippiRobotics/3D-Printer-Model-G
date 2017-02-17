// *****************************************************************************
// ( )/ )(_  _)(_  _)___(  _ \(  _  )(  _ \(  _  )(_  _)(_  _)/ __)/ __)
//  )  (  _)(_   )( (___))   / )(_)(  ) _ < )(_)(   )(   _)(_( (__ \__ \
// (_)\_)(____) (__)    (_)\_)(_____)(____/(_____) (__) (____)\___)(___/
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Written by bcantin@kitchissippi-robotics.com
// Copyright (c) 2017 Kitchissippi Robotics
// *****************************************************************************

include <includes/Dimensions.scad>
include <vitamins/extrusion_profile.scad>

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Default Usage:
// Part_zAxis_Lower();
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if (MultiPartMode == undef) {
	MultiPartMode = false;
	EnableSupport = true;
	Part_zAxis_Lower();
	Vitamins_zAxis_Lower();
} else {
	EnableSupport = false;
}

// *****************************************************************************


// -----------------------------------------------------------------------------
module Vitamins_zAxis_Lower()
{
	// draw guide rod
	translate([- rpZAxis_RodSpacing / 2, 0 ,0])
	%cylinder(d = hwZAxis_GuideRod_Diameter, h = hwZAxis_GuideRod_Length, $fn = gcFacetMedium);

	// draw drive rod
	translate([rpZAxis_RodSpacing / 2, 0 ,0])
	%cylinder(d = hwZAxis_DriveRod_Diameter, h = hwZAxis_DriveRod_Length, $fn = gcFacetMedium);
}

// -----------------------------------------------------------------------------
module Part_zAxis_Lower()
{
	// draw motor mounting

  // draw frame mounts

  // draw rod mounting

	// profit?
}

module zAxis_motorMount() {

}
