lgi = require 'lgi'
gdk= lgi.Gdk
gtk = lgi.Gtk
gtk.init()

build=gtk.Builder()
build:add_from_file('Lab-03-Rublev.glade')

prov = gtk.CssProvider()
prov:load_from_path('style.css')

ctx=gtk.StyleContext()
scr=gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

uint=build.objects

opt={uint.ARadio, uint.BRadio, uint.CRadio, uint.DRadio, uint.ERadio, uint.FRadio, uint.GRadio, uint.HRadio}
opt_alt={uint.ALockCheck, uint.BLockCheck, uint.CLockCheck, uint.DLockCheck}
function update()
x=0
y=0
z=0
if uint.XCheck.active==true then x=1 end
if uint.YCheck.active==true then y=1 end
if uint.ZCheck.active==true then z=1 end

v=x+y*2+z*4
opt[v+1].active=true

uint.ResultGen.label=v
end

function uint.XCheck:on_clicked(...)
update()
end

function uint.YCheck:on_clicked(...)
update()
end

function uint.ZCheck:on_clicked(...)
update()
end

function update_alt()

hex=8
	if type(tonumber(uint.TextDrop.text))=='number' and tonumber(uint.TextDrop.text)>=-1 and tonumber(uint.TextDrop.text)<16 
	then
	v=tonumber(uint.TextDrop.text)
		for i=4, 1, -1 do
			if v>=hex
			then
			v=v -hex
			hex=hex/2
			opt_alt[i].active=true
			else
			hex=hex/2
			end
		end
	end
end 

function uint.TextDrop:on_changed(...)
for i=4, 1, -1 do
opt_alt[i].active=false
end
update_alt()
end

uint.wnd.title = 'Lab-03-Rublev$$$'
uint.wnd.on_destroy = gtk.main_quit
uint.wnd:show_all()

gtk.main()



