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

// =============================================================================

// Global Settings - Edit These to tweak rendering and printability
// =============================================================================

gRender_Resolution = 1;		// resolution of curves 		- default = 1
gRender_Clearance = 0.2;	// mm of clearance around bolts - default = 0.2

gNozzle_Size = 0.5;			// nozzle size the parts will be printed on



// Global Calculations - Do NOT Edit These
// =============================================================================
// These variables are calculated based on the global settings before them.
// The math is being tested as well as possible to get the compensation values to
// be correct for a reasonably well tuned home 3D printer.
// It is not recommended for novice users to modify these formulas.
// Beware, there be dragons.
// -----------------------------------------------------------------------------

// Offset of dimensions for creating the plastic printable parts - this allows
// for direct metric values within the design and automatic material compensation.
// This formula may be expanded upon and made more elaborate
// if necessary.
// Initial design uses 75% of the nozzle size.

gcMachineOffset = gNozzle_Size * 0.75;

// Calculate the number of facets per curve for small, medium and large curves.

gcFacetSmall = 16 * gRender_Resolution;
gcFacetMedium = 32 * gRender_Resolution;
gcFacetLarge = 64 * gRender_Resolution;

$fn = gcFacetMedium;	// default?
