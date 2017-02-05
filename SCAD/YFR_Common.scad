// *****************************************************************************
// ( )/ )(_  _)(_  _)___(  _ \(  _  )(  _ \(  _  )(_  _)(_  _)/ __)/ __)
//  )  (  _)(_   )( (___))   / )(_)(  ) _ < )(_)(   )(   _)(_( (__ \__ \
// (_)\_)(____) (__)    (_)\_)(_____)(____/(_____) (__) (____)\___)(___/
// *****************************************************************************
// Written by bcantin@kitchissippi-robotics.com
// Copyright (c) 2017 Kitchissippi Robotics
// *****************************************************************************

include <includes/Dimensions.scad>   // includes CommonHardware.scad & Configuration.scad

// -----------------------------------------------------------------------------
module yfr_FrameHolder()
{


  difference() {
  	yfr_frameHolder_draw();
    yfr_frameHolder_carve();

  }
  yfr_frameHolder_vitamins();
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
module yfr_frameHolder_draw()
{
  // pre calculate repeatedly used values

	capLength 		= rpYFR_CapLength - rpYFR_CapThickness - gcBevelSize;
	topOffset 		= HW_FrameSize /2 + hwLR_Rail_Height + rpYFR_CapThickness;
	bottomOffset 	= HW_FrameSize /2 + gcBevelDiameter;
	sideOffset 		= HW_FrameSize /2 + gcBevelDiameter;

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

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
module yfr_frameHolder_carve()
{
  outerBoltOffset = HW_FrameSize /2 + rpYFR_BoltDepth;
  boltCenter = ((rpYFR_CapLength - rpYFR_CapThickness) /2) + rpYFR_CapThickness;

  // one inside bolt
  translate([ 0, -outerBoltOffset, boltCenter ])
  rotate([ 90, 0, 180 ])
  Carve_hw_Bolt_AllenHead(HW_FrameBolt_Size, HW_FrameBolt_Length, 0, HW_FrameWasher_Size, HW_FrameWasher_Thickness);

  // two outside bolts
  translate([ 0, outerBoltOffset, boltCenter - (rpYFR_OutterBoltSpacing /2) ])
  rotate([ 90, 0, 0 ])
  Carve_hw_Bolt_AllenHead(HW_FrameBolt_Size, HW_FrameBolt_Length, 0, HW_FrameWasher_Size, HW_FrameWasher_Thickness);

  translate([ 0, outerBoltOffset, boltCenter + (rpYFR_OutterBoltSpacing /2) ])
  rotate([ 90, 0, 0 ])
  Carve_hw_Bolt_AllenHead(HW_FrameBolt_Size, HW_FrameBolt_Length, 0, HW_FrameWasher_Size, HW_FrameWasher_Thickness);

  // two bottom bolts
  translate([ outerBoltOffset, 0, boltCenter - (rpYFR_OutterBoltSpacing /2) ])
  rotate([ 90, 0, -90 ])
  Carve_hw_Bolt_AllenHead(HW_FrameBolt_Size, HW_FrameBolt_Length, 0, HW_FrameWasher_Size, HW_FrameWasher_Thickness);

  translate([ outerBoltOffset, 0, boltCenter + (rpYFR_OutterBoltSpacing /2) ])
  rotate([ 90, 0, -90 ])
  Carve_hw_Bolt_AllenHead(HW_FrameBolt_Size, HW_FrameBolt_Length, 0, HW_FrameWasher_Size, HW_FrameWasher_Thickness);

  // carriage clearance
  hull() {
    translate([ -12, 23, 12 ])
    rotate([ 90, 0, 0 ])
    cylinder( d = gcBevelDiameter, h = HW_FrameSize + 20);

    translate([ -12, 23, 10 + rpYFR_CapLength ])
    rotate([ 90, 0, 0 ])
    cylinder( d = gcBevelDiameter, h = HW_FrameSize + 20);

    translate([ -22, 23, 12 ])
    rotate([ 90, 0, 0 ])
    cylinder( d = gcBevelDiameter, h = HW_FrameSize + 20);

    translate([ -22, 23, 10 + rpYFR_CapLength ])
    rotate([ 90, 0, 0 ])
    cylinder( d = gcBevelDiameter, h = HW_FrameSize + 20);
  }

}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
module yfr_frameHolder_vitamins()
{
  outerBoltOffset = HW_FrameSize /2 + rpYFR_BoltDepth;
  boltCenter = ((rpYFR_CapLength - rpYFR_CapThickness) /2) + rpYFR_CapThickness;

  // one inside bolt
  %translate([ 0, -outerBoltOffset, boltCenter ])
  rotate([ 90, 0, 180 ])
  Draw_hw_Bolt_AllenHead(HW_FrameBolt_Size, HW_FrameBolt_Length, HW_FrameWasher_Size, HW_FrameWasher_Thickness);

  // two outside bolts
  %translate([ 0, outerBoltOffset, boltCenter - (rpYFR_OutterBoltSpacing /2) ])
  rotate([ 90, 0, 0 ])
  Draw_hw_Bolt_AllenHead(HW_FrameBolt_Size, HW_FrameBolt_Length, HW_FrameWasher_Size, HW_FrameWasher_Thickness);

  %translate([ 0, outerBoltOffset, boltCenter + (rpYFR_OutterBoltSpacing /2) ])
  rotate([ 90, 0, 0 ])
  Draw_hw_Bolt_AllenHead(HW_FrameBolt_Size, HW_FrameBolt_Length, HW_FrameWasher_Size, HW_FrameWasher_Thickness);

  // two bottom bolts
  %translate([ outerBoltOffset, 0, boltCenter - (rpYFR_OutterBoltSpacing /2) ])
  rotate([ 90, 0, -90 ])
  Draw_hw_Bolt_AllenHead(HW_FrameBolt_Size, HW_FrameBolt_Length, HW_FrameWasher_Size, HW_FrameWasher_Thickness);

  %translate([ outerBoltOffset, 0, boltCenter + (rpYFR_OutterBoltSpacing /2) ])
  rotate([ 90, 0, -90 ])
  Draw_hw_Bolt_AllenHead(HW_FrameBolt_Size, HW_FrameBolt_Length, HW_FrameWasher_Size, HW_FrameWasher_Thickness);
}


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
module kr_bevel_box(_x, _y, _z)
{
  // pre calculate repeatedly used values
  xOffset = _x /2;
  yOffset = _y /2;
	zLength 		= _z - gcBevelSize;

	hull() {
		translate([ -xOffset, - yOffset, gcBevelSize ])
		cylinder(	d = gcBevelDiameter,
							h = zLength,
							$fn = gcFacetSmall);

		translate([ -xOffset, yOffset, gcBevelSize ])
		cylinder(	d = gcBevelDiameter,
							h = zLength,
							$fn = gcFacetSmall);

		translate([ xOffset, -yOffset, gcBevelSize ])
		cylinder(	d = gcBevelDiameter,
							h = zLength,
							$fn = gcFacetSmall);

		translate([ xOffset, yOffset, gcBevelSize ])
		cylinder(	d = gcBevelDiameter,
							h = zLength,
							$fn = gcFacetSmall);

		// 2017 Style Parametric Bevels
		translate([ -xOffset + gcBevelInset, -yOffset + gcBevelInset, 0 ])
		cylinder(	d = gcBevelDiameter,
							h = gcBevelSize,
							$fn = gcFacetSmall);

		translate([ -xOffset + gcBevelInset, yOffset - gcBevelInset, 0 ])
		cylinder(	d = gcBevelDiameter,
							h = gcBevelSize,
							$fn = gcFacetSmall);

		translate([ xOffset - gcBevelInset, -yOffset + gcBevelInset, 0 ])
		cylinder(	d = gcBevelDiameter,
							h = gcBevelSize,
							$fn = gcFacetSmall);

		translate([ xOffset - gcBevelInset, yOffset - gcBevelInset, 0 ])
		cylinder(	d = gcBevelDiameter,
							h = gcBevelSize,
							$fn = gcFacetSmall);
	}
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
module kr_carved_bevel_box(_x, _y, _z, _inset, _thickness)
{
  difference() {
    kr_bevel_box(_x, _y, _z);

    translate([ 0, 0, _thickness ])
    kr_bevel_box(_x - _inset *2, _y - _inset *2, _z - _thickness + 0.1);
  }
}
