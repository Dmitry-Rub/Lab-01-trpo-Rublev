lgi = require 'lgi'

gtk=lgi.Gtk
pixbuf = lgi.GdkPixbuf.Pixbuf

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-04-rublev.glade')

uint = bld.objects

function uint.BAdd:on_clicked(...)
	name = uint.TName.text
	value = tonumber(uint.TValue.text)
	
	px=pixbuf.new__from_file('img-blueberry.png')

	i=uint.List:append()
	uint.List[i]={[1]=name, [2]=value, [3]=px}
end

rdr_txt = gtk.CellRendererText {}
rdr_pix = gtk.CellRendererPixbuf {}

c1 = gtk.TreeViewColumn { title = 'Name', {rdr_txt, { text=1}}	}
c2 = gtk.TreeViewColumn { title = 'Value', {rdr_txt, { text=2}}	}
c3 = gtk.TreeViewColumn { title = 'Image', {rdr_txt, { text=3}}	}

uint.table:append_column(c1)
uint.table:append_column(c2)
uint.table:append_column(c3)

uint.wnd.title = 'lab-04-rublev'
uint.wnd.on_destroy = gtk.main_quit

