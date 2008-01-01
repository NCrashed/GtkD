/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage

/*
 * Conversion parameters:
 * inFile  = 
 * outPack = gtk
 * outFile = PrintOperationPreviewT
 * strct   = GtkPrintOperationPreview
 * realStrct=
 * ctorStrct=
 * clss    = PrintOperationPreviewT
 * interf  = 
 * class Code: No
 * interface Code: No
 * template for:
 * 	- TStruct
 * extend  = 
 * implements:
 * prefixes:
 * 	- gtk_print_operation_preview_
 * omit structs:
 * omit prefixes:
 * omit code:
 * omit signals:
 * 	- begin-print
 * 	- create-custom-widget
 * 	- custom-widget-apply
 * 	- done
 * 	- draw-page
 * 	- end-print
 * 	- paginate
 * 	- preview
 * 	- request-page-setup
 * 	- status-changed
 * imports:
 * structWrap:
 * module aliases:
 * local aliases:
 */

module gtk.PrintOperationPreviewT;

public  import gtkc.gtktypes;

private import gtkc.gtk;

private import gobject.Signals;
public  import gtkc.gdktypes;





/**
 * Description
 * GtkPrintOperation is the high-level, portable printing API. It looks
 * a bit different than other GTK+ dialogs such as the GtkFileChooser,
 * since some platforms don't expose enough infrastructure to implement
 * a good print dialog. On such platforms, GtkPrintOperation uses the
 * native print dialog. On platforms which do not provide a native
 * print dialog, GTK+ uses its own, see GtkPrintUnixDialog.
 * The typical way to use the high-level printing API is to create a
 * GtkPrintOperation object with gtk_print_operation_new() when the user
 * selects to print. Then you set some properties on it, e.g. the page size,
 * any GtkPrintSettings from previous print operations, the number of pages,
 * the current page, etc.
 * Then you start the print operation by calling gtk_print_operation_run().
 * It will then show a dialog, let the user select a printer and options.
 * When the user finished the dialog various signals will be emitted on the
 * GtkPrintOperation, the main one being ::draw-page, which you are supposed
 * to catch and render the page on the provided GtkPrintContext using Cairo.
 * Example39.The high-level printing API
 * static GtkPrintSettings *settings = NULL;
 * static void
 * do_print (void)
 * {
	 *  GtkPrintOperation *print;
	 *  GtkPrintOperationResult res;
	 *  print = gtk_print_operation_new ();
	 *  if (settings != NULL)
	 *  gtk_print_operation_set_print_settings (print, settings);
	 *  g_signal_connect (print, "begin_print", G_CALLBACK (begin_print), NULL);
	 *  g_signal_connect (print, "draw_page", G_CALLBACK (draw_page), NULL);
	 *  res = gtk_print_operation_run (print, GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,
	 *  GTK_WINDOW (main_window), NULL);
	 *  if (res == GTK_PRINT_OPERATION_RESULT_APPLY)
	 *  {
		 *  if (settings != NULL)
		 *  g_object_unref (settings);
		 *  settings = g_object_ref (gtk_print_operation_get_print_settings (print));
	 *  }
	 *  g_object_unref (print);
 * }
 * By default GtkPrintOperation uses an external application to do
 * print preview. To implement a custom print preview, an application
 * must connect to the preview signal. The functions
 * gtk_print_operation_print_preview_render_page(),
 * gtk_print_operation_preview_end_preview() and
 * gtk_print_operation_preview_is_selected() are useful
 * when implementing a print preview.
 * Printing support was added in GTK+ 2.10.
 */
public template PrintOperationPreviewT(TStruct)
{
	
	/** the main Gtk struct */
	protected GtkPrintOperationPreview* gtkPrintOperationPreview;
	
	
	public GtkPrintOperationPreview* getPrintOperationPreviewTStruct()
	{
		return cast(GtkPrintOperationPreview*)getStruct();
	}
	
	
	/**
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * Ends a preview.
	 * This function must be called to finish a custom print preview.
	 * Since 2.10
	 */
	public void endPreview()
	{
		// void gtk_print_operation_preview_end_preview  (GtkPrintOperationPreview *preview);
		gtk_print_operation_preview_end_preview(getPrintOperationPreviewTStruct());
	}
	
	/**
	 * Returns whether the given page is included in the set of pages that
	 * have been selected for printing.
	 * Since 2.10
	 * Params:
	 * pageNr =  a page number
	 * Returns: TRUE if the page has been selected for printing
	 */
	public int isSelected(int pageNr)
	{
		// gboolean gtk_print_operation_preview_is_selected  (GtkPrintOperationPreview *preview,  gint page_nr);
		return gtk_print_operation_preview_is_selected(getPrintOperationPreviewTStruct(), pageNr);
	}
	
	/**
	 * Renders a page to the preview, using the print context that
	 * was passed to the "preview" handler together
	 * with preview.
	 * Note that this function requires a suitable cairo context to
	 * be associated with the print context.
	 * Since 2.10
	 * Params:
	 * pageNr =  the page to render
	 */
	public void renderPage(int pageNr)
	{
		// void gtk_print_operation_preview_render_page  (GtkPrintOperationPreview *preview,  gint page_nr);
		gtk_print_operation_preview_render_page(getPrintOperationPreviewTStruct(), pageNr);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}