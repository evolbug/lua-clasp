-- evolbug 2017, MIT License
-- clasp - class library

local class = { init = function()end; extend = function(self, proto) local meta = {}
    local proto = setmetatable(proto or {},{__index=self, __call=function(_,...) local o=setmetatable({},meta) return o,o:init(...) end})
    meta.__index = proto ; for k,v in pairs(proto.__ or {}) do meta['__'..k]=v end ; return proto end }
return setmetatable(class, { __call = class.extend })
