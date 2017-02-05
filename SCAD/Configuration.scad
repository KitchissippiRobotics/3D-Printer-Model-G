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


// Aluminum Extrusion Frame Options

HW_FrameStyle = GCFrame_TNutProfile;	// Square Nut Extrusion Profile
HW_FrameSize = 20;						// 20mm x 20mm square
HW_FrameLength = 500;					// Default Tube Length


// =============================================================================
// Global Settings - Edit These to tweak rendering and printability
// =============================================================================

gRender_Resolution = 1;		// resolution of curves 		- default = 1


gNozzle_Size = 0.5;			// nozzle size the parts will be printed on

// Offset of dimensions for creating the plastic printable parts - this allows
// for direct metric values within the design and automatic material compensation.
// This formula may be expanded upon and made more elaborate
// if necessary.

// Initial design uses 80% of the nozzle size to compensate for thickness of plastic bead
gcMachineOffset = gNozzle_Size * 0.80;


// Calculate the number of facets per curve for small, medium and large curves.

gcFacetSmall = 16 * gRender_Resolution;
gcFacetMedium = 32 * gRender_Resolution;
gcFacetLarge = 64 * gRender_Resolution;

$fn = gcFacetMedium;	// default?
