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


module pango.PgAttribute;

private import glib.ErrorG;
private import glib.GException;
private import glib.SimpleXML;
private import glib.Str;
private import gobject.ObjectG;
private import gtkc.pango;
public  import gtkc.pangotypes;
private import pango.PgAttributeList;


/**
 * The #PangoAttribute structure represents the common portions of all
 * attributes. Particular types of attributes include this structure
 * as their initial portion. The common portion of the attribute holds
 * the range to which the value in the type-specific part of the attribute
 * applies and should be initialized using pango_attribute_init().
 * By default an attribute will have an all-inclusive range of [0,%G_MAXUINT].
 */
public class PgAttribute
{
	/** the main Gtk struct */
	protected PangoAttribute* pangoAttribute;

	/** Get the main Gtk struct */
	public PangoAttribute* getPgAttributeStruct()
	{
		return pangoAttribute;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)pangoAttribute;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (PangoAttribute* pangoAttribute)
	{
		this.pangoAttribute = pangoAttribute;
	}

	protected void setStruct(GObject* obj)
	{
		pangoAttribute = cast(PangoAttribute*)obj;
	}

	/**
	 */

	/**
	 * Make a copy of an attribute.
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 */
	public PgAttribute copy()
	{
		auto p = pango_attribute_copy(pangoAttribute);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Destroy a #PangoAttribute and free all associated memory.
	 */
	public void destroy()
	{
		pango_attribute_destroy(pangoAttribute);
	}

	/**
	 * Compare two attributes for equality. This compares only the
	 * actual value of the two attributes and not the ranges that the
	 * attributes apply to.
	 *
	 * Params:
	 *     attr2 = another #PangoAttribute
	 *
	 * Return: %TRUE if the two attributes have the same value.
	 */
	public bool equal(PgAttribute attr2)
	{
		return pango_attribute_equal(pangoAttribute, (attr2 is null) ? null : attr2.getPgAttributeStruct()) != 0;
	}

	/**
	 * Initializes @attr's klass to @klass,
	 * it's start_index to %PANGO_ATTR_INDEX_FROM_TEXT_BEGINNING
	 * and end_index to %PANGO_ATTR_INDEX_TO_TEXT_END
	 * such that the attribute applies
	 * to the entire text by default.
	 *
	 * Params:
	 *     klass = a #PangoAttrClass
	 *
	 * Since: 1.20
	 */
	public void init(PangoAttrClass* klass)
	{
		pango_attribute_init(pangoAttribute, klass);
	}

	/**
	 * Create a new background color attribute.
	 *
	 * Params:
	 *     red = the red value (ranging from 0 to 65535)
	 *     green = the green value
	 *     blue = the blue value
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 */
	public static PgAttribute backgroundNew(ushort red, ushort green, ushort blue)
	{
		auto p = pango_attr_background_new(red, green, blue);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new font fallback attribute.
	 *
	 * If fallback is disabled, characters will only be used from the
	 * closest matching font on the system. No fallback will be done to
	 * other fonts on the system that might contain the characters in the
	 * text.
	 *
	 * Params:
	 *     enableFallback = %TRUE if we should fall back on other fonts
	 *         for characters the active font is missing.
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 *
	 * Since: 1.4
	 */
	public static PgAttribute fallbackNew(bool enableFallback)
	{
		auto p = pango_attr_fallback_new(enableFallback);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new font family attribute.
	 *
	 * Params:
	 *     family = the family or comma separated list of families
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 */
	public static PgAttribute familyNew(string family)
	{
		auto p = pango_attr_family_new(Str.toStringz(family));
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new foreground color attribute.
	 *
	 * Params:
	 *     red = the red value (ranging from 0 to 65535)
	 *     green = the green value
	 *     blue = the blue value
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 */
	public static PgAttribute foregroundNew(ushort red, ushort green, ushort blue)
	{
		auto p = pango_attr_foreground_new(red, green, blue);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new gravity hint attribute.
	 *
	 * Params:
	 *     hint = the gravity hint value.
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 *
	 * Since: 1.16
	 */
	public static PgAttribute gravityHintNew(PangoGravityHint hint)
	{
		auto p = pango_attr_gravity_hint_new(hint);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new gravity attribute.
	 *
	 * Params:
	 *     gravity = the gravity value; should not be %PANGO_GRAVITY_AUTO.
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 *
	 * Since: 1.16
	 */
	public static PgAttribute gravityNew(PangoGravity gravity)
	{
		auto p = pango_attr_gravity_new(gravity);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new letter-spacing attribute.
	 *
	 * Params:
	 *     letterSpacing = amount of extra space to add between graphemes
	 *         of the text, in Pango units.
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 *
	 * Since: 1.6
	 */
	public static PgAttribute letterSpacingNew(int letterSpacing)
	{
		auto p = pango_attr_letter_spacing_new(letterSpacing);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new baseline displacement attribute.
	 *
	 * Params:
	 *     rise = the amount that the text should be displaced vertically,
	 *         in Pango units. Positive values displace the text upwards.
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 */
	public static PgAttribute riseNew(int rise)
	{
		auto p = pango_attr_rise_new(rise);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new font size scale attribute. The base font for the
	 * affected text will have its size multiplied by @scale_factor.
	 *
	 * Params:
	 *     scaleFactor = factor to scale the font
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 */
	public static PgAttribute scaleNew(double scaleFactor)
	{
		auto p = pango_attr_scale_new(scaleFactor);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new font stretch attribute
	 *
	 * Params:
	 *     stretch = the stretch
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 */
	public static PgAttribute stretchNew(PangoStretch stretch)
	{
		auto p = pango_attr_stretch_new(stretch);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new strikethrough color attribute. This attribute
	 * modifies the color of strikethrough lines. If not set, strikethrough
	 * lines will use the foreground color.
	 *
	 * Params:
	 *     red = the red value (ranging from 0 to 65535)
	 *     green = the green value
	 *     blue = the blue value
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 *
	 * Since: 1.8
	 */
	public static PgAttribute strikethroughColorNew(ushort red, ushort green, ushort blue)
	{
		auto p = pango_attr_strikethrough_color_new(red, green, blue);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new strike-through attribute.
	 *
	 * Params:
	 *     strikethrough = %TRUE if the text should be struck-through.
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 */
	public static PgAttribute strikethroughNew(bool strikethrough)
	{
		auto p = pango_attr_strikethrough_new(strikethrough);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new font slant style attribute.
	 *
	 * Params:
	 *     style = the slant style
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 */
	public static PgAttribute styleNew(PangoStyle style)
	{
		auto p = pango_attr_style_new(style);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Fetches the attribute type name passed in when registering the type using
	 * pango_attr_type_register().
	 *
	 * The returned value is an interned string (see g_intern_string() for what
	 * that means) that should not be modified or freed.
	 *
	 * Params:
	 *     type = an attribute type ID to fetch the name for
	 *
	 * Return: the type ID name (which may be %NULL), or %NULL if @type is
	 *     a built-in Pango attribute type or invalid.
	 *
	 * Since: 1.22
	 */
	public static string typeGetName(PangoAttrType type)
	{
		return Str.toString(pango_attr_type_get_name(type));
	}

	/**
	 * Allocate a new attribute type ID.  The attribute type name can be accessed
	 * later by using pango_attr_type_get_name().
	 *
	 * Params:
	 *     name = an identifier for the type
	 *
	 * Return: the new type ID.
	 */
	public static PangoAttrType typeRegister(string name)
	{
		return pango_attr_type_register(Str.toStringz(name));
	}

	/**
	 * Create a new underline color attribute. This attribute
	 * modifies the color of underlines. If not set, underlines
	 * will use the foreground color.
	 *
	 * Params:
	 *     red = the red value (ranging from 0 to 65535)
	 *     green = the green value
	 *     blue = the blue value
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 *
	 * Since: 1.8
	 */
	public static PgAttribute underlineColorNew(ushort red, ushort green, ushort blue)
	{
		auto p = pango_attr_underline_color_new(red, green, blue);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new underline-style attribute.
	 *
	 * Params:
	 *     underline = the underline style.
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 */
	public static PgAttribute underlineNew(PangoUnderline underline)
	{
		auto p = pango_attr_underline_new(underline);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new font variant attribute (normal or small caps)
	 *
	 * Params:
	 *     variant = the variant
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 */
	public static PgAttribute variantNew(PangoVariant variant)
	{
		auto p = pango_attr_variant_new(variant);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * Create a new font weight attribute.
	 *
	 * Params:
	 *     weight = the weight
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 */
	public static PgAttribute weightNew(PangoWeight weight)
	{
		auto p = pango_attr_weight_new(weight);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgAttribute)(cast(PangoAttribute*) p);
	}

	/**
	 * After feeding a pango markup parser some data with g_markup_parse_context_parse(),
	 * use this function to get the list of pango attributes and text out of the
	 * markup. This function will not free @context, use g_markup_parse_context_free()
	 * to do so.
	 *
	 * Params:
	 *     context = A valid parse context that was returned from pango_markup_parser_new()
	 *     attrList = address of return location for a #PangoAttrList, or %NULL
	 *     text = address of return location for text with tags stripped, or %NULL
	 *     accelChar = address of return location for accelerator char, or %NULL
	 *
	 * Return: %FALSE if @error is set, otherwise %TRUE
	 *
	 * Since: 1.31.0
	 *
	 * Throws: GException on failure.
	 */
	public static bool markupParserFinish(SimpleXML context, out PgAttributeList attrList, out string text, out dchar accelChar)
	{
		PangoAttrList* outattrList = null;
		char* outtext = null;
		GError* err = null;
		
		auto p = pango_markup_parser_finish((context is null) ? null : context.getSimpleXMLStruct(), &outattrList, &outtext, &accelChar, &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		attrList = ObjectG.getDObject!(PgAttributeList)(outattrList);
		text = Str.toString(outtext);
		
		return p;
	}

	/**
	 * Parses marked-up text (see
	 * <link linkend="PangoMarkupFormat">markup format</link>) to create
	 * a plain-text string and an attribute list.
	 *
	 * If @accel_marker is nonzero, the given character will mark the
	 * character following it as an accelerator. For example, @accel_marker
	 * might be an ampersand or underscore. All characters marked
	 * as an accelerator will receive a %PANGO_UNDERLINE_LOW attribute,
	 * and the first character so marked will be returned in @accel_char,
	 * when calling finish(). Two @accel_marker characters following each
	 * other produce a single literal @accel_marker character.
	 *
	 * To feed markup to the parser, use g_markup_parse_context_parse()
	 * on the returned #GMarkupParseContext. When done with feeding markup
	 * to the parser, use pango_markup_parser_finish() to get the data out
	 * of it, and then use g_markup_parse_context_free() to free it.
	 *
	 * This function is designed for applications that read pango markup
	 * from streams. To simply parse a string containing pango markup,
	 * the simpler pango_parse_markup() API is recommended instead.
	 *
	 * Params:
	 *     accelMarker = character that precedes an accelerator, or 0 for none
	 *
	 * Return: a #GMarkupParseContext that should be
	 *     destroyed with g_markup_parse_context_free().
	 *
	 * Since: 1.31.0
	 */
	public static SimpleXML markupParserNew(dchar accelMarker)
	{
		auto p = pango_markup_parser_new(accelMarker);
		
		if(p is null)
		{
			return null;
		}
		
		return new SimpleXML(cast(GMarkupParseContext*) p);
	}

	/**
	 * Parses marked-up text (see
	 * <link linkend="PangoMarkupFormat">markup format</link>) to create
	 * a plain-text string and an attribute list.
	 *
	 * If @accel_marker is nonzero, the given character will mark the
	 * character following it as an accelerator. For example, @accel_marker
	 * might be an ampersand or underscore. All characters marked
	 * as an accelerator will receive a %PANGO_UNDERLINE_LOW attribute,
	 * and the first character so marked will be returned in @accel_char.
	 * Two @accel_marker characters following each other produce a single
	 * literal @accel_marker character.
	 *
	 * To parse a stream of pango markup incrementally, use pango_markup_parser_new().
	 *
	 * If any error happens, none of the output arguments are touched except
	 * for @error.
	 *
	 * Params:
	 *     markupText = markup to parse (see <link linkend="PangoMarkupFormat">markup format</link>)
	 *     length = length of @markup_text, or -1 if nul-terminated
	 *     accelMarker = character that precedes an accelerator, or 0 for none
	 *     attrList = address of return location for a #PangoAttrList, or %NULL
	 *     text = address of return location for text with tags stripped, or %NULL
	 *     accelChar = address of return location for accelerator char, or %NULL
	 *
	 * Return: %FALSE if @error is set, otherwise %TRUE
	 *
	 * Throws: GException on failure.
	 */
	public static bool parseMarkup(string markupText, int length, dchar accelMarker, out PgAttributeList attrList, out string text, out dchar accelChar)
	{
		PangoAttrList* outattrList = null;
		char* outtext = null;
		GError* err = null;
		
		auto p = pango_parse_markup(Str.toStringz(markupText), length, accelMarker, &outattrList, &outtext, &accelChar, &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		attrList = ObjectG.getDObject!(PgAttributeList)(outattrList);
		text = Str.toString(outtext);
		
		return p;
	}
}
