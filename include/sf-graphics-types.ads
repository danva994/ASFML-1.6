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

package Sf.Graphics.Types is

   type sfFont is null record;
   type sfFont_Ptr is access all sfFont;
   type sfImage is null record;
   type sfImage_Ptr is access all sfImage;
   type sfPostFX is null record;
   type sfPostFX_Ptr is access all sfPostFX;
   type sfRenderWindow is null record;
   type sfRenderWindow_Ptr is access all sfRenderWindow;
   type sfShape is null record;
   type sfShape_Ptr is access all sfShape;
   type sfSprite is null record;
   type sfSprite_Ptr is access all sfSprite;
   type sfString is null record;
   type sfString_Ptr is access all sfString;
   type sfView is null record;
   type sfView_Ptr is access all sfView;

private

   pragma Convention (C, sfFont);
   pragma Convention (C, sfFont_Ptr);
   pragma Convention (C, sfImage);
   pragma Convention (C, sfImage_Ptr);
   pragma Convention (C, sfPostFX);
   pragma Convention (C, sfPostFX_Ptr);
   pragma Convention (C, sfRenderWindow);
   pragma Convention (C, sfRenderWindow_Ptr);
   pragma Convention (C, sfShape);
   pragma Convention (C, sfShape_Ptr);
   pragma Convention (C, sfSprite);
   pragma Convention (C, sfSprite_Ptr);
   pragma Convention (C, sfString);
   pragma Convention (C, sfString_Ptr);
   pragma Convention (C, sfView);
   pragma Convention (C, sfView_Ptr);

end Sf.Graphics.Types;
