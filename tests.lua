local pn = require 'pronouns'

local write = io.write
local print = print
local pairs = pairs

local function pretty(i, pt)
	print(i,"nom = '"..pt.nom.."', obl = '"..pt.obl.."', dpos = '"..pt.dpos.."', ipos = '"..pt.ipos.."'")
end

pretty(pn.createPronoun{nom='n', obl='o', dpos='dp', ipos='ip'})
print()

for k,v in pairs(pn) do
	if type(v) == 'table' then
		pretty(k, v)
	else
		print(k, v)
	end
end
