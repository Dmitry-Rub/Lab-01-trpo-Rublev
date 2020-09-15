lgi = require 'lgi'

gtk = lgi.Gtk
gtk.init()
mybuilder=gtk.Builder()
mybuilder:add_from_file('Rublev.glade')

usinterface=mybuilder.objects

usinterface.window.title = 'Rublev_lab-01'

usinterface.window.on_destroy = gtk.main_quit
usinterface.window:show_all()

gtk.main()
