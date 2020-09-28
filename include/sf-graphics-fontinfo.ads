pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package Sf.Graphics.FontInfo is

  --//////////////////////////////////////////////////////////
  -- SFML - Simple and Fast Multimedia Library
  -- Copyright (C) 2007-2015 Laurent Gomila (laurent@sfml-dev.org)
  -- This software is provided 'as-is', without any express or implied warranty.
  -- In no event will the authors be held liable for any damages arising from the use of this software.
  -- Permission is granted to anyone to use this software for any purpose,
  -- including commercial applications, and to alter it and redistribute it freely,
  -- subject to the following restrictions:
  -- 1. The origin of this software must not be misrepresented;
  --    you must not claim that you wrote the original software.
  --    If you use this software in a product, an acknowledgment
  --    in the product documentation would be appreciated but is not required.
  -- 2. Altered source versions must be plainly marked as such,
  --    and must not be misrepresented as being the original software.
  -- 3. This notice may not be removed or altered from any source distribution.
  --//////////////////////////////////////////////////////////
  --//////////////////////////////////////////////////////////
  -- Headers
  --//////////////////////////////////////////////////////////
  --//////////////////////////////////////////////////////////
  --/ sfFontInfo holds various information about a font
  --//////////////////////////////////////////////////////////
   type sfFontInfo is record
      family : Interfaces.C.Strings.chars_ptr;  -- /usr/include/SFML/Graphics/FontInfo.h:38
   end record;
   pragma Convention (C_Pass_By_Copy, sfFontInfo);  -- /usr/include/SFML/Graphics/FontInfo.h:39

end Sf.Graphics.FontInfo;