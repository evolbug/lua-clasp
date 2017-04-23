-- evolbug 2017, MIT License
-- clasp - class library

return function (members)
   local cls = {}
   function cls.new (self,...)
      local meta = {__index=self}
      for k,v in pairs(self.__meta or {}) do meta[k]=v end self.__meta=nil
      local object = setmetatable({}, meta)
      return object.init and object:init(...) and object or object
   end
   function cls.extend(base,members) return setmetatable(members,{__index=base,__call=cls.new}) end
   return setmetatable(members or {},{__index=cls,__call=cls.new})
end
