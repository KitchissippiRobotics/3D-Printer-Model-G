#!/bin/bash

# usage: ./make_component.sh {component name}
# script assumes it is in {project root}/SCAD/scripts/

# *****************************************************************************
# variables

pkg_version = "0.0.1";
prg_version = "0.0.1";

echo $1;

# *****************************************************************************
# functions

# -----------------------------------------------------------------------------
function Print_Logo
{
  echo    " _   ___ _         ______      _           _   _ ";
  echo    "| | / (_) |        | ___ \    | |         | | (_)";
  echo    "| |/ / _| |_ ______| |_/ /___ | |__   ___ | |_ _  ___ ___";
  echo    "|    \| | __|______|    // _ \| '_ \ / _ \| __| |/ __/ __|";
  echo    "| |\  \ | |_       | |\ \ (_) | |_) | (_) | |_| | (__\__ \\";
  echo    "\\_| \\_/_|\\__|      \\_| \\_\\___/|_.__/ \\___/ \\__|_|\\___|___/";
}

# -------------------------------------------------------------------------------------------------
function Print_Header
{

  echo "______________________________________________________________________________";
  Print_Logo;
  echo "                             www.kitchissippi-robotics.com";
  echo "______________________________________________________________________________";
  echo "";
  echo "Welcome to the Kitchissippi-Robotics Interactive OpenSCAD Component Generator";
  echo "More documentation is within the TODO hopper. Just follow the prompts!";
  echo "------------------------------------------------------------------------------";

}

# *****************************************************************************
# main


Print_Header;
echo "Package Version: $pkg_version";
echo "Program Version: $prg_version";
