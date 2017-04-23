# lua-clasp
Tiny Lua class libary

## Usage
### Basic class
```lua
class = require "clasp"

Vector = class {
  isVector = true; -- static values

  init = function(self, x, y) -- initializer function
    self.x = x
    self.y = y
  end;
}

a = Vector(10, 10)
print('Vector:', a.x, a.y, a.isVector) -- "Vector: 10 10 true"
```

### Inheritance
```lua
Vector3 = Vector:extend {
  init = function(self, x, y, z) -- function overriding
    Vector.init(self, x, y) -- superclass method call
    self.z = z
  end;
}

b = Vector3(1, 2, 3)
print('Vector3:', b.x, b.y, b.z, b.isVector) -- "Vector3: 1 2 3 true"
```

### Metamethods
```lua
Point = class {
  init = function(self, x, y)
    self.x = x
    self.y = y
  end;
  __ = { -- metamethod table
    tostring = function(self)
      return 'Point('..tostring(self.x)..', '..tostring(self.y)..')'
    end;
  };
}

c = Point(15, 25)
print(c) -- "Point(15, 25)"
```
