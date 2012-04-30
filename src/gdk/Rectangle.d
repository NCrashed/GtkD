/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */
 
// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage

/*
 * Conversion parameters:
 * inFile  = gdk3-Points-Rectangles-and-Regions.html
 * outPack = gdk
 * outFile = Rectangle
 * strct   = 
 * realStrct=
 * ctorStrct=
 * clss    = 
 * interf  = 
 * class Code: No
 * interface Code: No
 * template for:
 * extend  = 
 * implements:
 * prefixes:
 * 	- gdk_rectangle_
 * omit structs:
 * omit prefixes:
 * omit code:
 * omit signals:
 * imports:
 * structWrap:
 * module aliases:
 * local aliases:
 * overrides:
 */

module gdk.Rectangle;

public  import gtkc.gdktypes;

private import gtkc.gdk;
private import glib.ConstructionException;






/**
 */

/**
 * Calculates the intersection of two rectangles. It is allowed for
 * dest to be the same as either src1 or src2. If the rectangles
 * do not intersect, dest's width and height is set to 0 and its x
 * and y values are undefined. If you are only interested in whether
 * the rectangles intersect, but not in the intersecting area itself,
 * pass NULL for dest.
 * Params:
 * src1 = a GdkRectangle
 * src2 = a GdkRectangle
 * dest = return location for the
 * intersection of src1 and src2, or NULL. [out caller-allocates][allow-none]
 * Returns: TRUE if the rectangles intersect.
 */
public static int intersect(ref Rectangle src1, ref Rectangle src2, out Rectangle dest)
{
	// gboolean gdk_rectangle_intersect (const GdkRectangle *src1,  const GdkRectangle *src2,  GdkRectangle *dest);
	return gdk_rectangle_intersect(&src1, &src2, &dest);
}

/**
 * Calculates the union of two rectangles.
 * The union of rectangles src1 and src2 is the smallest rectangle which
 * includes both src1 and src2 within it.
 * It is allowed for dest to be the same as either src1 or src2.
 * Params:
 * src1 = a GdkRectangle
 * src2 = a GdkRectangle
 * dest = return location for the union of src1 and src2. [out]
 */
public static void unio(ref Rectangle src1, ref Rectangle src2, out Rectangle dest)
{
	// void gdk_rectangle_union (const GdkRectangle *src1,  const GdkRectangle *src2,  GdkRectangle *dest);
	gdk_rectangle_union(&src1, &src2, &dest);
}

