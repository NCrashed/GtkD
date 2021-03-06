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


module glib.OptionGroup;

private import glib.ConstructionException;
private import glib.Str;
private import gtkc.glib;
public  import gtkc.glibtypes;


/**
 * A `GOptionGroup` struct defines the options in a single
 * group. The struct has only private fields and should not be directly accessed.
 * 
 * All options in a group share the same translation function. Libraries which
 * need to parse commandline options are expected to provide a function for
 * getting a `GOptionGroup` holding their options, which
 * the application can then add to its #GOptionContext.
 */
public class OptionGroup
{
	/** the main Gtk struct */
	protected GOptionGroup* gOptionGroup;

	/** Get the main Gtk struct */
	public GOptionGroup* getOptionGroupStruct()
	{
		return gOptionGroup;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gOptionGroup;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GOptionGroup* gOptionGroup)
	{
		this.gOptionGroup = gOptionGroup;
	}

	/**
	 */

	/**
	 * Adds the options specified in @entries to @group.
	 *
	 * Params:
	 *     entries = a %NULL-terminated array of #GOptionEntrys
	 *
	 * Since: 2.6
	 */
	public void addEntries(GOptionEntry* entries)
	{
		g_option_group_add_entries(gOptionGroup, entries);
	}

	/**
	 * Frees a #GOptionGroup. Note that you must not free groups
	 * which have been added to a #GOptionContext.
	 *
	 * Since: 2.6
	 */
	public void free()
	{
		g_option_group_free(gOptionGroup);
	}

	/**
	 * Associates a function with @group which will be called
	 * from g_option_context_parse() when an error occurs.
	 *
	 * Note that the user data to be passed to @error_func can be
	 * specified when constructing the group with g_option_group_new().
	 *
	 * Params:
	 *     errorFunc = a function to call when an error occurs
	 *
	 * Since: 2.6
	 */
	public void setErrorHook(GOptionErrorFunc errorFunc)
	{
		g_option_group_set_error_hook(gOptionGroup, errorFunc);
	}

	/**
	 * Associates two functions with @group which will be called
	 * from g_option_context_parse() before the first option is parsed
	 * and after the last option has been parsed, respectively.
	 *
	 * Note that the user data to be passed to @pre_parse_func and
	 * @post_parse_func can be specified when constructing the group
	 * with g_option_group_new().
	 *
	 * Params:
	 *     preParseFunc = a function to call before parsing, or %NULL
	 *     postParseFunc = a function to call after parsing, or %NULL
	 *
	 * Since: 2.6
	 */
	public void setParseHooks(GOptionParseFunc preParseFunc, GOptionParseFunc postParseFunc)
	{
		g_option_group_set_parse_hooks(gOptionGroup, preParseFunc, postParseFunc);
	}

	/**
	 * Sets the function which is used to translate user-visible strings,
	 * for `--help` output. Different groups can use different
	 * #GTranslateFuncs. If @func is %NULL, strings are not translated.
	 *
	 * If you are using gettext(), you only need to set the translation
	 * domain, see g_option_group_set_translation_domain().
	 *
	 * Params:
	 *     func = the #GTranslateFunc, or %NULL
	 *     data = user data to pass to @func, or %NULL
	 *     destroyNotify = a function which gets called to free @data, or %NULL
	 *
	 * Since: 2.6
	 */
	public void setTranslateFunc(GTranslateFunc func, void* data, GDestroyNotify destroyNotify)
	{
		g_option_group_set_translate_func(gOptionGroup, func, data, destroyNotify);
	}

	/**
	 * A convenience function to use gettext() for translating
	 * user-visible strings.
	 *
	 * Params:
	 *     domain = the domain to use
	 *
	 * Since: 2.6
	 */
	public void setTranslationDomain(string domain)
	{
		g_option_group_set_translation_domain(gOptionGroup, Str.toStringz(domain));
	}

	/**
	 * Creates a new #GOptionGroup.
	 *
	 * Params:
	 *     name = the name for the option group, this is used to provide
	 *         help for the options in this group with `--help-`@name
	 *     description = a description for this group to be shown in
	 *         `--help`. This string is translated using the translation
	 *         domain or translation function of the group
	 *     helpDescription = a description for the `--help-`@name option.
	 *         This string is translated using the translation domain or translation function
	 *         of the group
	 *     userData = user data that will be passed to the pre- and post-parse hooks,
	 *         the error hook and to callbacks of %G_OPTION_ARG_CALLBACK options, or %NULL
	 *     destroy = a function that will be called to free @user_data, or %NULL
	 *
	 * Return: a newly created option group. It should be added
	 *     to a #GOptionContext or freed with g_option_group_free().
	 *
	 * Since: 2.6
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string name, string description, string helpDescription, void* userData, GDestroyNotify destroy)
	{
		auto p = g_option_group_new(Str.toStringz(name), Str.toStringz(description), Str.toStringz(helpDescription), userData, destroy);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GOptionGroup*) p);
	}
}
