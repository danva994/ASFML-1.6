pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Sf.Config;
with System;
with Sf.System.Vector2;

package Sf.Window.Touch is

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

   --//////////////////////////////////////////////////////////
   --//////////////////////////////////////////////////////////
   --/ @brief Check if a touch event is currently down
   --/
   --/ @param finger Finger index
   --/
   --/ @return sfTrue if @a finger is currently touching the screen, sfFalse otherwise
   --/
   --//////////////////////////////////////////////////////////
   function sfTouch_isDown (arg1 : unsigned) return Sf.Config.sfBool;
   pragma Import (C, sfTouch_isDown, "sfTouch_isDown");

   --//////////////////////////////////////////////////////////
   --/ @brief Get the current position of a touch in window coordinates
   --/
   --/ This function returns the current touch position
   --/ relative to the given window, or desktop if NULL is passed.
   --/
   --/ @param finger Finger index
   --/ @param relativeTo Reference window
   --/
   --/ @return Current position of @a finger, or undefined if it's not down
   --/
   --//////////////////////////////////////////////////////////
   function sfTouch_getPosition (arg1 : unsigned; arg2 : Standard.System.Address) return Sf.System.Vector2.sfVector2i;
   pragma Import (C, sfTouch_getPosition, "sfTouch_getPosition");

end Sf.Window.Touch;
