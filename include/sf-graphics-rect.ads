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

package Sf.Graphics.Rect is
   use Sf.Config;

   -- ////////////////////////////////////////////////////////////
   -- /// sfFloatRect and sfIntRect are utility classes for
   -- /// manipulating rectangles.
   -- ////////////////////////////////////////////////////////////
   type sfFloatRect is record
      Left   : aliased Float;
      Top    : aliased Float;
      Right  : aliased Float;
      Bottom : aliased Float;
   end record;

   type sfIntRect is record
      Left   : aliased Integer;
      Top    : aliased Integer;
      Right  : aliased Integer;
      Bottom : aliased Integer;
   end record;

   -- ////////////////////////////////////////////////////////////
   -- /// Move a rectangle by the given offset
   -- ///
   -- /// \param Rect :    Rectangle to move
   -- /// \param OffsetX : Horizontal offset
   -- /// \param OffsetY : Vertical offset
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfFloatRect_Offset (Rect : access sfFloatRect; OffsetX, OffsetY : Float);
   procedure sfIntRect_Offset (Rect : access sfIntRect; OffsetX, OffsetY : Integer);

   -- ////////////////////////////////////////////////////////////
   -- /// Check if a point is inside a rectangle's area
   -- ///
   -- /// \param Rect : Rectangle to test
   -- /// \param X :    X coordinate of the point to test
   -- /// \param Y :    Y coordinate of the point to test
   -- ///
   -- /// \return sfTrue if the point is inside
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFloatRect_Contains (Rect : access sfFloatRect; X, Y : Float) return sfBool;
   function sfIntRect_Contains (Rect : access sfIntRect; X, Y : Float) return sfBool;

   -- ////////////////////////////////////////////////////////////
   -- /// Check intersection between two rectangles
   -- ///
   -- /// \param Rect1 :           First rectangle to test
   -- /// \param Rect2 :           Second rectangle to test
   -- /// \param OverlappingRect : Rectangle to be filled with overlapping rect (can be NULL)
   -- ///
   -- /// \return sfTrue if rectangles overlap
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFloatRect_Intersects (Rect1, Rect2, OverlappingRect : access sfFloatRect) return sfBool;
   function sfIntRect_Intersects (Rect1, Rect2, OverlappingRect : access sfIntRect) return sfBool;

private

   pragma Convention (C_Pass_By_Copy, sfFloatRect);
   pragma Convention (C_Pass_By_Copy, sfIntRect);

   pragma Import (C, sfFloatRect_Offset, "sfFloatRect_Offset");
   pragma Import (C, sfIntRect_Offset, "sfIntRect_Offset");
   pragma Import (C, sfFloatRect_Contains, "sfFloatRect_Contains");
   pragma Import (C, sfIntRect_Contains, "sfIntRect_Contains");
   pragma Import (C, sfFloatRect_Intersects, "sfFloatRect_Intersects");
   pragma Import (C, sfIntRect_Intersects, "sfIntRect_Intersects");

end Sf.Graphics.Rect;
