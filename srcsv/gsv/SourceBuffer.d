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


module gsv.SourceBuffer;

private import glib.ConstructionException;
private import glib.ListSG;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gsv.SourceLanguage;
private import gsv.SourceMark;
private import gsv.SourceStyleScheme;
private import gsv.SourceUndoManager;
private import gsv.SourceUndoManagerIF;
private import gsvc.gsv;
public  import gsvc.gsvtypes;
private import gtk.TextBuffer;
private import gtk.TextIter;
private import gtk.TextMark;
private import gtk.TextTagTable;
public  import gtkc.gdktypes;


public class SourceBuffer : TextBuffer
{
	/** the main Gtk struct */
	protected GtkSourceBuffer* gtkSourceBuffer;

	/** Get the main Gtk struct */
	public GtkSourceBuffer* getSourceBufferStruct()
	{
		return gtkSourceBuffer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceBuffer;
	}

	protected override void setStruct(GObject* obj)
	{
		gtkSourceBuffer = cast(GtkSourceBuffer*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceBuffer* gtkSourceBuffer, bool ownedRef = false)
	{
		this.gtkSourceBuffer = gtkSourceBuffer;
		super(cast(GtkTextBuffer*)gtkSourceBuffer, ownedRef);
	}

	/**
	 */

	public static GType getType()
	{
		return gtk_source_buffer_get_type();
	}

	/**
	 * Creates a new source buffer.
	 *
	 * Params:
	 *     table = a #GtkTextTagTable, or %NULL to create a new one.
	 *
	 * Return: a new source buffer.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(TextTagTable table)
	{
		auto p = gtk_source_buffer_new((table is null) ? null : table.getTextTagTableStruct());
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GtkSourceBuffer*) p, true);
	}

	/**
	 * Creates a new source buffer using the highlighting patterns in
	 * @language.  This is equivalent to creating a new source buffer with
	 * a new tag table and then calling gtk_source_buffer_set_language().
	 *
	 * Params:
	 *     language = a #GtkSourceLanguage.
	 *
	 * Return: a new source buffer which will highlight text
	 *     according to the highlighting patterns in @language.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(SourceLanguage language)
	{
		auto p = gtk_source_buffer_new_with_language((language is null) ? null : language.getSourceLanguageStruct());
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_with_language");
		}
		
		this(cast(GtkSourceBuffer*) p, true);
	}

	/**
	 * Moves @iter to the position of the previous #GtkSourceMark of the given
	 * category. Returns %TRUE if @iter was moved. If @category is NULL, the
	 * previous source mark can be of any category.
	 *
	 * Params:
	 *     iter = an iterator.
	 *     category = category to search for, or %NULL
	 *
	 * Return: whether @iter was moved.
	 *
	 * Since: 2.2
	 */
	public bool backwardIterToSourceMark(TextIter iter, string category)
	{
		return gtk_source_buffer_backward_iter_to_source_mark(gtkSourceBuffer, (iter is null) ? null : iter.getTextIterStruct(), Str.toStringz(category)) != 0;
	}

	/**
	 * Marks the beginning of a not undoable action on the buffer,
	 * disabling the undo manager.  Typically you would call this function
	 * before initially setting the contents of the buffer (e.g. when
	 * loading a file in a text editor).
	 *
	 * You may nest gtk_source_buffer_begin_not_undoable_action() /
	 * gtk_source_buffer_end_not_undoable_action() blocks.
	 */
	public void beginNotUndoableAction()
	{
		gtk_source_buffer_begin_not_undoable_action(gtkSourceBuffer);
	}

	/**
	 * Determines whether a source buffer can redo the last action
	 * (i.e. if the last operation was an undo).
	 *
	 * Return: %TRUE if a redo is possible.
	 */
	public bool canRedo()
	{
		return gtk_source_buffer_can_redo(gtkSourceBuffer) != 0;
	}

	/**
	 * Determines whether a source buffer can undo the last action.
	 *
	 * Return: %TRUE if it's possible to undo the last action.
	 */
	public bool canUndo()
	{
		return gtk_source_buffer_can_undo(gtkSourceBuffer) != 0;
	}

	/**
	 * Changes the case of the text between the specified iterators.
	 *
	 * Params:
	 *     caseType = how to change the case.
	 *     start = a #GtkTextIter.
	 *     end = a #GtkTextIter.
	 *
	 * Since: 3.12
	 */
	public void changeCase(GtkSourceChangeCaseType caseType, TextIter start, TextIter end)
	{
		gtk_source_buffer_change_case(gtkSourceBuffer, caseType, (start is null) ? null : start.getTextIterStruct(), (end is null) ? null : end.getTextIterStruct());
	}

	/**
	 * Creates a source mark in the @buffer of category @category.  A source mark is
	 * a #GtkTextMark but organised into categories. Depending on the category
	 * a pixbuf can be specified that will be displayed along the line of the mark.
	 *
	 * Like a #GtkTextMark, a #GtkSourceMark can be anonymous if the
	 * passed @name is %NULL.  Also, the buffer owns the marks so you
	 * shouldn't unreference it.
	 *
	 * Marks always have left gravity and are moved to the beginning of
	 * the line when the user deletes the line they were in.
	 *
	 * Typical uses for a source mark are bookmarks, breakpoints, current
	 * executing instruction indication in a source file, etc..
	 *
	 * Params:
	 *     name = the name of the mark, or %NULL.
	 *     category = a string defining the mark category.
	 *     where = location to place the mark.
	 *
	 * Return: a new #GtkSourceMark, owned by the buffer.
	 *
	 * Since: 2.2
	 */
	public SourceMark createSourceMark(string name, string category, TextIter where)
	{
		auto p = gtk_source_buffer_create_source_mark(gtkSourceBuffer, Str.toStringz(name), Str.toStringz(category), (where is null) ? null : where.getTextIterStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(SourceMark)(cast(GtkSourceMark*) p);
	}

	/**
	 * Marks the end of a not undoable action on the buffer.  When the
	 * last not undoable block is closed through the call to this
	 * function, the list of undo actions is cleared and the undo manager
	 * is re-enabled.
	 */
	public void endNotUndoableAction()
	{
		gtk_source_buffer_end_not_undoable_action(gtkSourceBuffer);
	}

	/**
	 * Forces buffer to analyze and highlight the given area synchronously.
	 *
	 * <note>
	 * <para>
	 * This is a potentially slow operation and should be used only
	 * when you need to make sure that some text not currently
	 * visible is highlighted, for instance before printing.
	 * </para>
	 * </note>
	 *
	 * Params:
	 *     start = start of the area to highlight.
	 *     end = end of the area to highlight.
	 */
	public void ensureHighlight(TextIter start, TextIter end)
	{
		gtk_source_buffer_ensure_highlight(gtkSourceBuffer, (start is null) ? null : start.getTextIterStruct(), (end is null) ? null : end.getTextIterStruct());
	}

	/**
	 * Moves @iter to the position of the next #GtkSourceMark of the given
	 * @category. Returns %TRUE if @iter was moved. If @category is NULL, the
	 * next source mark can be of any category.
	 *
	 * Params:
	 *     iter = an iterator.
	 *     category = category to search for, or %NULL
	 *
	 * Return: whether @iter was moved.
	 *
	 * Since: 2.2
	 */
	public bool forwardIterToSourceMark(TextIter iter, string category)
	{
		return gtk_source_buffer_forward_iter_to_source_mark(gtkSourceBuffer, (iter is null) ? null : iter.getTextIterStruct(), Str.toStringz(category)) != 0;
	}

	/**
	 * Get all defined context classes at @iter.
	 *
	 * See the #GtkSourceBuffer description for the list of default context classes.
	 *
	 * Params:
	 *     iter = a #GtkTextIter.
	 *
	 * Return: a new %NULL
	 *     terminated array of context class names.
	 *     Use g_strfreev() to free the array if it is no longer needed.
	 *
	 * Since: 2.10
	 */
	public string[] getContextClassesAtIter(TextIter iter)
	{
		return Str.toStringArray(gtk_source_buffer_get_context_classes_at_iter(gtkSourceBuffer, (iter is null) ? null : iter.getTextIterStruct()));
	}

	/**
	 * Determines whether bracket match highlighting is activated for the
	 * source buffer.
	 *
	 * Return: %TRUE if the source buffer will highlight matching
	 *     brackets.
	 */
	public bool getHighlightMatchingBrackets()
	{
		return gtk_source_buffer_get_highlight_matching_brackets(gtkSourceBuffer) != 0;
	}

	/**
	 * Determines whether syntax highlighting is activated in the source
	 * buffer.
	 *
	 * Return: %TRUE if syntax highlighting is enabled, %FALSE otherwise.
	 */
	public bool getHighlightSyntax()
	{
		return gtk_source_buffer_get_highlight_syntax(gtkSourceBuffer) != 0;
	}

	/**
	 * Return: whether the @buffer has an implicit trailing newline.
	 *
	 * Since: 3.14
	 */
	public bool getImplicitTrailingNewline()
	{
		return gtk_source_buffer_get_implicit_trailing_newline(gtkSourceBuffer) != 0;
	}

	/**
	 * Returns the #GtkSourceLanguage associated with the buffer,
	 * see gtk_source_buffer_set_language().  The returned object should not be
	 * unreferenced by the user.
	 *
	 * Return: the #GtkSourceLanguage associated with the buffer, or %NULL.
	 */
	public SourceLanguage getLanguage()
	{
		auto p = gtk_source_buffer_get_language(gtkSourceBuffer);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(SourceLanguage)(cast(GtkSourceLanguage*) p);
	}

	/**
	 * Determines the number of undo levels the buffer will track for
	 * buffer edits.
	 *
	 * Return: the maximum number of possible undo levels or
	 *     -1 if no limit is set.
	 */
	public int getMaxUndoLevels()
	{
		return gtk_source_buffer_get_max_undo_levels(gtkSourceBuffer);
	}

	/**
	 * Returns the list of marks of the given category at @iter. If @category
	 * is %NULL it returns all marks at @iter.
	 *
	 * Params:
	 *     iter = an iterator.
	 *     category = category to search for, or %NULL
	 *
	 * Return: a newly allocated #GSList.
	 *
	 * Since: 2.2
	 */
	public ListSG getSourceMarksAtIter(TextIter iter, string category)
	{
		auto p = gtk_source_buffer_get_source_marks_at_iter(gtkSourceBuffer, (iter is null) ? null : iter.getTextIterStruct(), Str.toStringz(category));
		
		if(p is null)
		{
			return null;
		}
		
		return new ListSG(cast(GSList*) p);
	}

	/**
	 * Returns the list of marks of the given category at @line.
	 * If @category is %NULL, all marks at @line are returned.
	 *
	 * Params:
	 *     line = a line number.
	 *     category = category to search for, or %NULL
	 *
	 * Return: a newly allocated #GSList.
	 *
	 * Since: 2.2
	 */
	public ListSG getSourceMarksAtLine(int line, string category)
	{
		auto p = gtk_source_buffer_get_source_marks_at_line(gtkSourceBuffer, line, Str.toStringz(category));
		
		if(p is null)
		{
			return null;
		}
		
		return new ListSG(cast(GSList*) p);
	}

	/**
	 * Returns the #GtkSourceStyleScheme associated with the buffer,
	 * see gtk_source_buffer_set_style_scheme().
	 * The returned object should not be unreferenced by the user.
	 *
	 * Return: the #GtkSourceStyleScheme associated
	 *     with the buffer, or %NULL.
	 */
	public SourceStyleScheme getStyleScheme()
	{
		auto p = gtk_source_buffer_get_style_scheme(gtkSourceBuffer);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(SourceStyleScheme)(cast(GtkSourceStyleScheme*) p);
	}

	/**
	 * Returns the #GtkSourceUndoManager associated with the buffer,
	 * see gtk_source_buffer_set_undo_manager().  The returned object should not be
	 * unreferenced by the user.
	 *
	 * Return: the #GtkSourceUndoManager associated
	 *     with the buffer, or %NULL.
	 */
	public SourceUndoManagerIF getUndoManager()
	{
		auto p = gtk_source_buffer_get_undo_manager(gtkSourceBuffer);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(SourceUndoManager, SourceUndoManagerIF)(cast(GtkSourceUndoManager*) p);
	}

	/**
	 * Moves backward to the next toggle (on or off) of the context class. If no
	 * matching context class toggles are found, returns %FALSE, otherwise %TRUE.
	 * Does not return toggles located at @iter, only toggles after @iter. Sets
	 * @iter to the location of the toggle, or to the end of the buffer if no
	 * toggle is found.
	 *
	 * See the #GtkSourceBuffer description for the list of default context classes.
	 *
	 * Params:
	 *     iter = a #GtkTextIter.
	 *     contextClass = the context class.
	 *
	 * Return: whether we found a context class toggle before @iter
	 *
	 * Since: 2.10
	 */
	public bool iterBackwardToContextClassToggle(ref TextIter iter, string contextClass)
	{
		return gtk_source_buffer_iter_backward_to_context_class_toggle(gtkSourceBuffer, (iter is null) ? null : iter.getTextIterStruct(), Str.toStringz(contextClass)) != 0;
	}

	/**
	 * Moves forward to the next toggle (on or off) of the context class. If no
	 * matching context class toggles are found, returns %FALSE, otherwise %TRUE.
	 * Does not return toggles located at @iter, only toggles after @iter. Sets
	 * @iter to the location of the toggle, or to the end of the buffer if no
	 * toggle is found.
	 *
	 * See the #GtkSourceBuffer description for the list of default context classes.
	 *
	 * Params:
	 *     iter = a #GtkTextIter.
	 *     contextClass = the context class.
	 *
	 * Return: whether we found a context class toggle after @iter
	 *
	 * Since: 2.10
	 */
	public bool iterForwardToContextClassToggle(ref TextIter iter, string contextClass)
	{
		return gtk_source_buffer_iter_forward_to_context_class_toggle(gtkSourceBuffer, (iter is null) ? null : iter.getTextIterStruct(), Str.toStringz(contextClass)) != 0;
	}

	/**
	 * Check if the class @context_class is set on @iter.
	 *
	 * See the #GtkSourceBuffer description for the list of default context classes.
	 *
	 * Params:
	 *     iter = a #GtkTextIter.
	 *     contextClass = class to search for.
	 *
	 * Return: whether @iter has the context class.
	 *
	 * Since: 2.10
	 */
	public bool iterHasContextClass(TextIter iter, string contextClass)
	{
		return gtk_source_buffer_iter_has_context_class(gtkSourceBuffer, (iter is null) ? null : iter.getTextIterStruct(), Str.toStringz(contextClass)) != 0;
	}

	/**
	 * Redoes the last undo operation.  Use gtk_source_buffer_can_redo()
	 * to check whether a call to this function will have any effect.
	 *
	 * This function emits the #GtkSourceBuffer::redo signal.
	 */
	public void redo()
	{
		gtk_source_buffer_redo(gtkSourceBuffer);
	}

	/**
	 * Remove all marks of @category between @start and @end from the buffer.
	 * If @category is NULL, all marks in the range will be removed.
	 *
	 * Params:
	 *     start = a #GtkTextIter.
	 *     end = a #GtkTextIter.
	 *     category = category to search for, or %NULL.
	 *
	 * Since: 2.2
	 */
	public void removeSourceMarks(TextIter start, TextIter end, string category)
	{
		gtk_source_buffer_remove_source_marks(gtkSourceBuffer, (start is null) ? null : start.getTextIterStruct(), (end is null) ? null : end.getTextIterStruct(), Str.toStringz(category));
	}

	/**
	 * Controls the bracket match highlighting function in the buffer.  If
	 * activated, when you position your cursor over a bracket character
	 * (a parenthesis, a square bracket, etc.) the matching opening or
	 * closing bracket character will be highlighted.
	 *
	 * Params:
	 *     highlight = %TRUE if you want matching brackets highlighted.
	 */
	public void setHighlightMatchingBrackets(bool highlight)
	{
		gtk_source_buffer_set_highlight_matching_brackets(gtkSourceBuffer, highlight);
	}

	/**
	 * Controls whether syntax is highlighted in the buffer. If @highlight
	 * is %TRUE, the text will be highlighted according to the syntax
	 * patterns specified in the language set with
	 * gtk_source_buffer_set_language(). If @highlight is %FALSE, syntax highlighting
	 * is disabled and all the GtkTextTag objects that have been added by the
	 * syntax highlighting engine are removed from the buffer.
	 *
	 * Params:
	 *     highlight = %TRUE to enable syntax highlighting, %FALSE to disable it.
	 */
	public void setHighlightSyntax(bool highlight)
	{
		gtk_source_buffer_set_highlight_syntax(gtkSourceBuffer, highlight);
	}

	/**
	 * Sets whether the @buffer has an implicit trailing newline.
	 *
	 * If an explicit trailing newline is present in a #GtkTextBuffer, #GtkTextView
	 * shows it as an empty line. This is generally not what the user expects.
	 *
	 * If @implicit_trailing_newline is %TRUE (the default value):
	 * - when a #GtkSourceFileLoader loads the content of a file into the @buffer,
	 * the trailing newline (if present in the file) is not inserted into the
	 * @buffer.
	 * - when a #GtkSourceFileSaver saves the content of the @buffer into a file, a
	 * trailing newline is added to the file.
	 *
	 * On the other hand, if @implicit_trailing_newline is %FALSE, the file's
	 * content is not modified when loaded into the @buffer, and the @buffer's
	 * content is not modified when saved into a file.
	 *
	 * Params:
	 *     implicitTrailingNewline = the new value.
	 *
	 * Since: 3.14
	 */
	public void setImplicitTrailingNewline(bool implicitTrailingNewline)
	{
		gtk_source_buffer_set_implicit_trailing_newline(gtkSourceBuffer, implicitTrailingNewline);
	}

	/**
	 * Associate a #GtkSourceLanguage with the buffer. If @language is
	 * not-%NULL and syntax highlighting is enabled (see gtk_source_buffer_set_highlight_syntax()),
	 * the syntax patterns defined in @language will be used to highlight the text
	 * contained in the buffer. If @language is %NULL, the text contained in the
	 * buffer is not highlighted.
	 *
	 * The buffer holds a reference to @language.
	 *
	 * Params:
	 *     language = a #GtkSourceLanguage to set, or %NULL.
	 */
	public void setLanguage(SourceLanguage language)
	{
		gtk_source_buffer_set_language(gtkSourceBuffer, (language is null) ? null : language.getSourceLanguageStruct());
	}

	/**
	 * Sets the number of undo levels for user actions the buffer will
	 * track.  If the number of user actions exceeds the limit set by this
	 * function, older actions will be discarded.
	 *
	 * If @max_undo_levels is -1, no limit is set.
	 *
	 * Params:
	 *     maxUndoLevels = the desired maximum number of undo levels.
	 */
	public void setMaxUndoLevels(int maxUndoLevels)
	{
		gtk_source_buffer_set_max_undo_levels(gtkSourceBuffer, maxUndoLevels);
	}

	/**
	 * Sets style scheme used by the buffer. If @scheme is %NULL no
	 * style scheme is used.
	 *
	 * Params:
	 *     scheme = a #GtkSourceStyleScheme or %NULL.
	 */
	public void setStyleScheme(SourceStyleScheme scheme)
	{
		gtk_source_buffer_set_style_scheme(gtkSourceBuffer, (scheme is null) ? null : scheme.getSourceStyleSchemeStruct());
	}

	/**
	 * Set the buffer undo manager. If @manager is %NULL the default undo manager
	 * will be set.
	 *
	 * Params:
	 *     manager = A #GtkSourceUndoManager or %NULL.
	 */
	public void setUndoManager(SourceUndoManagerIF manager)
	{
		gtk_source_buffer_set_undo_manager(gtkSourceBuffer, (manager is null) ? null : manager.getSourceUndoManagerStruct());
	}

	/**
	 * Undoes the last user action which modified the buffer.  Use
	 * gtk_source_buffer_can_undo() to check whether a call to this
	 * function will have any effect.
	 *
	 * This function emits the #GtkSourceBuffer::undo signal.
	 */
	public void undo()
	{
		gtk_source_buffer_undo(gtkSourceBuffer);
	}

	int[string] connectedSignals;

	void delegate(TextIter, GtkSourceBracketMatchType, SourceBuffer)[] onBracketMatchedListeners;
	/**
	 * Sets @iter to a valid iterator pointing to the matching bracket
	 * if @state is #GTK_SOURCE_BRACKET_MATCH_FOUND. Otherwise @iter is
	 * meaningless.
	 *
	 * Params:
	 *     iter = iterator to initialize.
	 *     state = state of bracket matching
	 *
	 * Since: 2.12
	 */
	void addOnBracketMatched(void delegate(TextIter, GtkSourceBracketMatchType, SourceBuffer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "bracket-matched" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"bracket-matched",
				cast(GCallback)&callBackBracketMatched,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["bracket-matched"] = 1;
		}
		onBracketMatchedListeners ~= dlg;
	}
	extern(C) static void callBackBracketMatched(GtkSourceBuffer* sourcebufferStruct, GtkTextIter* iter, GtkSourceBracketMatchType state, SourceBuffer _sourcebuffer)
	{
		foreach ( void delegate(TextIter, GtkSourceBracketMatchType, SourceBuffer) dlg; _sourcebuffer.onBracketMatchedListeners )
		{
			dlg(ObjectG.getDObject!(TextIter)(iter), state, _sourcebuffer);
		}
	}

	void delegate(TextIter, TextIter, SourceBuffer)[] onHighlightUpdatedListeners;
	/**
	 * The ::highlight-updated signal is emitted when the syntax
	 * highlighting is updated in a certain region of the @buffer. This
	 * signal is useful to be notified when a context class region is
	 * updated (e.g. the no-spell-check context class).
	 *
	 * Params:
	 *     start = the start of the updated region
	 *     end = the end of the updated region
	 */
	void addOnHighlightUpdated(void delegate(TextIter, TextIter, SourceBuffer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "highlight-updated" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"highlight-updated",
				cast(GCallback)&callBackHighlightUpdated,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["highlight-updated"] = 1;
		}
		onHighlightUpdatedListeners ~= dlg;
	}
	extern(C) static void callBackHighlightUpdated(GtkSourceBuffer* sourcebufferStruct, GtkTextIter* start, GtkTextIter* end, SourceBuffer _sourcebuffer)
	{
		foreach ( void delegate(TextIter, TextIter, SourceBuffer) dlg; _sourcebuffer.onHighlightUpdatedListeners )
		{
			dlg(ObjectG.getDObject!(TextIter)(start), ObjectG.getDObject!(TextIter)(end), _sourcebuffer);
		}
	}

	void delegate(SourceBuffer)[] onRedoListeners;
	/**
	 * The ::redo signal is emitted to redo the last undo operation.
	 */
	void addOnRedo(void delegate(SourceBuffer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "redo" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"redo",
				cast(GCallback)&callBackRedo,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["redo"] = 1;
		}
		onRedoListeners ~= dlg;
	}
	extern(C) static void callBackRedo(GtkSourceBuffer* sourcebufferStruct, SourceBuffer _sourcebuffer)
	{
		foreach ( void delegate(SourceBuffer) dlg; _sourcebuffer.onRedoListeners )
		{
			dlg(_sourcebuffer);
		}
	}

	void delegate(TextMark, SourceBuffer)[] onSourceMarkUpdatedListeners;
	/**
	 * The ::source_mark_updated signal is emitted each time
	 * a mark is added to, moved or removed from the @buffer.
	 *
	 * Params:
	 *     mark = the #GtkSourceMark
	 */
	void addOnSourceMarkUpdated(void delegate(TextMark, SourceBuffer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "source-mark-updated" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"source-mark-updated",
				cast(GCallback)&callBackSourceMarkUpdated,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["source-mark-updated"] = 1;
		}
		onSourceMarkUpdatedListeners ~= dlg;
	}
	extern(C) static void callBackSourceMarkUpdated(GtkSourceBuffer* sourcebufferStruct, GtkTextMark* mark, SourceBuffer _sourcebuffer)
	{
		foreach ( void delegate(TextMark, SourceBuffer) dlg; _sourcebuffer.onSourceMarkUpdatedListeners )
		{
			dlg(ObjectG.getDObject!(TextMark)(mark), _sourcebuffer);
		}
	}

	void delegate(SourceBuffer)[] onUndoListeners;
	/**
	 * The ::undo signal is emitted to undo the last user action which
	 * modified the buffer.
	 */
	void addOnUndo(void delegate(SourceBuffer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "undo" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"undo",
				cast(GCallback)&callBackUndo,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["undo"] = 1;
		}
		onUndoListeners ~= dlg;
	}
	extern(C) static void callBackUndo(GtkSourceBuffer* sourcebufferStruct, SourceBuffer _sourcebuffer)
	{
		foreach ( void delegate(SourceBuffer) dlg; _sourcebuffer.onUndoListeners )
		{
			dlg(_sourcebuffer);
		}
	}
}
