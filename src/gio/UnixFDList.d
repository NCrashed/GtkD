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


module gio.UnixFDList;

private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;
private import gtkc.gio;
public  import gtkc.giotypes;


/**
 * A #GUnixFDList contains a list of file descriptors.  It owns the file
 * descriptors that it contains, closing them when finalized.
 * 
 * It may be wrapped in a #GUnixFDMessage and sent over a #GSocket in
 * the %G_SOCKET_ADDRESS_UNIX family by using g_socket_send_message()
 * and received using g_socket_receive_message().
 * 
 * Note that `<gio/gunixfdlist.h>` belongs to the UNIX-specific GIO
 * interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
 * file when using it.
 */
public class UnixFDList : ObjectG
{
	/** the main Gtk struct */
	protected GUnixFDList* gUnixFDList;

	/** Get the main Gtk struct */
	public GUnixFDList* getUnixFDListStruct()
	{
		return gUnixFDList;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gUnixFDList;
	}

	protected override void setStruct(GObject* obj)
	{
		gUnixFDList = cast(GUnixFDList*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GUnixFDList* gUnixFDList, bool ownedRef = false)
	{
		this.gUnixFDList = gUnixFDList;
		super(cast(GObject*)gUnixFDList, ownedRef);
	}

	/**
	 */

	public static GType getType()
	{
		return g_unix_fd_list_get_type();
	}

	/**
	 * Creates a new #GUnixFDList containing no file descriptors.
	 *
	 * Return: a new #GUnixFDList
	 *
	 * Since: 2.24
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = g_unix_fd_list_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GUnixFDList*) p, true);
	}

	/**
	 * Creates a new #GUnixFDList containing the file descriptors given in
	 * @fds.  The file descriptors become the property of the new list and
	 * may no longer be used by the caller.  The array itself is owned by
	 * the caller.
	 *
	 * Each file descriptor in the array should be set to close-on-exec.
	 *
	 * If @n_fds is -1 then @fds must be terminated with -1.
	 *
	 * Params:
	 *     fds = the initial list of file descriptors
	 *     nFds = the length of #fds, or -1
	 *
	 * Return: a new #GUnixFDList
	 *
	 * Since: 2.24
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(int[] fds)
	{
		auto p = g_unix_fd_list_new_from_array(fds.ptr, cast(int)fds.length);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_from_array");
		}
		
		this(cast(GUnixFDList*) p, true);
	}

	/**
	 * Adds a file descriptor to @list.
	 *
	 * The file descriptor is duplicated using dup(). You keep your copy
	 * of the descriptor and the copy contained in @list will be closed
	 * when @list is finalized.
	 *
	 * A possible cause of failure is exceeding the per-process or
	 * system-wide file descriptor limit.
	 *
	 * The index of the file descriptor in the list is returned.  If you use
	 * this index with g_unix_fd_list_get() then you will receive back a
	 * duplicated copy of the same file descriptor.
	 *
	 * Params:
	 *     fd = a valid open file descriptor
	 *
	 * Return: the index of the appended fd in case of success, else -1
	 *     (and @error is set)
	 *
	 * Since: 2.24
	 *
	 * Throws: GException on failure.
	 */
	public int append(int fd)
	{
		GError* err = null;
		
		auto p = g_unix_fd_list_append(gUnixFDList, fd, &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Gets a file descriptor out of @list.
	 *
	 * @index_ specifies the index of the file descriptor to get.  It is a
	 * programmer error for @index_ to be out of range; see
	 * g_unix_fd_list_get_length().
	 *
	 * The file descriptor is duplicated using dup() and set as
	 * close-on-exec before being returned.  You must call close() on it
	 * when you are done.
	 *
	 * A possible cause of failure is exceeding the per-process or
	 * system-wide file descriptor limit.
	 *
	 * Params:
	 *     index = the index into the list
	 *
	 * Return: the file descriptor, or -1 in case of error
	 *
	 * Since: 2.24
	 *
	 * Throws: GException on failure.
	 */
	public int get(int index)
	{
		GError* err = null;
		
		auto p = g_unix_fd_list_get(gUnixFDList, index, &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Gets the length of @list (ie: the number of file descriptors
	 * contained within).
	 *
	 * Return: the length of @list
	 *
	 * Since: 2.24
	 */
	public int getLength()
	{
		return g_unix_fd_list_get_length(gUnixFDList);
	}

	/**
	 * Returns the array of file descriptors that is contained in this
	 * object.
	 *
	 * After this call, the descriptors remain the property of @list.  The
	 * caller must not close them and must not free the array.  The array is
	 * valid only until @list is changed in any way.
	 *
	 * If @length is non-%NULL then it is set to the number of file
	 * descriptors in the returned array. The returned array is also
	 * terminated with -1.
	 *
	 * This function never returns %NULL. In case there are no file
	 * descriptors contained in @list, an empty array is returned.
	 *
	 * Params:
	 *     length = pointer to the length of the returned
	 *         array, or %NULL
	 *
	 * Return: an array of file
	 *     descriptors
	 *
	 * Since: 2.24
	 */
	public int[] peekFds()
	{
		int length;
		
		auto p = g_unix_fd_list_peek_fds(gUnixFDList, &length);
		
		return p[0 .. length];
	}

	/**
	 * Returns the array of file descriptors that is contained in this
	 * object.
	 *
	 * After this call, the descriptors are no longer contained in
	 * @list. Further calls will return an empty list (unless more
	 * descriptors have been added).
	 *
	 * The return result of this function must be freed with g_free().
	 * The caller is also responsible for closing all of the file
	 * descriptors.  The file descriptors in the array are set to
	 * close-on-exec.
	 *
	 * If @length is non-%NULL then it is set to the number of file
	 * descriptors in the returned array. The returned array is also
	 * terminated with -1.
	 *
	 * This function never returns %NULL. In case there are no file
	 * descriptors contained in @list, an empty array is returned.
	 *
	 * Params:
	 *     length = pointer to the length of the returned
	 *         array, or %NULL
	 *
	 * Return: an array of file
	 *     descriptors
	 *
	 * Since: 2.24
	 */
	public int[] stealFds()
	{
		int length;
		
		auto p = g_unix_fd_list_steal_fds(gUnixFDList, &length);
		
		return p[0 .. length];
	}
}
