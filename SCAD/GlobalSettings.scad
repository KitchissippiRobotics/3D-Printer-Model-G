// *****************************************************************************
// ( )/ )(_  _)(_  _)___(  _ \(  _  )(  _ \(  _  )(_  _)(_  _)/ __)/ __)
//  )  (  _)(_   )( (___))   / )(_)(  ) _ < )(_)(   )(   _)(_( (__ \__ \
// (_)\_)(____) (__)    (_)\_)(_____)(____/(_____) (__) (____)\___)(___/
// *****************************************************************************
// Written by bcantin@kitchissippi-robotics.com
// Copyright (c) 2017 Kitchissippi Robotics
// -----------------------------------------------------------------------------
// GlobalSettings.scad
//
// This file contains settings that affect how the functions will generate parts
// in both CommonHardware.scad as well as other parts within the project.
// *****************************************************************************

// Global Settings - Edit These
// =============================================================================

gRender_Resolution  = 1;		// resolution of curves 		- default = 1
gNozzle_Size        = 0.5;	// nozzle size the parts will be printed on

// Offset of dimensions for creating the plastic printable parts - this allows
// for direct metric values within the design and automatic material compensation.
// This formula may be expanded upon and made more elaborate
// if necessary.
// Initial design uses 75% of the nozzle size.

gcMachineOffset = gNozzle_Size * 0.8;

// Calculate the number of facets per curve for small, medium and large curves.

gcFacetSmall = 16 * gRender_Resolution;
gcFacetMedium = 32 * gRender_Resolution;
gcFacetLarge = 64 * gRender_Resolution;

$fn = gcFacetMedium;	// default?
