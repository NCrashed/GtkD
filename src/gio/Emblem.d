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


module gio.Emblem;

private import gio.Icon;
private import gio.IconIF;
private import gio.IconT;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtkc.gio;
public  import gtkc.giotypes;


/**
 * #GEmblem is an implementation of #GIcon that supports
 * having an emblem, which is an icon with additional properties.
 * It can than be added to a #GEmblemedIcon.
 * 
 * Currently, only metainformation about the emblem's origin is
 * supported. More may be added in the future.
 */
public class Emblem : ObjectG, IconIF
{
	/** the main Gtk struct */
	protected GEmblem* gEmblem;

	/** Get the main Gtk struct */
	public GEmblem* getEmblemStruct()
	{
		return gEmblem;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gEmblem;
	}

	protected override void setStruct(GObject* obj)
	{
		gEmblem = cast(GEmblem*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GEmblem* gEmblem, bool ownedRef = false)
	{
		this.gEmblem = gEmblem;
		super(cast(GObject*)gEmblem, ownedRef);
	}

	// add the Icon capabilities
	mixin IconT!(GEmblem);

	/**
	 */

	public static GType getType()
	{
		return g_emblem_get_type();
	}

	/**
	 * Creates a new emblem for @icon.
	 *
	 * Params:
	 *     icon = a GIcon containing the icon.
	 *
	 * Return: a new #GEmblem.
	 *
	 * Since: 2.18
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(IconIF icon)
	{
		auto p = g_emblem_new((icon is null) ? null : icon.getIconStruct());
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GEmblem*) p, true);
	}

	/**
	 * Creates a new emblem for @icon.
	 *
	 * Params:
	 *     icon = a GIcon containing the icon.
	 *     origin = a GEmblemOrigin enum defining the emblem's origin
	 *
	 * Return: a new #GEmblem.
	 *
	 * Since: 2.18
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(IconIF icon, GEmblemOrigin origin)
	{
		auto p = g_emblem_new_with_origin((icon is null) ? null : icon.getIconStruct(), origin);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_with_origin");
		}
		
		this(cast(GEmblem*) p, true);
	}

	/**
	 * Gives back the icon from @emblem.
	 *
	 * Return: a #GIcon. The returned object belongs to
	 *     the emblem and should not be modified or freed.
	 *
	 * Since: 2.18
	 */
	public IconIF getIcon()
	{
		auto p = g_emblem_get_icon(gEmblem);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Icon, IconIF)(cast(GIcon*) p);
	}

	/**
	 * Gets the origin of the emblem.
	 *
	 * Return: the origin of the emblem
	 *
	 * Since: 2.18
	 */
	public GEmblemOrigin getOrigin()
	{
		return g_emblem_get_origin(gEmblem);
	}
}
