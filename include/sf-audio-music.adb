-- ////////////////////////////////////////////////////////////
-- //
-- // SFML - Simple and Fast Multimedia Library
-- // Copyright (C) 2007-2009 Laurent Gomila (laurent.gom@gmail.com)
-- //
-- // This software is provided 'as-is', without any express or implied
-- // warranty.
-- // In no event will the authors be held liable for any damages arising from
-- // the use of this software.
-- //
-- // Permission is granted to anyone to use this software for any purpose,
-- // including commercial applications, and to alter it and redistribute it
-- // freely,
-- // subject to the following restrictions:
-- //
-- // 1. The origin of this software must not be misrepresented;
-- //    you must not claim that you wrote the original software.
-- //    If you use this software in a product, an acknowledgment
-- //    in the product documentation would be appreciated but is not required.
-- //
-- // 2. Altered source versions must be plainly marked as such,
-- //    and must not be misrepresented as being the original software.
-- //
-- // 3. This notice may not be removed or altered from any source
-- //    distribution.
-- //
-- ////////////////////////////////////////////////////////////

-- ////////////////////////////////////////////////////////////
-- // Headers
-- ////////////////////////////////////////////////////////////
with Interfaces.C.Strings;

package body Sf.Audio.Music is

   -- ////////////////////////////////////////////////////////////
   -- /// Create a new music and load it from a file
   -- ///
   -- /// \param Filename : Path of the music file to open
   -- ///
   -- /// \return A new sfMusic object (NULL if failed)
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfMusic_CreateFromFile (Filename : String) return sfMusic_Ptr is
      function Internal (Filename : Interfaces.C.Strings.chars_ptr) return sfMusic_Ptr;
      pragma Import (C, Internal, "sfMusic_CreateFromFile");
      Temp : Interfaces.C.Strings.chars_ptr := Interfaces.C.Strings.New_String (Filename);
   begin
      return R : sfMusic_Ptr do
         R := Internal (Temp);
         Interfaces.C.Strings.Free (Temp);
      end return;
   end sfMusic_CreateFromFile;

end Sf.Audio.Music;
