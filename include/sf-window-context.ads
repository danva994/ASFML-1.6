--//////////////////////////////////////////////////////////
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
--//////////////////////////////////////////////////////////

--//////////////////////////////////////////////////////////

--//////////////////////////////////////////////////////////
with Sf.Config;
with Sf.Window.Types;
with Sf.Window.Window;

package Sf.Window.Context is
   use Sf.Config;
   use Sf.Window.Types;

   --//////////////////////////////////////////////////////////
   --/ Construct a new context
   --/
   --/ @return New context
   --/
   --//////////////////////////////////////////////////////////
   function sfContext_Create return sfContext_Ptr;

   --//////////////////////////////////////////////////////////
   --/ Destroy an existing context
   --/
   --/ @param Context   Context to destroy
   --/
   --//////////////////////////////////////////////////////////
   procedure sfContext_Destroy (Context : sfContext_Ptr);

   --//////////////////////////////////////////////////////////
   --/ Activate or deactivate a context
   --/
   --/ @param Context   Context to activate or deactivate
   --/ @param Active    sfTrue to activate, sfFalse to deactivate
   --/
   --//////////////////////////////////////////////////////////
   procedure sfContext_SetActive (Context : sfContext_Ptr; Active : sfBool);

   --//////////////////////////////////////////////////////////
   --/ @brief Get the settings of the context.
   --/
   --/ Note that these settings may be different than the ones passed to the
   --/ constructor; they are indeed adjusted if the original settings are not
   --/ directly supported by the system.
   --/
   --/ @return Structure containing the settings
   --/
   --//////////////////////////////////////////////////////////
   function sfContext_getSettings (Context : sfContext_Ptr) return Sf.Window.Window.sfContextSettings;

private

   pragma Import (C, sfContext_Create, "sfContext_create");
   pragma Import (C, sfContext_Destroy, "sfContext_destroy");
   pragma Import (C, sfContext_SetActive, "sfContext_setActive");
   pragma Import (C, sfContext_getSettings, "sfContext_getSettings");

end Sf.Window.Context;
