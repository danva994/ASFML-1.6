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
with Sf.Config;

package Sf.Graphics.Color is
   use Sf.Config;

   -- ////////////////////////////////////////////////////////////
   -- /// sfColor is an utility class for manipulating colors
   -- ////////////////////////////////////////////////////////////
   type sfColor is record
      r : aliased sfUint8;
      g : aliased sfUint8;
      b : aliased sfUint8;
      a : aliased sfUint8;
   end record;
   pragma Convention (C_Pass_By_Copy, sfColor);

   -- ////////////////////////////////////////////////////////////
   -- /// Define some common colors
   -- ////////////////////////////////////////////////////////////
   sfBlack   : constant sfColor := (0, 0, 0, 255);
   sfWhite   : constant sfColor := (255, 255, 255, 255);
   sfRed     : constant sfColor := (255, 0, 0, 255);
   sfGreen   : constant sfColor := (0, 255, 0, 255);
   sfBlue    : constant sfColor := (0, 0, 255, 255);
   sfYellow  : constant sfColor := (255, 255, 0, 255);
   sfMagenta : constant sfColor := (255, 0, 255, 255);
   sfCyan    : constant sfColor := (0, 255, 255, 255);

   -- ////////////////////////////////////////////////////////////
   -- /// Construct a color from its 3 RGB components
   -- ///
   -- /// \param R : Red component   (0 .. 255)
   -- /// \param G : Green component (0 .. 255)
   -- /// \param B : Blue component  (0 .. 255)
   -- ///
   -- /// \return sfColor constructed from the components
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfColor_FromRGB (R, G, B : sfUint8) return sfColor;

   -- ////////////////////////////////////////////////////////////
   -- /// Construct a color from its 4 RGBA components
   -- ///
   -- /// \param R : Red component   (0 .. 255)
   -- /// \param G : Green component (0 .. 255)
   -- /// \param B : Blue component  (0 .. 255)
   -- /// \param A : Alpha component (0 .. 255)
   -- ///
   -- /// \return sfColor constructed from the components
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfColor_FromRGBA (R, G, B, A : sfUint8) return sfColor;

   -- ////////////////////////////////////////////////////////////
   -- /// Add two colors
   -- ///
   -- /// \param Color1 : First color
   -- /// \param Color2 : Second color
   -- ///
   -- /// \return Component-wise saturated addition of the two colors
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfColor_Add (Color1, Color2 : sfColor) return sfColor;

   -- ////////////////////////////////////////////////////////////
   -- /// Modulate two colors
   -- ///
   -- /// \param Color1 : First color
   -- /// \param Color2 : Second color
   -- ///
   -- /// \return Component-wise multiplication of the two colors
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfColor_Modulate (Color1, Color2 : sfColor) return sfColor;

private

   pragma Import (C, sfColor_FromRGB, "sfColor_FromRGB");
   pragma Import (C, sfColor_FromRGBA, "sfColor_FromRGBA");
   pragma Import (C, sfColor_Add, "sfColor_Add");
   pragma Import (C, sfColor_Modulate, "sfColor_Modulate");

end Sf.Graphics.Color;
