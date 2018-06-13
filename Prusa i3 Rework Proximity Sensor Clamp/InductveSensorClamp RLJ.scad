/********************************************************************
 * Author: Mekatrol
 * http://www.thingiverse.com/mekatrol
 *
 * Thanks to TECH2C:
 * http://www.thingiverse.com/Tech2C	
 * https://www.youtube.com/channel/UC_scf0U4iSELX22nC60WDSg
 *
 * NOTES:
 * 	1. All dimensions are in mm (millimetres).
 *  2. Hulls are used to form complex shapes. Change the hull keyword 
 *     to union to see the primitive shapes for debugging.
 *
 ********************************************************************/

// Made of of 3 sections:
// 1. The extruder clamp. 
//    This is the section that clamps to the 
//    Tech2C extruder mount (throat clamp).
//
// 2. Sensor mount.
//    This section containes the send platform and hole.
//
// 3. Connector section.
//    This section connects the extruder clamp
//    to the sensor mount (connects sections 1 & 2).

/*********************************************************
 * Global variables.
 *********************************************************/

// Increase this value to improve 'roundness' resoultion.
$fn = 50;

// Set the nominal diameter of the sensor body.
sensorDiameter = 18;

// The multiplier user to make sure extrude cuts
// go all the way through a solid.
extrudeCutFactor = 0.1;

// The diameters of the extruder throat.
smallThroatDiameter = 12;
largeThroatDiameter = 16;

// Clamp screw dimensions
clampScrewDiameter = 4;
clampScrewCenterOffset = 13;

// The cut depths for the large throat diameters.
topThroatCutDepth = 3.0;
bottomThroatCutDepth = 3.7;

// Width, height of the clamp section.
clampSectionWidth = 12;  // X size
clampSectionLength = 38; // Y size 
clampSectionHeight = 12; // Z size

// Length of angled section in the Y dimension.
clampAngleFaceLength = 5; // Y size

// Sensor mount sizes
sensorMountWidth = clampSectionHeight / 2; // X size
sensorMountLength = 25; // Y size
sensorMountHeight = 32.5; // Z size

// Sensor corner radiuses.
cornerMajorRadius = 12;
cornerMinorRadius = 6;		

// Offset of sensor hole from bottom of mount.
sensorHoleOffset = 20.5;

// The radius of major corners.
cornerRadius = 2;

// The connector section size
connectorSectionWidth = 35.5; // X size
connectorSectionLength = 12;  // Y size 
connectorSectionHeight = sensorMountWidth; // Z size

// Connector hole sizes
connectorHoleDiameter = 5;
connectorHoleOffset = 7.5;

// Size of bevel between sensor mount section and
// connector section.
bevelSize = 1;

/*********************************************************
 * Section construction.
 *********************************************************/

union()
{
	ExtruderClampSection();
	SensorMountSection();
	ConnectorSection();
}

module ExtruderClampSection()
{
	// Section body.	
	difference()
	{
		// Solid section
		hull()
		{
			// Rounded corner 1
			translate([
				-clampSectionWidth / 2 + cornerRadius, 
				 cornerRadius, 0]) 
			{	
				cylinder(
					r = cornerRadius, 
					h = clampSectionHeight);
			}
			
			// Rounded corner 2
			translate([
				+clampSectionWidth / 2 - cornerRadius, 
				 cornerRadius, 0]) 
			{
				cylinder(
					r = cornerRadius, 
					h = clampSectionHeight);
			}
			
			// Section body cube
			translate([
				-clampSectionWidth / 2, 
				cornerRadius, 0])
			{
				cube(size = [
					clampSectionWidth, 
					clampSectionLength - cornerRadius, 
					clampSectionHeight]);
			}

			// Section between clamp and connector section.
			translate([0, clampSectionLength, 0])
			{
				rotate([0, -90, 0])
				{
					// Angled face section to connector.
					linear_extrude(
						height = clampSectionWidth, 
						center = true)
					{
						polygon(points = [
							[0, 0],
							[clampSectionHeight, 0],
							[clampSectionHeight / 2, clampAngleFaceLength],
							[0,  clampAngleFaceLength]
						]);
					}
				}
			}
		}
		
		union()
		{
			// Clamp screw hole 1.
			translate([
				0, 
				clampSectionLength / 2 - clampScrewCenterOffset, 
				-extrudeCutFactor])
				{
					cylinder(
						d = clampScrewDiameter,
						h = clampSectionHeight + 2 * extrudeCutFactor);
			}
			
			// Clamp screw hole 2.
			translate([
				0, 
				clampSectionLength / 2 + clampScrewCenterOffset, 
				-extrudeCutFactor])
				{
					cylinder(
						d = clampScrewDiameter,
						h = clampSectionHeight + 2 * extrudeCutFactor);
			}

			// Small throat diameter hole.
			translate([
				0,
				clampSectionLength / 2,
				clampSectionHeight])
				{
					rotate([0, 90, 0])
					{
						cylinder(
							d = smallThroatDiameter,
							h = clampSectionWidth + 2 * extrudeCutFactor,
							center = true);
				}
			}
			
			// Large throat diameter top extrude cut.
			topExtrudeSize = topThroatCutDepth + 2 * extrudeCutFactor;
			translate([
				-clampSectionWidth / 2 - 
					(topExtrudeSize - topThroatCutDepth),
				clampSectionLength / 2,
				clampSectionHeight])
				{
					rotate([0, 90, 0])
					{
						cylinder(
							d = largeThroatDiameter,
							h = topExtrudeSize);
				}
			}

			// Large throat diameter bottom extrude cut.
			translate([
				clampSectionWidth / 2 - bottomThroatCutDepth, 
				clampSectionLength / 2, 
				clampSectionHeight])
				{
					rotate([0, 90, 0])
					{
						cylinder(
							d = largeThroatDiameter,
							h = bottomThroatCutDepth + 2 * extrudeCutFactor);
				}
			}
		}
	}
}

module SensorMountSection()
{
	difference()
	{	
		hull()
		{
			// Top large rounded corner 1
			translate([
				connectorSectionWidth - clampSectionWidth / 2, 
			
				clampSectionLength + 
					clampAngleFaceLength - 
					sensorMountLength / 2 + 
					connectorSectionLength / 2 +
					cornerMajorRadius, 
			
				sensorMountHeight - cornerMajorRadius])
			{
				rotate([0, 90, 0])
				{
					cylinder(
						r = cornerMajorRadius,
						h = sensorMountWidth);
				}
			}

			// Top large rounded corner 2
			translate([
				connectorSectionWidth - 
					clampSectionWidth / 2,
			
				clampSectionLength +
					clampAngleFaceLength -
					sensorMountLength / 2 +
					connectorSectionLength / 2 +
					sensorMountLength -
					cornerMajorRadius,
			
				sensorMountHeight - cornerMajorRadius])
			{
				rotate([0, 90, 0])
				{
					cylinder(
						r = cornerMajorRadius,
						h = sensorMountWidth);
				}
			}

			// Bottom small rounded corner 1
			translate([
				connectorSectionWidth - 
					clampSectionWidth / 2,
				
				clampSectionLength +
					clampAngleFaceLength -
					sensorMountLength / 2 +
					connectorSectionLength / 2 +
					cornerMinorRadius,
				
				cornerMinorRadius])
			{
				rotate([0, 90, 0])
				{
					cylinder(
						r = cornerMinorRadius,
						h = sensorMountWidth);
				}
			}

			// Bottom small rounded corner 2
			translate([
				connectorSectionWidth - clampSectionWidth / 2,
				clampSectionLength +
					clampAngleFaceLength -
					sensorMountLength / 2 +
					connectorSectionLength / 2 +
					sensorMountLength -
					cornerMinorRadius,
				cornerMinorRadius])
			{
				rotate([0, 90, 0])
				{
					cylinder(
						r = cornerMinorRadius,
						h = sensorMountWidth);
				}
			}
		}

		union()
		{
			// Sensor hole.
			translate([
				connectorSectionWidth -
				clampSectionWidth / 2 -
				+extrudeCutFactor,

				clampSectionLength + 
					clampAngleFaceLength - 
					sensorMountLength / 2 + 
					connectorSectionLength / 2 +
					sensorMountLength -
					sensorDiameter +5.5, 

				sensorHoleOffset])
			{
				rotate([0, 90, 0])
				{
					cylinder(
						d = sensorDiameter,
						h = sensorMountWidth + 2 * extrudeCutFactor);
				}
			}
		}
	}
}

module ConnectorSection()
{
	difference()
	{		
		union()
		{
			hull()
			{
				// Large cube area
				translate([
					0,
					clampSectionLength + clampAngleFaceLength,
					0])
				{
					cube(size = [
						connectorSectionWidth  - clampSectionWidth / 2,
						connectorSectionLength, 
						connectorSectionHeight]);
				}		

				// Small cube area
				translate([
					-clampSectionWidth / 2,
					clampSectionLength + clampAngleFaceLength,
					0])
				{
					cube(size = [
						clampSectionWidth / 2,
						connectorSectionLength / 2,
						connectorSectionHeight]);
				}

				// Rounded corner
				translate([
					-clampSectionWidth / 2 + cornerRadius,
					 clampSectionLength +
						clampAngleFaceLength +
						connectorSectionLength - cornerRadius,
					 0])
				{
					cylinder(
						r = cornerRadius, 
						h = connectorSectionHeight);
				}
			}
			
			// Bevel to sensor platform
			translate([
				connectorSectionWidth -
				clampSectionWidth / 2, 
			
				clampSectionLength +
					clampAngleFaceLength +
					connectorSectionLength / 2, 
			
				connectorSectionHeight])
			{
				rotate([90, -90, 0])
				{
					// Angled face section to connector.
					linear_extrude(
						height = connectorSectionLength, 
						center = true)
					{
						polygon(points = [
							[0, 0],
							[bevelSize, 0],
							[0, bevelSize]
						]);
					}
				}
			}
		}
		
		union()
		{
			// Connector hole 1.
			translate([
				0,
				clampSectionLength +
					clampAngleFaceLength +
					connectorSectionLength / 2,
				-extrudeCutFactor])
			{
				cylinder(
					d = connectorHoleDiameter,
					h = connectorSectionHeight +
						2 * extrudeCutFactor);
			}

			// Connector hole 2.
			translate([
				connectorHoleOffset,
				clampSectionLength +
					clampAngleFaceLength +
					connectorSectionLength / 2,
				-extrudeCutFactor])
			{
				cylinder(
					d = connectorHoleDiameter,
					h = connectorSectionHeight +
						2 * extrudeCutFactor);
			}

			// Connector hole 3.
			translate([
				connectorHoleOffset * 2,
				clampSectionLength +
					clampAngleFaceLength +
					connectorSectionLength / 2,
				-extrudeCutFactor])
			{
				cylinder(
					d = connectorHoleDiameter,
					h = connectorSectionHeight +
						2 * extrudeCutFactor);
			}

			// Connector hole 4.
			translate([
				connectorHoleOffset * 3,
				clampSectionLength + 
					clampAngleFaceLength +
					connectorSectionLength / 2,
				-extrudeCutFactor])
			{
				cylinder(
					d = connectorHoleDiameter,
					h = connectorSectionHeight +
						2 * extrudeCutFactor);
			}
		}
	}
}