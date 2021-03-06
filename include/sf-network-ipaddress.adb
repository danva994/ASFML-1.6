-- ////////////////////////////////////////////////////////////
-- //
-- // SFML - Simple and Fast Multimedia Library
-- // Copyright (C) 2007-2009 Laurent Gomila (laurent.gom@gmail.com)
-- //
-- // This software is provided 'as-is', without any express or implied warranty.
-- // In no event will the authors be held liable for any damages arising from the use of this software.
-- //
-- // Permission is granted to anyone to use this software for any purpose,
-- // including commercial applications, and to alter it and redistribute it freely,
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
-- // 3. This notice may not be removed or altered from any source distribution.
-- //
-- ////////////////////////////////////////////////////////////

-- ////////////////////////////////////////////////////////////
-- // Headers
-- ////////////////////////////////////////////////////////////
with Interfaces.C.Strings;

package body Sf.Network.IPAddress is
   use Interfaces.C.Strings;

   -- ////////////////////////////////////////////////////////////
   -- /// Construct an address from a string
   -- ///
   -- /// \param String :  IP address ("xxx.xxx.xxx.xxx") or network name
   -- ///
   -- /// \return Resulting address
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfIPAddress_FromString (Str : String) return sfIPAddress is
      function Internal (Str : chars_ptr) return sfIPAddress;
      pragma Import (C, Internal, "sfIPAddress_FromString");
      Temp : chars_ptr   := New_String (Str);
      R    : sfIPAddress := Internal (Temp);
   begin
      Free (Temp);
      return R;
   end sfIPAddress_FromString;

   -- ////////////////////////////////////////////////////////////
   -- /// Get a string representation of an address
   -- ///
   -- /// \param Address : Address to convert
   -- /// \param String :  Char array to fill (size must be >= 16)
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfIPAddress_ToString (Address : sfIPAddress; Str : out String) is
      procedure Internal (Address : sfIPAddress; Str : chars_ptr);
      pragma Import (C, Internal, "sfIPAddress_ToString");
      Temp : chars_ptr;
   begin
      Internal (Address, Temp);
      Str (Str'FIRST .. Str'FIRST + 16) := Value (Temp) (0 .. 15);
   end sfIPAddress_ToString;

end Sf.Network.IPAddress;
