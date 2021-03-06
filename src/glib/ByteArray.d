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


module glib.ByteArray;

private import glib.Bytes;
private import glib.ConstructionException;
private import gtkc.glib;
public  import gtkc.glibtypes;


/**
 * Contains the public fields of a GByteArray.
 */
public class ByteArray
{
	/** the main Gtk struct */
	protected GByteArray* gByteArray;

	/** Get the main Gtk struct */
	public GByteArray* getByteArrayStruct()
	{
		return gByteArray;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gByteArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GByteArray* gByteArray)
	{
		this.gByteArray = gByteArray;
	}

	/**
	 */

	/**
	 * Adds the given bytes to the end of the #GByteArray.
	 * The array will grow in size automatically if necessary.
	 *
	 * Params:
	 *     data = the byte data to be added
	 *     len = the number of bytes to add
	 *
	 * Return: the #GByteArray
	 */
	public ByteArray append(ubyte* data, uint len)
	{
		auto p = g_byte_array_append(gByteArray, data, len);
		
		if(p is null)
		{
			return null;
		}
		
		return new ByteArray(cast(GByteArray*) p);
	}

	/**
	 * Frees the memory allocated by the #GByteArray. If @free_segment is
	 * %TRUE it frees the actual byte data. If the reference count of
	 * @array is greater than one, the #GByteArray wrapper is preserved but
	 * the size of @array will be set to zero.
	 *
	 * Params:
	 *     freeSegment = if %TRUE the actual byte data is freed as well
	 *
	 * Return: the element data if @free_segment is %FALSE, otherwise
	 *     %NULL.  The element data should be freed using g_free().
	 */
	public ubyte* free(bool freeSegment)
	{
		return g_byte_array_free(gByteArray, freeSegment);
	}

	/**
	 * Transfers the data from the #GByteArray into a new immutable #GBytes.
	 *
	 * The #GByteArray is freed unless the reference count of @array is greater
	 * than one, the #GByteArray wrapper is preserved but the size of @array
	 * will be set to zero.
	 *
	 * This is identical to using g_bytes_new_take() and g_byte_array_free()
	 * together.
	 *
	 * Return: a new immutable #GBytes representing same
	 *     byte data that was in the array
	 *
	 * Since: 2.32
	 */
	public Bytes freeToBytes()
	{
		auto p = g_byte_array_free_to_bytes(gByteArray);
		
		if(p is null)
		{
			return null;
		}
		
		return new Bytes(cast(GBytes*) p);
	}

	/**
	 * Creates a new #GByteArray with a reference count of 1.
	 *
	 * Return: the new #GByteArray
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = g_byte_array_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GByteArray*) p);
	}

	/**
	 * Create byte array containing the data. The data will be owned by the array
	 * and will be freed with g_free(), i.e. it could be allocated using g_strdup().
	 *
	 * Params:
	 *     data = byte data for the array
	 *     len = length of @data
	 *
	 * Return: a new #GByteArray
	 *
	 * Since: 2.32
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ubyte[] data)
	{
		auto p = g_byte_array_new_take(data.ptr, cast(size_t)data.length);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_take");
		}
		
		this(cast(GByteArray*) p);
	}

	/**
	 * Adds the given data to the start of the #GByteArray.
	 * The array will grow in size automatically if necessary.
	 *
	 * Params:
	 *     data = the byte data to be added
	 *     len = the number of bytes to add
	 *
	 * Return: the #GByteArray
	 */
	public ByteArray prepend(ubyte* data, uint len)
	{
		auto p = g_byte_array_prepend(gByteArray, data, len);
		
		if(p is null)
		{
			return null;
		}
		
		return new ByteArray(cast(GByteArray*) p);
	}

	/**
	 * Atomically increments the reference count of @array by one.
	 * This function is thread-safe and may be called from any thread.
	 *
	 * Return: The passed in #GByteArray
	 *
	 * Since: 2.22
	 */
	public ByteArray doref()
	{
		auto p = g_byte_array_ref(gByteArray);
		
		if(p is null)
		{
			return null;
		}
		
		return new ByteArray(cast(GByteArray*) p);
	}

	/**
	 * Removes the byte at the given index from a #GByteArray.
	 * The following bytes are moved down one place.
	 *
	 * Params:
	 *     index = the index of the byte to remove
	 *
	 * Return: the #GByteArray
	 */
	public ByteArray removeIndex(uint index)
	{
		auto p = g_byte_array_remove_index(gByteArray, index);
		
		if(p is null)
		{
			return null;
		}
		
		return new ByteArray(cast(GByteArray*) p);
	}

	/**
	 * Removes the byte at the given index from a #GByteArray. The last
	 * element in the array is used to fill in the space, so this function
	 * does not preserve the order of the #GByteArray. But it is faster
	 * than g_byte_array_remove_index().
	 *
	 * Params:
	 *     index = the index of the byte to remove
	 *
	 * Return: the #GByteArray
	 */
	public ByteArray removeIndexFast(uint index)
	{
		auto p = g_byte_array_remove_index_fast(gByteArray, index);
		
		if(p is null)
		{
			return null;
		}
		
		return new ByteArray(cast(GByteArray*) p);
	}

	/**
	 * Removes the given number of bytes starting at the given index from a
	 * #GByteArray.  The following elements are moved to close the gap.
	 *
	 * Params:
	 *     index = the index of the first byte to remove
	 *     length = the number of bytes to remove
	 *
	 * Return: the #GByteArray
	 *
	 * Since: 2.4
	 */
	public ByteArray removeRange(uint index, uint length)
	{
		auto p = g_byte_array_remove_range(gByteArray, index, length);
		
		if(p is null)
		{
			return null;
		}
		
		return new ByteArray(cast(GByteArray*) p);
	}

	/**
	 * Sets the size of the #GByteArray, expanding it if necessary.
	 *
	 * Params:
	 *     length = the new size of the #GByteArray
	 *
	 * Return: the #GByteArray
	 */
	public ByteArray setSize(uint length)
	{
		auto p = g_byte_array_set_size(gByteArray, length);
		
		if(p is null)
		{
			return null;
		}
		
		return new ByteArray(cast(GByteArray*) p);
	}

	/**
	 * Creates a new #GByteArray with @reserved_size bytes preallocated.
	 * This avoids frequent reallocation, if you are going to add many
	 * bytes to the array. Note however that the size of the array is still
	 * 0.
	 *
	 * Params:
	 *     reservedSize = number of bytes preallocated
	 *
	 * Return: the new #GByteArray
	 */
	public static ByteArray sizedNew(uint reservedSize)
	{
		auto p = g_byte_array_sized_new(reservedSize);
		
		if(p is null)
		{
			return null;
		}
		
		return new ByteArray(cast(GByteArray*) p);
	}

	/**
	 * Sorts a byte array, using @compare_func which should be a
	 * qsort()-style comparison function (returns less than zero for first
	 * arg is less than second arg, zero for equal, greater than zero if
	 * first arg is greater than second arg).
	 *
	 * If two array elements compare equal, their order in the sorted array
	 * is undefined. If you want equal elements to keep their order (i.e.
	 * you want a stable sort) you can write a comparison function that,
	 * if two elements would otherwise compare equal, compares them by
	 * their addresses.
	 *
	 * Params:
	 *     compareFunc = comparison function
	 */
	public void sort(GCompareFunc compareFunc)
	{
		g_byte_array_sort(gByteArray, compareFunc);
	}

	/**
	 * Like g_byte_array_sort(), but the comparison function takes an extra
	 * user data argument.
	 *
	 * Params:
	 *     compareFunc = comparison function
	 *     userData = data to pass to @compare_func
	 */
	public void sortWithData(GCompareDataFunc compareFunc, void* userData)
	{
		g_byte_array_sort_with_data(gByteArray, compareFunc, userData);
	}

	/**
	 * Atomically decrements the reference count of @array by one. If the
	 * reference count drops to 0, all memory allocated by the array is
	 * released. This function is thread-safe and may be called from any
	 * thread.
	 *
	 * Since: 2.22
	 */
	public void unref()
	{
		g_byte_array_unref(gByteArray);
	}
}
