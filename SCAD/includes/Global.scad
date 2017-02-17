// *****************************************************************************
// ( )/ )(_  _)(_  _)___(  _ \(  _  )(  _ \(  _  )(_  _)(_  _)/ __)/ __)
//  )  (  _)(_   )( (___))   / )(_)(  ) _ < )(_)(   )(   _)(_( (__ \__ \
// (_)\_)(____) (__)    (_)\_)(_____)(____/(_____) (__) (____)\___)(___/
// *****************************************************************************
// Written by bcantin@kitchissippi-robotics.com
// Copyright (c) 2017 Kitchissippi Robotics
// *****************************************************************************

// =============================================================================
// Render resolution
//
// Determines the number of facets used for curved surfaces
// This can be adjusted to produce lower resolution draft/development models
// or high resolution production-ready models
// -----------------------------------------------------------------------------

// resolution of curves - draft quality <= 1 ... print quality >= 2
gRender_Resolution = 0.5;

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Reference Values
// use $fn = gcFacetXXXXX below for small, medium and large curves respectively
// this will allow the object design to parametically compensate relatively
// -----------------------------------------------------------------------------

// Calculate the number of facets per curve for small, medium and large curves.
gcFacetSmall    = 16 * gRender_Resolution;
gcFacetMedium   = 32 * gRender_Resolution;
gcFacetLarge    = 64 * gRender_Resolution;

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Set the default value
// -----------------------------------------------------------------------------

$fn = gcFacetSmall;	// using small to keep unspecified values low-res

// =============================================================================
// Material compensation
//
// Extruded plastic has a margin of error, particularily when it comes to internal
// holes within parts. It helps to adjust the raw metrics slightly in the model.
// This formula may be expanded upon and made more elaborate
// if necessary, but so far it is working as expected.
// -----------------------------------------------------------------------------

// nozzle size the parts will be optimized for
gNozzle_Size = 0.5;

// 80% of the nozzle size to compensate for thickness of plastic bead in my experience
// based on a 0.5 nozzle with 1.75mm filament and a tuned extruder
gcMachineOffset = gNozzle_Size * 0.80;

// the above value could also be manually set to a hard constant by commenting it
// and uncommenting the line below:
//gcMachineOffset = 0.4;
