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
with Sf.Graphics.Color;
with Sf.Graphics.Rect;
with Sf.Graphics.Types;

package Sf.Graphics.Image is
   use Sf.Config;
   use Sf.Graphics.Color;
   use Sf.Graphics.Rect;
   use Sf.Graphics.Types;

   -- ////////////////////////////////////////////////////////////
   -- /// Create a new empty image
   -- ///
   -- /// \return A new sfImage object, or NULL if it failed
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfImage_Create return sfImage_Ptr;

   -- ////////////////////////////////////////////////////////////
   -- /// Create a new image filled with a color
   -- ///
   -- /// \param Width :  Image width
   -- /// \param Height : Image height
   -- /// \param Col :    Image color
   -- ///
   -- /// \return A new sfImage object, or NULL if it failed
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfImage_CreateFromColor (Width, Height : sfUint32; Color : sfColor) return sfImage_Ptr;

   -- ////////////////////////////////////////////////////////////
   -- /// Create a new image from an array of pixels in memory
   -- ///
   -- /// \param Width :  Image width
   -- /// \param Height : Image height
   -- /// \param Data :   Pointer to the pixels in memory (assumed format is RGBA)
   -- ///
   -- /// \return A new sfImage object, or NULL if it failed
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfImage_CreateFromPixels (Width, Height : sfUint32; Data : access constant sfUint8) return sfImage_Ptr;

   -- ////////////////////////////////////////////////////////////
   -- /// Create a new image from a file
   -- ///
   -- /// \param Filename : Path of the image file to load
   -- ///
   -- /// \return A new sfImage object, or NULL if it failed
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfImage_CreateFromFile (Filename : Standard.String) return sfImage_Ptr;

   -- ////////////////////////////////////////////////////////////
   -- /// Create a new image from a file in memory
   -- ///
   -- /// \param Data :        Pointer to the file data in memory
   -- /// \param SizeInBytes : Size of the data to load, in bytes
   -- ///
   -- /// \return A new sfImage object, or NULL if it failed
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfImage_CreateFromMemory (Data : access constant sfInt8; SizeInBytes : sfSize_t) return sfImage_Ptr;

   -- ////////////////////////////////////////////////////////////
   -- /// Destroy an existing image
   -- ///
   -- /// \param Image : Image to delete
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfImage_Destroy (Image : sfImage_Ptr);

   -- ////////////////////////////////////////////////////////////
   -- /// Save the content of an image to a file
   -- ///
   -- /// \param Image :    Image to save
   -- /// \param Filename : Path of the file to save (overwritten if already exist)
   -- ///
   -- /// \return sfTrue if saving was successful
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfImage_SaveToFile (Image : sfImage_Ptr; Filename : Standard.String) return sfBool;

   -- ////////////////////////////////////////////////////////////
   -- /// Create a transparency mask for an image from a specified colorkey
   -- ///
   -- /// \param Image :    Image to modify
   -- /// \param ColorKey : Color to become transparent
   -- /// \param Alpha :    Alpha value to use for transparent pixels
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfImage_CreateMaskFromColor (Image : sfImage_Ptr; ColorKey : sfColor; Alpha : sfUint8);

   -- ////////////////////////////////////////////////////////////
   -- /// Copy pixels from another image onto this one.
   -- /// This function does a slow pixel copy and should only
   -- /// be used at initialization time
   -- ///
   -- /// \param Image :      Destination image
   -- /// \param Source :     Source image to copy
   -- /// \param DestX :      X coordinate of the destination position
   -- /// \param DestY :      Y coordinate of the destination position
   -- /// \param SourceRect : Sub-rectangle of the source image to copy
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfImage_Copy
     (Image        : sfImage_Ptr;
      Source       : sfImage_Ptr;
      DestX, DestY : sfUint32;
      SourceRect   : sfIntRect);

   -- ////////////////////////////////////////////////////////////
   -- /// Create the image from the current contents of the
   -- /// given window
   -- ///
   -- /// \param Image :      Destination image
   -- /// \param Window :     Window to capture
   -- /// \param SourceRect : Sub-rectangle of the screen to copy (empty by default - entire image)
   -- ///
   -- /// \return True if creation was successful
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfImage_CopyScreen
     (Image      : sfImage_Ptr;
      Window     : sfRenderWindow_Ptr;
      SourceRect : sfIntRect)
      return       sfBool;

   -- ////////////////////////////////////////////////////////////
   -- /// Change the color of a pixel of an image
   -- /// Don't forget to call Update when you end modifying pixels
   -- ///
   -- /// \param Image : Image to modify
   -- /// \param X :     X coordinate of pixel in the image
   -- /// \param Y :     Y coordinate of pixel in the image
   -- /// \param Col :   New color for pixel (X, Y)
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfImage_SetPixel (Image : sfImage_Ptr; X, Y : sfUint32; Color : sfColor);

   -- ////////////////////////////////////////////////////////////
   -- /// Get a pixel from an image
   -- ///
   -- /// \param Image : Image to read
   -- /// \param X :     X coordinate of pixel in the image
   -- /// \param Y :     Y coordinate of pixel in the image
   -- ///
   -- /// \return Color of pixel (x, y)
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfImage_GetPixel (Image : sfImage_Ptr; X, Y : sfUint32) return sfColor;

   -- ////////////////////////////////////////////////////////////
   -- /// Get a read-only pointer to the array of pixels of an image (8 bits integers RGBA)
   -- /// Array size is sfImage_GetWidth() x sfImage_GetHeight() x 4
   -- /// This pointer becomes invalid if you reload or resize the image
   -- ///
   -- /// \param Image : Image to read
   -- ///
   -- /// \return Pointer to the array of pixels
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfImage_GetPixelsPtr (Image : sfImage_Ptr) return access sfUint8;

   -- ////////////////////////////////////////////////////////////
   -- /// Bind the image for rendering
   -- ///
   -- /// \param Image : Image to bind
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfImage_Bind (Image : sfImage_Ptr);

   -- ////////////////////////////////////////////////////////////
   -- /// Enable or disable image smooth filter
   -- ///
   -- /// \param Image :  Image to modify
   -- /// \param Smooth : sfTrue to enable smoothing filter, false to disable it
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfImage_SetSmooth (Image : sfImage_Ptr; Smooth : sfBool);

   -- ////////////////////////////////////////////////////////////
   -- /// Return the width of the image
   -- ///
   -- /// \param Image : Image to read
   -- ///
   -- /// \return Width in pixels
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfImage_GetWidth (Image : sfImage_Ptr) return sfUint32;

   -- ////////////////////////////////////////////////////////////
   -- /// Return the height of the image
   -- ///
   -- /// \param Image : Image to read
   -- ///
   -- /// \return Height in pixels
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfImage_GetHeight (Image : sfImage_Ptr) return sfUint32;

   -- ////////////////////////////////////////////////////////////
   -- /// Tells whether the smoothing filter is enabled or not on an image
   -- ///
   -- /// \param Image :  Image to read
   -- ///
   -- /// \return sfTrue if the smoothing filter is enabled
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfImage_IsSmooth (Image : sfImage_Ptr) return sfBool;

private

   pragma Import (C, sfImage_Create, "sfImage_Create");
   pragma Import (C, sfImage_CreateFromColor, "sfImage_CreateFromColor");
   pragma Import (C, sfImage_CreateFromPixels, "sfImage_CreateFromPixels");
   pragma Import (C, sfImage_CreateFromMemory, "sfImage_CreateFromMemory");
   pragma Import (C, sfImage_Destroy, "sfImage_Destroy");
   pragma Import (C, sfImage_CreateMaskFromColor, "sfImage_CreateMaskFromColor");
   pragma Import (C, sfImage_Copy, "sfImage_Copy");
   pragma Import (C, sfImage_CopyScreen, "sfImage_CopyScreen");
   pragma Import (C, sfImage_SetPixel, "sfImage_SetPixel");
   pragma Import (C, sfImage_GetPixel, "sfImage_GetPixel");
   pragma Import (C, sfImage_GetPixelsPtr, "sfImage_GetPixelsPtr");
   pragma Import (C, sfImage_Bind, "sfImage_Bind");
   pragma Import (C, sfImage_SetSmooth, "sfImage_SetSmooth");
   pragma Import (C, sfImage_GetWidth, "sfImage_GetWidth");
   pragma Import (C, sfImage_GetHeight, "sfImage_GetHeight");
   pragma Import (C, sfImage_IsSmooth, "sfImage_IsSmooth");

end Sf.Graphics.Image;
