lgi = require 'lgi'

gtk = lgi.Gtk
gtk.init()
build=gtk.Builder()
build:add_from_file('Krivosheev_lab-02.glade')

uint=build.objects

uint.win.title = 'krivosheev_lab-02'
uint.win.on_destroy = gtk.main_quit
uint.win:show_all()



function uint.AddButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
	b=tonumber(uint.SecondNumber.text)
	if type(tonumber(uint.FirstNumber.text))=='number' and type(tonumber(uint.SecondNumber.text))=='number'
	then
	uint.Result.label=a+b
	else
	uint.Result.label='error'
	end
end

function uint.SubtractButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
	b=tonumber(uint.SecondNumber.text)
if type(tonumber(uint.FirstNumber.text))=='number' and type(tonumber(uint.SecondNumber.text))=='number'
	then
	uint.Result.label=a-b
else
	uint.Result.label='error'
	end
end

function uint.MultiplyButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
	b=tonumber(uint.SecondNumber.text)
if type(tonumber(uint.FirstNumber.text))=='number' and type(tonumber(uint.SecondNumber.text))=='number'
	then
	uint.Result.label=a*b
else
	uint.Result.label='error'
	end
end

function uint.DivideButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
	b=tonumber(uint.SecondNumber.text)
if type(tonumber(uint.FirstNumber.text))=='number' and type(tonumber(uint.SecondNumber.text))=='number'
	then
if tonumber(uint.SecondNumber.text)=0
then
	uint.Result.label=a/b
else
uint.Result.label='error'
end
else
	uint.Result.label='error'
	end
end

gtk.main()