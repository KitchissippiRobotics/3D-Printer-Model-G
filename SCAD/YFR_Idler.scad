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
// Part_YFR_Idler();
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


// Determine if MultiPartMode is enabled - if not, render the part automatically
// and enable support material (if it is defined)

if (MultiPartMode == undef) {
	MultiPartMode = false;
	EnableSupport = true;
	Part_YFR_Idler();
	Vitamins_YFR_Idler();
} else {
	EnableSupport = false;
}

// *****************************************************************************


// -----------------------------------------------------------------------------
module Vitamins_YFR_Idler(_drawRails = false)
{
	rotate([ 0, -90, 0 ]) {
		if (_drawRails == true) {
			// t-slot
			translate([	rpYFR_CapThickness, -rpYFR_RailSpacing /2, 0 ])
			rotate([ 0, 90, 0 ])
			Vitamin_AluminumExtrusion(HW_FrameLength);

			// t-slot
			translate([	rpYFR_CapThickness, rpYFR_RailSpacing /2,	0 ])
			rotate([ 0, 90, 0 ])
			Vitamin_AluminumExtrusion(HW_FrameLength);

			// 9mm linear rail
			%translate([ hwLR_Rail_Length /2 + rpYFR_CapThickness, -rpYFR_RailSpacing /2, HW_FrameSize - hwLR_Rail_Height ])
			import("vitamins/hiwin9-rail.stl", convexity=3);

			// 9mm linear rail
			%translate([ hwLR_Rail_Length /2 + rpYFR_CapThickness, rpYFR_RailSpacing /2, HW_FrameSize - hwLR_Rail_Height ])
			import("vitamins/hiwin9-rail.stl", convexity=3);
		}
	}

	// frame holders
	translate([	0, -rpYFR_RailSpacing /2, 0 ])
	mirror([ 0, 1, 0 ])
	yfr_frameHolder_vitamins();

	translate([	0, rpYFR_RailSpacing /2, 0 ])
	mirror([ 0, 0, 0 ])
	yfr_frameHolder_vitamins();

}

// -----------------------------------------------------------------------------
module Part_YFR_Idler()
{
	difference() {

		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		// draw component

		union() {
		  // frame holders
			translate([	0, -rpYFR_RailSpacing / 2, 0 ])
			mirror([ 0, 1, 0 ])
			yfr_FrameHolder();

			translate([	0, rpYFR_RailSpacing / 2, 0 ])
			mirror([ 0, 0, 0 ])
			yfr_FrameHolder();

			// main backplate
		translate([ - (HW_FrameSize + gcBevelDiameter * 2) / 2, - ((rpYFR_RailSpacing / 2) - HW_FrameSize + gcBevelSize + rpYFR_PlateWall), 0 ])
			kr_bevel_box(	HW_FrameSize + gcBevelDiameter * 2,
										rpYFR_RailSpacing - HW_FrameSize - gcBevelDiameter ,
										rpYFR_PlateDepth);


		}

		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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

			// main backplate
			//translate([ 0, 29.5, rpYFR_PlateThickness])
			translate([ - (HW_FrameSize + gcBevelDiameter * 2) / 2 + rpYFR_PlateWall,
				 					-rpYFR_RailSpacing / 2 + HW_FrameSize /2 + gcBevelDiameter * 2,
									rpYFR_PlateThickness ])
			kr_bevel_box(	HW_FrameSize + gcBevelDiameter * 2 - (rpYFR_PlateWall + 5),
										rpYFR_RailSpacing - HW_FrameSize * 2 + gcBevelDiameter,
										rpYFR_PlateDepth);

		  // idler adjustment hole
			translate([ 0, 0, -1 ])
			Carve_hw_Bolt_AllenHead(HW_FrameBolt_Size, HW_FrameBolt_Length);

			// frame holders
			translate([	0, -rpYFR_RailSpacing / 2, 0 ])
			mirror([ 0, 1, 0 ])
			yfr_frameHolder_carve();

			translate([	0, rpYFR_RailSpacing / 2, 0 ])
			mirror([ 0, 0, 0 ])
			yfr_frameHolder_carve();

			// KillSwitch hole
			translate([ 0, - rpYFR_RailSpacing / 2 + rpYFR_KillSwitchInset, 0 ])
			cylinder( d = rpYFR_KillSwitchDiameter, h = rpYFR_PlateDepth);

		}

	}

	difference() {
		union() {
			// idler guide
			translate([ -rpYFR_IdlerGuideHeight / 2 - 2.5, -rpYFR_IdlerGuideWidth / 2 -1, 0 ])
			kr_bevel_box(rpYFR_IdlerGuideHeight + gcBevelSize + 2, rpYFR_IdlerGuideWidth + 2, rpYFR_IdlerGuideDepth + rpYFR_PlateThickness);

			translate([ 0, - rpYFR_RailSpacing / 2 + rpYFR_KillSwitchInset, 0 ])
			cylinder( d = rpYFR_KillSwitchDiameter + rpYFR_PlateWall, h = rpYFR_PlateThickness + gcBevelSize);
		}

		// idler guide
		translate([ -rpYFR_IdlerGuideHeight / 2, -rpYFR_IdlerGuideWidth / 2, rpYFR_PlateThickness ])
		cube([ rpYFR_IdlerGuideHeight, rpYFR_IdlerGuideWidth, rpYFR_IdlerGuideDepth ]);

		// bolt hole again
		translate([ 0, 0, -1 ])
		Carve_hw_Bolt_AllenHead(HW_FrameBolt_Size, HW_FrameBolt_Length);

		// kill switch hole again
		translate([ 0, - rpYFR_RailSpacing / 2 + rpYFR_KillSwitchInset, 0 ])
		cylinder( d = rpYFR_KillSwitchDiameter, h = rpYFR_PlateDepth);
	}

}

// -----------------------------------------------------------------------------
module yfr_motorMount()
{
	translate([ - rpYFR_MotorPlateWidth / 2 + 7.5 , -9.5, 0 ])
	kr_bevel_box(	rpYFR_MotorPlateHeight,
								5,
								21 + 4,
								rpYFR_PlateWall,
								rpYFR_PlateThickness);

	// motor mounting
	translate([  - rpYFR_MotorPlateWidth / 2 + 7.5, -9.5, 48 ])
	mirror([ 0, 0, 1 ])
	kr_bevel_box(	rpYFR_MotorPlateHeight,
								5,
								21 + 4,
								rpYFR_PlateWall,
								rpYFR_PlateThickness);
}

// *****************************************************************************
