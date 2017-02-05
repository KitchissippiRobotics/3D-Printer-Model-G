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

	rotate([ 0, 90, 0 ])
	Part_YFR_Rear();
	Vitamins_YFR();
} else {
	EnableSupport = false;
}

// *****************************************************************************


// -----------------------------------------------------------------------------
module Vitamins_YFR()
{
	translate([	3, -rpYFR_RailSpacing /2, 0 ])
	rotate([ 0, 90, 0 ])
	Vitamin_AluminumExtrusion(HW_FrameLength);

	translate([	3, rpYFR_RailSpacing /2,	0 ])
	rotate([ 0, 90, 0 ])
	Vitamin_AluminumExtrusion(HW_FrameLength);
}

// -----------------------------------------------------------------------------
module Part_YFR_Rear()
{
	difference() {
		// draw component
		union() {
		  // frame holders
			translate([	0, -rpYFR_RailSpacing /2, 0 ])
			yfr_FrameHolder();

			translate([	0, rpYFR_RailSpacing /2, 0 ])
			yfr_FrameHolder();
		}

		// carve out hardware spaces
		union() {

			translate([	-((HW_FrameSize + gcMachineOffset) /2),
			 						-(rpYFR_RailSpacing /2) - ((HW_FrameSize + gcMachineOffset) /2),
									3])
			cube([HW_FrameSize + gcMachineOffset, HW_FrameSize + gcMachineOffset, HW_FrameLength]);

			translate([	-((HW_FrameSize + gcMachineOffset) /2),
									(rpYFR_RailSpacing /2) - ((HW_FrameSize + gcMachineOffset) /2),
									3])
			cube([HW_FrameSize + gcMachineOffset, HW_FrameSize + gcMachineOffset, HW_FrameLength]);
		}

	}
}

// *****************************************************************************

// -----------------------------------------------------------------------------
module yfr_FrameHolder()
{
	hull() {
		translate([ -HW_FrameSize /2, -HW_FrameSize /2, 2 ])
		cylinder(	d = 4,
							h = HW_FrameSize + 8,
							$fn = gcFacetSmall);

		translate([ -HW_FrameSize /2, HW_FrameSize /2, 2 ])
		cylinder(	d = 4,
							h = HW_FrameSize + 8,
							$fn = gcFacetSmall);

		translate([ HW_FrameSize /2, -HW_FrameSize /2, 2 ])
		cylinder(	d = 4,
							h = HW_FrameSize + 8,
							$fn = gcFacetSmall);

		translate([ HW_FrameSize /2, HW_FrameSize /2, 2 ])
		cylinder(	d = 4,
							h = HW_FrameSize + 8,
							$fn = gcFacetSmall);

		// 2016 Style Bevels
		translate([ -HW_FrameSize /2 + 1, -HW_FrameSize /2 + 1, 0 ])
		cylinder(	d = 4,
							h = 2,
							$fn = gcFacetSmall);

		translate([ -HW_FrameSize /2 + 1, HW_FrameSize /2 - 1, 0 ])
		cylinder(	d = 4,
							h = 2,
							$fn = gcFacetSmall);

		translate([ HW_FrameSize /2 - 1, -HW_FrameSize /2 + 1, 0 ])
		cylinder(	d = 4,
							h = HW_FrameSize + 8,
							$fn = gcFacetSmall);

		translate([ HW_FrameSize /2 - 1, HW_FrameSize /2 - 1, 0 ])
		cylinder(	d = 4,
							h = 2,
							$fn = gcFacetSmall);
	}
}
