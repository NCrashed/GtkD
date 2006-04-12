/*
 * This file is part of duit.
 *
 * duit is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * duit is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with duit; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage

/*
 * Conversion parameters:
 * outPack = gtk
 * outFile = CellLayoutT
 * strct   = GtkCellLayout
 * realStrct=
 * clss    = CellLayoutT
 * interf  = 
 * class Code: No
 * interface Code: No
 * template for:
 * 	- TStruct
 * extend  = 
 * implements:
 * prefixes:
 * 	- gtk_cell_layout_
 * 	- gtk_
 * omit structs:
 * omit prefixes:
 * omit code:
 * imports:
 * 	- glib.Str
 * 	- gtk.CellRenderer
 * 	- glib.Str
 * structWrap:
 * 	- GtkCellRenderer* -> CellRenderer
 * local aliases:
 */

module gtk.CellLayoutT;

private import gtk.typedefs;

private import lib.gtk;

private import glib.Str;
private import gtk.CellRenderer;
private import glib.Str;

/**
 * Description
 * GtkCellLayout is an interface to be implemented by all objects which
 * want to provide a GtkTreeViewColumn-like API for packing cells, setting
 * attributes and data funcs.
 */
public template CellLayoutT(TStruct)
{
	
	/** the main Gtk struct */
	protected GtkCellLayout* gtkCellLayout;
	
	
	public GtkCellLayout* getCellLayoutTStruct()
	{
		return cast(GtkCellLayout*)getStruct();
	}
	
	
	/**
	 */
	
	
	
	
	/**
	 * Packs the cell into the beginning of cell_layout. If expand is FALSE,
	 * then the cell is allocated no more space than it needs. Any unused space
	 * is divided evenly between cells for which expand is TRUE.
	 * Note that reusing the same cell renderer is not supported.
	 * cell_layout:
	 *  A GtkCellLayout.
	 * cell:
	 *  A GtkCellRenderer.
	 * expand:
	 *  TRUE if cell is to be given extra space allocated to cell_layout.
	 * Since 2.4
	 */
	public void packStart(CellRenderer cell, int expand)
	{
		// void gtk_cell_layout_pack_start (GtkCellLayout *cell_layout,  GtkCellRenderer *cell,  gboolean expand);
		gtk_cell_layout_pack_start(getCellLayoutTStruct(), (cell is null) ? null : cell.getCellRendererStruct(), expand);
	}
	
	/**
	 * Adds the cell to the end of cell_layout. If expand is FALSE, then the
	 * cell is allocated no more space than it needs. Any unused space is
	 * divided evenly between cells for which expand is TRUE.
	 * Note that reusing the same cell renderer is not supported.
	 * cell_layout:
	 *  A GtkCellLayout.
	 * cell:
	 *  A GtkCellRenderer.
	 * expand:
	 *  TRUE if cell is to be given extra space allocated to cell_layout.
	 * Since 2.4
	 */
	public void packEnd(CellRenderer cell, int expand)
	{
		// void gtk_cell_layout_pack_end (GtkCellLayout *cell_layout,  GtkCellRenderer *cell,  gboolean expand);
		gtk_cell_layout_pack_end(getCellLayoutTStruct(), (cell is null) ? null : cell.getCellRendererStruct(), expand);
	}
	
	/**
	 * Re-inserts cell at position. Note that cell has already to be packed
	 * into cell_layout for this to function properly.
	 * cell_layout:
	 *  A GtkCellLayout.
	 * cell:
	 *  A GtkCellRenderer to reorder.
	 * position:
	 *  New position to insert cell at.
	 * Since 2.4
	 */
	public void reorder(CellRenderer cell, int position)
	{
		// void gtk_cell_layout_reorder (GtkCellLayout *cell_layout,  GtkCellRenderer *cell,  gint position);
		gtk_cell_layout_reorder(getCellLayoutTStruct(), (cell is null) ? null : cell.getCellRendererStruct(), position);
	}
	
	/**
	 * Unsets all the mappings on all renderers on cell_layout and
	 * removes all renderers from cell_layout.
	 * cell_layout:
	 *  A GtkCellLayout.
	 * Since 2.4
	 */
	public void clear()
	{
		// void gtk_cell_layout_clear (GtkCellLayout *cell_layout);
		gtk_cell_layout_clear(getCellLayoutTStruct());
	}
	
	/**
	 * Sets the attributes in list as the attributes of cell_layout. The
	 * attributes should be in attribute/column order, as in
	 * gtk_cell_layout_add_attribute(). All existing attributes are removed, and
	 * replaced with the new attributes.
	 * cell_layout:
	 *  A GtkCellLayout.
	 * cell:
	 *  A GtkCellRenderer.
	 * ...:
	 *  A NULL-terminated list of attributes.
	 * Since 2.4
	 */
	public void setAttributes(CellRenderer cell, ... )
	{
		// void gtk_cell_layout_set_attributes (GtkCellLayout *cell_layout,  GtkCellRenderer *cell,  ...);
		gtk_cell_layout_set_attributes(getCellLayoutTStruct(), (cell is null) ? null : cell.getCellRendererStruct());
	}
	
	/**
	 * Adds an attribute mapping to the list in cell_layout. The column is the
	 * column of the model to get a value from, and the attribute is the
	 * parameter on cell to be set from the value. So for example if column 2
	 * of the model contains strings, you could have the "text" attribute of a
	 * GtkCellRendererText get its values from column 2.
	 * cell_layout:
	 *  A GtkCellLayout.
	 * cell:
	 *  A GtkCellRenderer.
	 * attribute:
	 *  An attribute on the renderer.
	 * column:
	 *  The column position on the model to get the attribute from.
	 * Since 2.4
	 */
	public void addAttribute(CellRenderer cell, char[] attribute, int column)
	{
		// void gtk_cell_layout_add_attribute (GtkCellLayout *cell_layout,  GtkCellRenderer *cell,  const gchar *attribute,  gint column);
		gtk_cell_layout_add_attribute(getCellLayoutTStruct(), (cell is null) ? null : cell.getCellRendererStruct(), Str.toStringz(attribute), column);
	}
	
	/**
	 * Sets the GtkCellLayoutDataFunc to use for cell_layout. This function
	 * is used instead of the standard attributes mapping for setting the
	 * column value, and should set the value of cell_layout's cell renderer(s)
	 * as appropriate. func may be NULL to remove and older one.
	 * cell_layout:
	 *  A GtkCellLayout.
	 * cell:
	 *  A GtkCellRenderer.
	 * func:
	 *  The GtkCellLayoutDataFunc to use.
	 * func_data:
	 *  The user data for func.
	 * destroy:
	 *  The destroy notification for func_data.
	 * Since 2.4
	 */
	public void setCellDataFunc(CellRenderer cell, GtkCellLayoutDataFunc func, void* funcData, GDestroyNotify destroy)
	{
		// void gtk_cell_layout_set_cell_data_func  (GtkCellLayout *cell_layout,  GtkCellRenderer *cell,  GtkCellLayoutDataFunc func,  gpointer func_data,  GDestroyNotify destroy);
		gtk_cell_layout_set_cell_data_func(getCellLayoutTStruct(), (cell is null) ? null : cell.getCellRendererStruct(), func, funcData, destroy);
	}
	
	/**
	 * Clears all existing attributes previously set with
	 * gtk_cell_layout_set_attributes().
	 * cell_layout:
	 *  A GtkCellLayout.
	 * cell:
	 *  A GtkCellRenderer to clear the attribute mapping on.
	 * Since 2.4
	 */
	public void clearAttributes(CellRenderer cell)
	{
		// void gtk_cell_layout_clear_attributes  (GtkCellLayout *cell_layout,  GtkCellRenderer *cell);
		gtk_cell_layout_clear_attributes(getCellLayoutTStruct(), (cell is null) ? null : cell.getCellRendererStruct());
	}
}