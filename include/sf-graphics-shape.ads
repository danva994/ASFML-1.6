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

with Interfaces.C; use Interfaces.C;
with System;
with Sf.System.Vector2;
with Sf.Graphics.Transform;
with Sf.Config;
with Sf.Graphics.Rect;
with Sf.Graphics.Color;
with Sf.Graphics.Types;

package Sf.Graphics.Shape is
   use Types;

   --/< Type of the callback used to get the number of points in a shape
   type sfShapeGetPointCountCallback is access function
     (userData : Standard.System.Address) return size_t;
   pragma Convention (C, sfShapeGetPointCountCallback);

   --/< Type of the callback used to get a point of a shape
   type sfShapeGetPointCallback is access function
     (size : size_t; userData : Standard.System.Address) return Sf.System.Vector2.sfVector2f;
   pragma Convention (C, sfShapeGetPointCallback);

   --//////////////////////////////////////////////////////////
   --/ \brief Create a new shape
   --/
   --/ \param getPointCount Callback that provides the point count of the shape
   --/ \param getPoint      Callback that provides the points of the shape
   --/ \param userData      Data to pass to the callback functions
   --/
   --/ \return A new sfShape object
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_create
     (getPointCount : sfShapeGetPointCountCallback;
      getPoint : sfShapeGetPointCallback;
      userData : Standard.System.Address) return sfShape_Ptr;

   --//////////////////////////////////////////////////////////
   --/ \brief Destroy an existing shape
   --/
   --/ \param shape Shape to delete
   --/
   --//////////////////////////////////////////////////////////
   procedure sfShape_destroy (shape : sfShape_Ptr);

   --//////////////////////////////////////////////////////////
   --/ \brief Set the position of a shape
   --/
   --/ This function completely overwrites the previous position.
   --/ See sfShape_move to apply an offset based on the previous position instead.
   --/ The default position of a circle Shape object is (0, 0).
   --/
   --/ \param shape    Shape object
   --/ \param position New position
   --/
   --//////////////////////////////////////////////////////////
   procedure sfShape_setPosition (shape : sfShape_Ptr; position : Sf.System.Vector2.sfVector2f);

   --//////////////////////////////////////////////////////////
   --/ \brief Set the orientation of a shape
   --/
   --/ This function completely overwrites the previous rotation.
   --/ See sfShape_rotate to add an angle based on the previous rotation instead.
   --/ The default rotation of a circle Shape object is 0.
   --/
   --/ \param shape Shape object
   --/ \param angle New rotation, in degrees
   --/
   --//////////////////////////////////////////////////////////
   procedure sfShape_setRotation (shape : sfShape_Ptr; angle : float);

   --//////////////////////////////////////////////////////////
   --/ \brief Set the scale factors of a shape
   --/
   --/ This function completely overwrites the previous scale.
   --/ See sfShape_scale to add a factor based on the previous scale instead.
   --/ The default scale of a circle Shape object is (1, 1).
   --/
   --/ \param shape Shape object
   --/ \param scale New scale factors
   --/
   --//////////////////////////////////////////////////////////
   procedure sfShape_setScale (shape : sfShape_Ptr; scale : Sf.System.Vector2.sfVector2f);

   --//////////////////////////////////////////////////////////
   --/ \brief Set the local origin of a shape
   --/
   --/ The origin of an object defines the center point for
   --/ all transformations (position, scale, rotation).
   --/ The coordinates of this point must be relative to the
   --/ top-left corner of the object, and ignore all
   --/ transformations (position, scale, rotation).
   --/ The default origin of a circle Shape object is (0, 0).
   --/
   --/ \param shape  Shape object
   --/ \param origin New origin
   --/
   --//////////////////////////////////////////////////////////
   procedure sfShape_setOrigin (shape : sfShape_Ptr; origin : Sf.System.Vector2.sfVector2f);

   --//////////////////////////////////////////////////////////
   --/ \brief Get the position of a shape
   --/
   --/ \param shape Shape object
   --/
   --/ \return Current position
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getPosition (shape : sfShape_Ptr) return Sf.System.Vector2.sfVector2f;

   --//////////////////////////////////////////////////////////
   --/ \brief Get the orientation of a shape
   --/
   --/ The rotation is always in the range [0, 360].
   --/
   --/ \param shape Shape object
   --/
   --/ \return Current rotation, in degrees
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getRotation (shape : sfShape_Ptr) return float;

   --//////////////////////////////////////////////////////////
   --/ \brief Get the current scale of a shape
   --/
   --/ \param shape Shape object
   --/
   --/ \return Current scale factors
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getScale (shape : sfShape_Ptr) return Sf.System.Vector2.sfVector2f;

   --//////////////////////////////////////////////////////////
   --/ \brief Get the local origin of a shape
   --/
   --/ \param shape Shape object
   --/
   --/ \return Current origin
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getOrigin (shape : sfShape_Ptr) return Sf.System.Vector2.sfVector2f;

   --//////////////////////////////////////////////////////////
   --/ \brief Move a shape by a given offset
   --/
   --/ This function adds to the current position of the object,
   --/ unlike sfShape_setPosition which overwrites it.
   --/
   --/ \param shape  Shape object
   --/ \param offset Offset
   --/
   --//////////////////////////////////////////////////////////
   procedure sfShape_move (shape : sfShape_Ptr; offset : Sf.System.Vector2.sfVector2f);

   --//////////////////////////////////////////////////////////
   --/ \brief Rotate a shape
   --/
   --/ This function adds to the current rotation of the object,
   --/ unlike sfShape_setRotation which overwrites it.
   --/
   --/ \param shape Shape object
   --/ \param angle Angle of rotation, in degrees
   --/
   --//////////////////////////////////////////////////////////
   procedure sfShape_rotate (shape : sfShape_Ptr; angle : float);

   --//////////////////////////////////////////////////////////
   --/ \brief Scale a shape
   --/
   --/ This function multiplies the current scale of the object,
   --/ unlike sfShape_setScale which overwrites it.
   --/
   --/ \param shape   Shape object
   --/ \param factors Scale factors
   --/
   --//////////////////////////////////////////////////////////
   procedure sfShape_scale (shape : sfShape_Ptr; factors : Sf.System.Vector2.sfVector2f);

   --//////////////////////////////////////////////////////////
   --/ \brief Get the combined transform of a shape
   --/
   --/ \param shape shape object
   --/
   --/ \return Transform combining the position/rotation/scale/origin of the object
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getTransform (shape : sfShape_Ptr) return Sf.Graphics.Transform.sfTransform;

   --//////////////////////////////////////////////////////////
   --/ \brief Get the inverse of the combined transform of a shape
   --/
   --/ \param shape shape object
   --/
   --/ \return Inverse of the combined transformations applied to the object
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getInverseTransform (shape : sfShape_Ptr) return Sf.Graphics.Transform.sfTransform;

   --//////////////////////////////////////////////////////////
   --/ \brief Change the source texture of a shape
   --/
   --/ The \a texture argument refers to a texture that must
   --/ exist as long as the shape uses it. Indeed, the shape
   --/ doesn't store its own copy of the texture, but rather keeps
   --/ a pointer to the one that you passed to this function.
   --/ If the source texture is destroyed and the shape tries to
   --/ use it, the behaviour is undefined.
   --/ \a texture can be NULL to disable texturing.
   --/ If \a resetRect is true, the TextureRect property of
   --/ the shape is automatically adjusted to the size of the new
   --/ texture. If it is false, the texture rect is left unchanged.
   --/
   --/ \param shape     Shape object
   --/ \param texture   New texture
   --/ \param resetRect Should the texture rect be reset to the size of the new texture?
   --/
   --//////////////////////////////////////////////////////////
   procedure sfShape_setTexture
     (shape : sfShape_Ptr;
      texture : sfTexture_Ptr;
      resetRect : Sf.Config.sfBool);

   --//////////////////////////////////////////////////////////
   --/ \brief Set the sub-rectangle of the texture that a shape will display
   --/
   --/ The texture rect is useful when you don't want to display
   --/ the whole texture, but rather a part of it.
   --/ By default, the texture rect covers the entire texture.
   --/
   --/ \param shape Shape object
   --/ \param rect  Rectangle defining the region of the texture to display
   --/
   --//////////////////////////////////////////////////////////
   procedure sfShape_setTextureRect (shape : sfShape_Ptr; rect : Sf.Graphics.Rect.sfIntRect);

   --//////////////////////////////////////////////////////////
   --/ \brief Set the fill color of a shape
   --/
   --/ This color is modulated (multiplied) with the shape's
   --/ texture if any. It can be used to colorize the shape,
   --/ or change its global opacity.
   --/ You can use sfTransparent to make the inside of
   --/ the shape transparent, and have the outline alone.
   --/ By default, the shape's fill color is opaque white.
   --/
   --/ \param shape Shape object
   --/ \param color New color of the shape
   --/
   --//////////////////////////////////////////////////////////
   procedure sfShape_setFillColor (shape : sfShape_Ptr; color : Sf.Graphics.Color.sfColor);

   --//////////////////////////////////////////////////////////
   --/ \brief Set the outline color of a shape
   --/
   --/ You can use sfTransparent to disable the outline.
   --/ By default, the shape's outline color is opaque white.
   --/
   --/ \param shape Shape object
   --/ \param color New outline color of the shape
   --/
   --//////////////////////////////////////////////////////////
   procedure sfShape_setOutlineColor (shape : sfShape_Ptr; color : Sf.Graphics.Color.sfColor);

   --//////////////////////////////////////////////////////////
   --/ \brief Set the thickness of a shape's outline
   --/
   --/ This number cannot be negative. Using zero disables
   --/ the outline.
   --/ By default, the outline thickness is 0.
   --/
   --/ \param shape     Shape object
   --/ \param thickness New outline thickness
   --/
   --//////////////////////////////////////////////////////////
   procedure sfShape_setOutlineThickness (shape : sfShape_Ptr; thickness : float);

   --//////////////////////////////////////////////////////////
   --/ \brief Get the source texture of a shape
   --/
   --/ If the shape has no source texture, a NULL pointer is returned.
   --/ The returned pointer is const, which means that you can't
   --/ modify the texture when you retrieve it with this function.
   --/
   --/ \param shape Shape object
   --/
   --/ \return Pointer to the shape's texture
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getTexture (shape : sfShape_Ptr) return sfTexture_Ptr;

   --//////////////////////////////////////////////////////////
   --/ \brief Get the sub-rectangle of the texture displayed by a shape
   --/
   --/ \param shape Shape object
   --/
   --/ \return Texture rectangle of the shape
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getTextureRect (shape : sfShape_Ptr) return Sf.Graphics.Rect.sfIntRect;

   --//////////////////////////////////////////////////////////
   --/ \brief Get the fill color of a shape
   --/
   --/ \param shape Shape object
   --/
   --/ \return Fill color of the shape
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getFillColor (shape : sfShape_Ptr) return Sf.Graphics.Color.sfColor;

   --//////////////////////////////////////////////////////////
   --/ \brief Get the outline color of a shape
   --/
   --/ \param shape Shape object
   --/
   --/ \return Outline color of the shape
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getOutlineColor (shape : sfShape_Ptr) return Sf.Graphics.Color.sfColor;

   --//////////////////////////////////////////////////////////
   --/ \brief Get the outline thickness of a shape
   --/
   --/ \param shape Shape object
   --/
   --/ \return Outline thickness of the shape
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getOutlineThickness (shape : sfShape_Ptr) return float;

   --//////////////////////////////////////////////////////////
   --/ \brief Get the total number of points of a shape
   --/
   --/ \param shape Shape object
   --/
   --/ \return Number of points of the shape
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getPointCount (shape : sfShape_Ptr) return size_t;

   --//////////////////////////////////////////////////////////
   --/ \brief Get a point of a shape
   --/
   --/ The result is undefined if \a index is out of the valid range.
   --/
   --/ \param shape Shape object
   --/ \param index Index of the point to get, in range [0 .. getPointCount() - 1]
   --/
   --/ \return Index-th point of the shape
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getPoint (shape : sfShape_Ptr; index : size_t) return Sf.System.Vector2.sfVector2f;

   --//////////////////////////////////////////////////////////
   --/ \brief Get the local bounding rectangle of a shape
   --/
   --/ The returned rectangle is in local coordinates, which means
   --/ that it ignores the transformations (translation, rotation,
   --/ scale, ...) that are applied to the entity.
   --/ In other words, this function returns the bounds of the
   --/ entity in the entity's coordinate system.
   --/
   --/ \param shape Shape object
   --/
   --/ \return Local bounding rectangle of the entity
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getLocalBounds (shape : sfShape_Ptr) return Sf.Graphics.Rect.sfFloatRect;

   --//////////////////////////////////////////////////////////
   --/ \brief Get the global bounding rectangle of a shape
   --/
   --/ The returned rectangle is in global coordinates, which means
   --/ that it takes in account the transformations (translation,
   --/ rotation, scale, ...) that are applied to the entity.
   --/ In other words, this function returns the bounds of the
   --/ sprite in the global 2D world's coordinate system.
   --/
   --/ \param shape Shape object
   --/
   --/ \return Global bounding rectangle of the entity
   --/
   --//////////////////////////////////////////////////////////
   function sfShape_getGlobalBounds (shape : sfShape_Ptr) return Sf.Graphics.Rect.sfFloatRect;

   --//////////////////////////////////////////////////////////
   --/ \brief Recompute the internal geometry of a shape
   --/
   --/ This function must be called by specialized shape objects
   --/ everytime their points change (ie. the result of either
   --/ the getPointCount or getPoint callbacks is different).
   --/
   --//////////////////////////////////////////////////////////
   procedure sfShape_update (shape : sfShape_Ptr);

private

   pragma Import (C, sfShape_create, "sfShape_create");
   pragma Import (C, sfShape_destroy, "sfShape_destroy");
   pragma Import (C, sfShape_setPosition, "sfShape_setPosition");
   pragma Import (C, sfShape_setRotation, "sfShape_setRotation");
   pragma Import (C, sfShape_setScale, "sfShape_setScale");
   pragma Import (C, sfShape_setOrigin, "sfShape_setOrigin");
   pragma Import (C, sfShape_getPosition, "sfShape_getPosition");
   pragma Import (C, sfShape_getRotation, "sfShape_getRotation");
   pragma Import (C, sfShape_getScale, "sfShape_getScale");
   pragma Import (C, sfShape_getOrigin, "sfShape_getOrigin");
   pragma Import (C, sfShape_move, "sfShape_move");
   pragma Import (C, sfShape_rotate, "sfShape_rotate");
   pragma Import (C, sfShape_scale, "sfShape_scale");
   pragma Import (C, sfShape_getTransform, "sfShape_getTransform");
   pragma Import (C, sfShape_getInverseTransform, "sfShape_getInverseTransform");
   pragma Import (C, sfShape_setTexture, "sfShape_setTexture");
   pragma Import (C, sfShape_setTextureRect, "sfShape_setTextureRect");
   pragma Import (C, sfShape_setFillColor, "sfShape_setFillColor");
   pragma Import (C, sfShape_setOutlineColor, "sfShape_setOutlineColor");
   pragma Import (C, sfShape_setOutlineThickness, "sfShape_setOutlineThickness");
   pragma Import (C, sfShape_getTexture, "sfShape_getTexture");
   pragma Import (C, sfShape_getTextureRect, "sfShape_getTextureRect");
   pragma Import (C, sfShape_getFillColor, "sfShape_getFillColor");
   pragma Import (C, sfShape_getOutlineColor, "sfShape_getOutlineColor");
   pragma Import (C, sfShape_getOutlineThickness, "sfShape_getOutlineThickness");
   pragma Import (C, sfShape_getPointCount, "sfShape_getPointCount");
   pragma Import (C, sfShape_getPoint, "sfShape_getPoint");
   pragma Import (C, sfShape_getLocalBounds, "sfShape_getLocalBounds");
   pragma Import (C, sfShape_getGlobalBounds, "sfShape_getGlobalBounds");
   pragma Import (C, sfShape_update, "sfShape_update");

end Sf.Graphics.Shape;
