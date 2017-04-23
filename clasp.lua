-- evolbug 2017, MIT License
-- clasp - class library

local function new(self, ...)
   local meta = {__index=self}
   for k,v in pairs(self.__ or {}) do meta['__'..k]=v end
   local object = setmetatable({}, meta)
   return object.init and object:init(...) and object or object
end
local function extend(base, members) return setmetatable(members, {__index=base,__call=new}) end
return function(members) return extend({new=new, extend=extend}, members or {}) end

