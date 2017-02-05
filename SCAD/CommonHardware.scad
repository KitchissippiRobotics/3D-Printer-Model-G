// *****************************************************************************
// ( )/ )(_  _)(_  _)___(  _ \(  _  )(  _ \(  _  )(_  _)(_  _)/ __)/ __)
//  )  (  _)(_   )( (___))   / )(_)(  ) _ < )(_)(   )(   _)(_( (__ \__ \
// (_)\_)(____) (__)    (_)\_)(_____)(____/(_____) (__) (____)\___)(___/
// *****************************************************************************
// Written by bcantin@kitchissippi-robotics.com
// Copyright (c) 2017 Kitchissippi Robotics
// -----------------------------------------------------------------------------
// Common Hardware
// *****************************************************************************

include <GlobalSettings.scad>

// Metric Bolt Hardware

// Vector Index Style Sizing for Bolts: [HeadDiameter, HeadHeight, ShaftDiameter]
iBolt_HeadDiameter 	= 0;
iBolt_HeadHeight 		= 1;
iBolt_ShaftDiameter = 2;

// M3 Bolts
// -----------------------------------------------------------------------------

hwM3_Bolt_ShaftDiameter = 3;

// Allen Key style head
hwM3_Bolt_AllenHeadDiameter = 5.4;
hwM3_Bolt_AllenHeadHeight 	= 2.8;

// Define Bolt Reference
hwM3_Bolt_AllenHeadSize 		= [	5.4,			// 0) HeadDiameter
																2.8,  		// 1) HeadHeight
																3 ]; 			// 2) ShaftDiameter


// M4 Bolts
// -----------------------------------------------------------------------------

hwM4_Bolt_ShaftDiameter = 4;

// Allen Key style head
hwM4_Bolt_AllenHeadDiameter = 6.8;
hwM4_Bolt_AllenHeadHeight 	= 4.3;

// Define Bolt Reference
hwM4_Bolt_AllenHeadSize 		= [	6.8,		// 0) HeadDiameter
																4.3, 			// 1) HeadHeight
																4 ]; 			// 2) ShaftDiameter

// Hex Wrench style head
hwM4_Bolt_HexHeadDiameter 	= 7.8;
hwM4_Bolt_HexHeadHeight 		= 2.8;


// *****************************************************************************
// Hardware Drawing For Reference
// *****************************************************************************


// -----------------------------------------------------------------------------
module Draw_hw_Bolt_AllenHead(_boltSize, _boltLength)
{
	% union() {
		// bolt shaft
		cylinder(h = _boltLength, d = _boltSize[iBolt_ShaftDiameter], $fn=gcFacetSmall, center = false);

		// bolt head - Allen Key type
		difference() {
			translate([0,0,_boltLength])
				cylinder(	h = _boltSize[iBolt_HeadHeight],
									d = _boltSize[iBolt_HeadDiameter],
									center = false,
									$fn=gcFacetSmall);

			translate([0,0,_boltLength  + 1])
				cylinder(	h = _boltSize[iBolt_HeadHeight],
									d = _boltSize[iBolt_HeadDiameter] / 2,
									center = false,
									$fn = gcFacetSmall);
		}
	}
}

// -----------------------------------------------------------------------------
module Carve_hw_Bolt_AllenHead(_boltSize, _boltLength, _headClearance = 0)
{
	// hole for bolt shaft
	cylinder(	h = _boltLength,
						d = _boltSize[iBolt_ShaftDiameter] + gcMachineOffset,
						center = false,
						$fn=gcFacetSmall);

  // hole for bolt head
  translate([0,0,_boltLength])
		cylinder(	h = 	_boltSize[iBolt_HeadHeight] + _headClearance,
							d = _boltSize[iBolt_HeadDiameter] + gcMachineOffset + gRender_Clearance,
							center = false,
							$fn=gcFacetSmall);
}

// HiWin Style Linear Rail Dimensions [LR]
// =============================================================================

// Linear Rail Diagram - Top View
//
//		   Length
//		*************						W
// 	----* 	o	o	*----------------		i
//		*			*	( )		( )			d
//  ----* 	o	o	*----------------		t
//		*************						h
//

// Related Carriage Bolt Dimensions - This is the interface for attaching things
// to the linear slide on the HiWin style rail system

hwLR_Carriage_BoltWidth = 15.0;			// see above reference diagram
hwLR_Carriage_BoltLength = 10.0;			// see above reference diagram
hwLR_Carriage_BoltDepth = 3.5;			// depth the bolt screws within the carriage
hwLR_Carriage_BoltDiameter = hwM3_Bolt_ShaftDiameter;

hwLR_Guide_BoltSpacing = 20;			// spacing between guide rail mounting holes
hwLR_Guide_BoltDiameter = hwM3_Bolt_ShaftDiameter;

// Frame Options

GCFrame_SquareNutProfile = 0;
GCFrame_TNutProfile = 1;
