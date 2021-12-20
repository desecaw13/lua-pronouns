local pn = require 'pronouns'

local function pretty(i, pt) -- more like pretty bad
	io.write(i..": ")
	io.write("nom = '")
	io.write(pt.nom)
	io.write("', obl = '")
	io.write(pt.obl)
	io.write("', dpos = '")
	io.write(pt.dpos)
	io.write("', ipos = '")
	io.write(pt.ipos)
	io.write("'\n")
end

pretty(pn.createPronoun{nom='n', obl='o', dpos='dp', ipos='ip'})
