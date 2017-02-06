// *****************************************************************************
// ( )/ )(_  _)(_  _)___(  _ \(  _  )(  _ \(  _  )(_  _)(_  _)/ __)/ __)
//  )  (  _)(_   )( (___))   / )(_)(  ) _ < )(_)(   )(   _)(_( (__ \__ \
// (_)\_)(____) (__)    (_)\_)(_____)(____/(_____) (__) (____)\___)(___/
// *****************************************************************************
// Written by bcantin@kitchissippi-robotics.com
// Copyright (c) 2017 Kitchissippi Robotics
// *****************************************************************************

include <includes/Dimensions.scad>
include <vitamins/extrusion_profile.scad>
include <YFR_Common.scad>


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

	%translate([ rpYFR_MotorInset, rpYFR_MotorHorizontalOffset, rpYFR_MotorVerticalOffset ])
	rotate([ 0, 0, 90 ])
	import("vitamins/y-axis-motor.stl", convexity=3);
}

// -----------------------------------------------------------------------------
module Part_YFR_Rear()
{
	difference() {
		// draw component
		union() {
		  // frame holders
			translate([	0, -rpYFR_RailSpacing /2, 0 ])
			mirror([ 0, 1, 0 ])
			yfr_FrameHolder();

			translate([	0, rpYFR_RailSpacing /2, 0 ])
			mirror([ 0, 0, 0 ])
			yfr_FrameHolder();

			// main backplate
			translate([ 0, 0, 0 ])
			kr_carved_bevel_box(	HW_FrameSize + gcBevelDiameter * 2,
														rpYFR_RailSpacing - HW_FrameSize - gcBevelDiameter -2,
														rpYFR_PlateDepth,
														rpYFR_PlateWall,
														rpYFR_PlateThickness);

			// motor backplate
			translate([ 0, -34.5, 0 ])
			kr_bevel_box(	rpYFR_MotorPlateHeight,
										rpYFR_MotorPlateWidth,
										rpYFR_MotorPlateThickness);

			yfr_motorMount();
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

			// motor backplate
			translate([ 0, -37.75, rpYFR_PlateThickness / 2 ])
			kr_bevel_box(	rpYFR_MotorPlateHeight - rpYFR_PlateWall,
										rpYFR_MotorPlateWidth - rpYFR_PlateWall -6.5,
										rpYFR_MotorPlateThickness);

			// motor main hole
			translate([ 0, 0, 25])
			rotate([ 90, 0, 0 ])
			cylinder ( d = rpYFR_MotorHoleDiameter, h = 20, $fn=gcFacetLarge);


			// belt clearance path
			hull() {
				translate([ 0, -2, 25])
				rotate([ 90, 0, 0 ])
				cylinder ( d1 = rpYFR_MotorHoleDiameter , d2 = rpYFR_MotorHoleDiameter - 8, h = 4, $fn=gcFacetLarge);

				translate([ 0, -2, 75])
				rotate([ 90, 0, 0 ])
				cylinder ( d1 = rpYFR_MotorHoleDiameter + 8, d2 = rpYFR_MotorHoleDiameter - 8, h = 4, $fn=gcFacetLarge );
			}

			// motor mounting bolts
			translate([ 15.5, -5, 25 - 15.5 ])
			rotate([ 90, 0, 0 ])
			Carve_hw_Bolt_AllenHead(hwM3_Bolt_AllenHeadSize, 10, 30);

			translate([ -15.5, -5, 25 - 15.5 ])
			rotate([ 90, 0, 0 ])
			Carve_hw_Bolt_AllenHead(hwM3_Bolt_AllenHeadSize, 10, 30);

			translate([ 15.5, -5, 25 + 15.5 ])
			rotate([ 90, 0, 0 ])
			Carve_hw_Bolt_AllenHead(hwM3_Bolt_AllenHeadSize, 10, 30);

			translate([ -15.5, -5, 25 + 15.5 ])
			rotate([ 90, 0, 0 ])
			Carve_hw_Bolt_AllenHead(hwM3_Bolt_AllenHeadSize, 10, 30);

			translate([ -15.5, 28, 25 - 15.5 ])
			sphere(d = 5.75, $fn=gcFacetSmall);

			translate([ 15.5, 28, 25 - 15.5 ])
			sphere(d = 5.75, $fn=gcFacetSmall);

			// vent holes
			hull() {
				translate([ -16, -15, -1 ])
				rotate([ 0, 10, 0 ])
				cylinder( d = 2, h = 10, $fn=gcFacetSmall);

				translate([ -16, -55, -1 ])
				rotate([ 0, 10, 0 ])
				cylinder( d = 2, h = 10, $fn=gcFacetSmall);
			}

			hull() {
				translate([ -8, -15, -1 ])
				rotate([ 0, 5, 0 ])
				cylinder( d = 3, h = 10, $fn=gcFacetSmall);

				translate([ -8, -55, -1 ])
				rotate([ 0, 5, 0 ])
				cylinder( d = 3, h = 10, $fn=gcFacetSmall);
			}

			hull() {
				translate([ 0, -15, -1 ])
				rotate([ 0, 0, 0 ])
				cylinder( d = 4, h = 10, $fn=gcFacetSmall);

				translate([ 0, -55, -1 ])
				rotate([ 0, -15, 0 ])
				cylinder( d = 4, h = 10, $fn=gcFacetSmall);
			}

			hull() {
				translate([ 8, -15, -1 ])
				rotate([ 0, -5, 0 ])
				cylinder( d = 3, h = 10, $fn=gcFacetSmall);

				translate([ 8, -55, -1 ])
				rotate([ 0, -5, 0 ])
				cylinder( d = 3, h = 10, $fn=gcFacetSmall);
			}


			hull() {
				translate([ 16, -15, -1 ])
				rotate([ 0, -10, 0 ])
				cylinder( d = 2, h = 10, $fn=gcFacetSmall);

				translate([ 16, -55, -1 ])
				rotate([ 0, -10, 0 ])
				cylinder( d = 2, h = 10, $fn=gcFacetSmall);
			}

		}

	}




}

module yfr_motorMount()
{
	translate([ 0, -7, 0 ])
	kr_bevel_box(	rpYFR_MotorPlateHeight,
								5,
								21 + 4,
								rpYFR_PlateWall,
								rpYFR_PlateThickness);

	// motor mounting
	translate([ 0, -7, 48 ])
	mirror([ 0, 0, 1 ])
	kr_bevel_box(	rpYFR_MotorPlateHeight,
								5,
								21 + 4,
								rpYFR_PlateWall,
								rpYFR_PlateThickness);
}

// *****************************************************************************
