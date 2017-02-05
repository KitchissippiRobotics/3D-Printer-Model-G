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

	//rotate([ 0, 90, 0 ])
	Part_YFR_Rear();

	rotate([ 0, -90, 0 ])
	Vitamins_YFR();
} else {
	EnableSupport = false;
}

// *****************************************************************************


// -----------------------------------------------------------------------------
module Vitamins_YFR()
{
	translate([	rpYFR_CapThickness, -rpYFR_RailSpacing /2, 0 ])
	rotate([ 0, 90, 0 ])
	Vitamin_AluminumExtrusion(HW_FrameLength);

	translate([	rpYFR_CapThickness, rpYFR_RailSpacing /2,	0 ])
	rotate([ 0, 90, 0 ])
	Vitamin_AluminumExtrusion(HW_FrameLength);

	%translate([ hwLR_Rail_Length /2 + rpYFR_CapThickness, -rpYFR_RailSpacing /2, HW_FrameSize - hwLR_Rail_Height ])
	import("vitamins/hiwin9-rail.stl", convexity=3);

	%translate([ hwLR_Rail_Length /2 + rpYFR_CapThickness, rpYFR_RailSpacing /2, HW_FrameSize - hwLR_Rail_Height ])
	import("vitamins/hiwin9-rail.stl", convexity=3);
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

			// extrusion frame
			translate([	-((HW_FrameSize + gcMachineOffset) /2),
			 						-(rpYFR_RailSpacing /2) - ((HW_FrameSize + gcMachineOffset) /2),
									rpYFR_CapThickness])
			cube([	HW_FrameSize + gcMachineOffset,
							HW_FrameSize + gcMachineOffset,
							HW_FrameLength]);

		  // hiwin rail
			translate([	-((HW_FrameSize + gcMachineOffset) /2) - hwLR_Rail_Height -gcMachineOffset ,
			 						-(rpYFR_RailSpacing /2) - (hwLR_Rail_Width /2) - (gcMachineOffset /2),
									rpYFR_CapThickness])
			cube([	hwLR_Rail_Height + gcMachineOffset,
							hwLR_Rail_Width + gcMachineOffset,
							hwLR_Rail_Length]);

			// extrusion frame
			translate([	-((HW_FrameSize + gcMachineOffset) /2),
									(rpYFR_RailSpacing /2) - ((HW_FrameSize + gcMachineOffset) /2),
									rpYFR_CapThickness])
			cube([HW_FrameSize + gcMachineOffset, HW_FrameSize + gcMachineOffset, HW_FrameLength]);

			// hiwin rail
			translate([	-((HW_FrameSize + gcMachineOffset) /2) - hwLR_Rail_Height -gcMachineOffset ,
									(rpYFR_RailSpacing /2) - (hwLR_Rail_Width /2) - (gcMachineOffset /2),
									rpYFR_CapThickness])
			cube([	hwLR_Rail_Height + gcMachineOffset,
							hwLR_Rail_Width + gcMachineOffset,
							hwLR_Rail_Length]);
		}

	}
}

// *****************************************************************************

// -----------------------------------------------------------------------------
module yfr_FrameHolder()
{
	// pre calculate repeatedly used values

	capLength 		= rpYFR_CapLength - rpYFR_CapThickness - gcBevelSize;
	topOffset 		= HW_FrameSize /2 + hwLR_Rail_Height + rpYFR_CapThickness;
	bottomOffset 	= HW_FrameSize /2 + rpYFR_CapThickness;
	sideOffset 		= HW_FrameSize /2 + rpYFR_CapThickness;

	hull() {
		translate([ -topOffset, -sideOffset, gcBevelSize ])
		cylinder(	d = gcBevelDiameter,
							h = capLength,
							$fn = gcFacetSmall);

		translate([ -topOffset, sideOffset, gcBevelSize ])
		cylinder(	d = gcBevelDiameter,
							h = capLength,
							$fn = gcFacetSmall);

		translate([ bottomOffset, -sideOffset, gcBevelSize ])
		cylinder(	d = gcBevelDiameter,
							h = capLength,
							$fn = gcFacetSmall);

		translate([ bottomOffset, sideOffset, gcBevelSize ])
		cylinder(	d = gcBevelDiameter,
							h = capLength,
							$fn = gcFacetSmall);

		// 2017 Style Parametric Bevels
		translate([ -topOffset + gcBevelInset, -sideOffset + gcBevelInset, 0 ])
		cylinder(	d = gcBevelDiameter,
							h = gcBevelSize,
							$fn = gcFacetSmall);

		translate([ -topOffset + gcBevelInset, sideOffset - gcBevelInset, 0 ])
		cylinder(	d = gcBevelDiameter,
							h = gcBevelSize,
							$fn = gcFacetSmall);

		translate([ bottomOffset - gcBevelInset, -sideOffset + gcBevelInset, 0 ])
		cylinder(	d = gcBevelDiameter,
							h = gcBevelSize,
							$fn = gcFacetSmall);

		translate([ bottomOffset - gcBevelInset, sideOffset - gcBevelInset, 0 ])
		cylinder(	d = gcBevelDiameter,
							h = gcBevelSize,
							$fn = gcFacetSmall);
	}
}
