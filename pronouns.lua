--[=[
[reference link](https://github.com/desecaw13/Owl-House-RPG/blob/10665728226e1fde0164ee9c9e5f1bb3cf642af3/design%20docs/archy.txt#L25)
pronouns- list from enum; they/them, she/her, he/him, it/its, none(name used), neo/custom ([8] long string)

This is a read-only table containing some default pronouns, an option for none, and systems (one for making and using neos, and another for mixing multiple pronoun usage).

array part has pronouns, and hash/key part has functions

https://en.wikipedia.org/wiki/Grammatical_case#Modern_English
subjective/nominative case, objective/oblique case, possessive/genitive case (determiner/dependent and independent forms)
reflexive case = possessive form + 'self' or 'selves'

]=]

local type = type
local tostring = tostring
local assert = assert
local next = next

local t = {
	[0] = false, -- none. should this be false, or empty table, or nil? [start at 1? no it technically isn't a pronoun]

}

--[[ 'number' 'table' 'function'
local Pronoun = {
	nom='string', obl='string', dpos='string', ipos='string',
	isPlural='boolean'}
]]

--[=[
descript: [todo]
params: kwargs;table = { nom;string, obl;string, dpos;string, ipos;string } or kwargs;string
returns: an index;number of `t` and the value;table now stored there.
]=]
function t.createPronoun(kwargs)
	if type(kwargs) ~= 'table' then return t:CreatePronoun({nom=tostring(kwargs)}) end
	assert(next(kwargs), 'The table kwargs cannot be empty.')

	local pn = {
		nom = kwargs.nom or '',
		obl = kwargs.obl or kwargs.nom,
		dpos = kwargs.dpos or kwargs.obl or kwargs.nom or '',
		ipos = kwargs.ipos or kwargs.dpos or kwargs.obl or kwargs.nom or ''
	}

	local index = #t + 1
	t[index] = pn

	return index, pn
end

--[=[
descript: [todo]
params: args;table = { 1;string, 2;string, 3;string, 4;string }
returns: a new pronoun table.
]=]
function t.generateFromTable(args) --[remove `FromTable` ?]
	assert(next(args), 'The table args cannot be empty.')

	local pn = {
		nom = args[1] or '',
		obl = args[2] or args[1],
		dpos = args[3] or args[2] or args[1] or '',
		ipos = args[4] or args[3] or args[2] or args[1] or ''
	}

	return pn
end

t[1] = t.generateFromTable{'it', 'it', 'its', 'its'} -- true neuter
t[2] = t.generateFromTable{'they', 'them', 'their', 'theirs'} -- personal neuter and plural
t[3] = t.generateFromTable{'she', 'her', 'her', 'her'} -- feminine
t[4] = t.generateFromTable{'he', 'him', 'his', 'his'} -- masculine

return t -- todo: return readonly wrapper for `t`
