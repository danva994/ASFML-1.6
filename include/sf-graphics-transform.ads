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
with Sf.System.Vector2;
with Sf.Graphics.Rect;

package Sf.Graphics.Transform is

   --//////////////////////////////////////////////////////////
   --/ @brief Encapsulate a 3x3 transform matrix
   --/
   --//////////////////////////////////////////////////////////
   type sfTransform_matrix_array is array (0 .. 8) of aliased float;
   type sfTransform is record
      matrix : aliased sfTransform_matrix_array;
   end record;
   pragma Convention (C_Pass_By_Copy, sfTransform);

   --//////////////////////////////////////////////////////////
   --/ @brief Identity transform (does nothing)
   --/
   --//////////////////////////////////////////////////////////
   sfTransform_Identity : aliased sfTransform;
   pragma Import (C, sfTransform_Identity, "sfTransform_Identity");

   --//////////////////////////////////////////////////////////
   --/ @brief Create a new transform from a matrix
   --/
   --/ @param a00 Element (0, 0) of the matrix
   --/ @param a01 Element (0, 1) of the matrix
   --/ @param a02 Element (0, 2) of the matrix
   --/ @param a10 Element (1, 0) of the matrix
   --/ @param a11 Element (1, 1) of the matrix
   --/ @param a12 Element (1, 2) of the matrix
   --/ @param a20 Element (2, 0) of the matrix
   --/ @param a21 Element (2, 1) of the matrix
   --/ @param a22 Element (2, 2) of the matrix
   --/
   --/ @return A new sfTransform object
   --/
   --//////////////////////////////////////////////////////////
   function sfTransform_fromMatrix
     (a00 : float;
      a01 : float;
      a02 : float;
      a10 : float;
      a11 : float;
      a12 : float;
      a20 : float;
      a21 : float;
      a22 : float) return sfTransform;
   pragma Import (C, sfTransform_fromMatrix, "sfTransform_fromMatrix");

   --//////////////////////////////////////////////////////////
   --/ @brief Return the 4x4 matrix of a transform
   --/
   --/ This function fills an array of 16 floats with the transform
   --/ converted as a 4x4 matrix, which is directly compatible with
   --/ OpenGL functions.
   --/
   --/ @code
   --/ sfTransform transform = ...;
   --/ float matrix[16];
   --/ sfTransform_getMatrix(&transform, matrix)
   --/ glLoadMatrixf(matrix);
   --/ @endcode
   --/
   --/ @param transform Transform object
   --/ @param matrix Pointer to the 16-element array to fill with the matrix
   --/
   --//////////////////////////////////////////////////////////
   procedure sfTransform_getMatrix (Transform : access constant sfTransform;
                                    Matrix : access float);
   pragma Import (C, sfTransform_getMatrix, "sfTransform_getMatrix");

   --//////////////////////////////////////////////////////////
   --/ @brief Return the inverse of a transform
   --/
   --/ If the inverse cannot be computed, a new identity transform
   --/ is returned.
   --/
   --/ @param transform Transform object
   --/ @return The inverse matrix
   --/
   --//////////////////////////////////////////////////////////
   function sfTransform_getInverse (Transform : access constant sfTransform) return sfTransform;
   pragma Import (C, sfTransform_getInverse, "sfTransform_getInverse");

   --//////////////////////////////////////////////////////////
   --/ @brief Apply a transform to a 2D point
   --/
   --/ @param transform Transform object
   --/ @param point     Point to transform
   --/
   --/ @return Transformed point
   --/
   --//////////////////////////////////////////////////////////
   function sfTransform_transformPoint (Transform : access constant sfTransform;
                                        Point : System.Vector2.sfVector2f) return System.Vector2.sfVector2f;
   pragma Import (C, sfTransform_transformPoint, "sfTransform_transformPoint");

   --//////////////////////////////////////////////////////////
   --/ @brief Apply a transform to a rectangle
   --/
   --/ Since SFML doesn't provide support for oriented rectangles,
   --/ the result of this function is always an axis-aligned
   --/ rectangle. Which means that if the transform contains a
   --/ rotation, the bounding rectangle of the transformed rectangle
   --/ is returned.
   --/
   --/ @param transform Transform object
   --/ @param rectangle Rectangle to transform
   --/
   --/ @return Transformed rectangle
   --/
   --//////////////////////////////////////////////////////////
   function sfTransform_transformRect (Transform : access constant sfTransform;
                                       Rectangle : Sf.Graphics.Rect.sfFloatRect) return Sf.Graphics.Rect.sfFloatRect;
   pragma Import (C, sfTransform_transformRect, "sfTransform_transformRect");

   --//////////////////////////////////////////////////////////
   --/ @brief Combine two transforms
   --/
   --/ The result is a transform that is equivalent to applying
   --/ @a transform followed by @a other. Mathematically, it is
   --/ equivalent to a matrix multiplication.
   --/
   --/ @param transform Transform object
   --/ @param other     Transform to combine to @a transform
   --/
   --//////////////////////////////////////////////////////////
   procedure sfTransform_combine (Transform : access sfTransform; Other : access constant sfTransform);
   pragma Import (C, sfTransform_combine, "sfTransform_combine");

   --//////////////////////////////////////////////////////////
   --/ @brief Combine a transform with a translation
   --/
   --/ @param transform Transform object
   --/ @param x         Offset to apply on X axis
   --/ @param y         Offset to apply on Y axis
   --/
   --//////////////////////////////////////////////////////////
   procedure sfTransform_translate
     (Transform : access sfTransform;
      x : float;
      y : float);
   pragma Import (C, sfTransform_translate, "sfTransform_translate");

   --//////////////////////////////////////////////////////////
   --/ @brief Combine the current transform with a rotation
   --/
   --/ @param transform Transform object
   --/ @param angle     Rotation angle, in degrees
   --/
   --//////////////////////////////////////////////////////////
   procedure sfTransform_rotate (transform : access sfTransform;
                                 angle     : float);
   pragma Import (C, sfTransform_rotate, "sfTransform_rotate");

   --//////////////////////////////////////////////////////////
   --/ @brief Combine the current transform with a rotation
   --/
   --/ The center of rotation is provided for convenience as a second
   --/ argument, so that you can build rotations around arbitrary points
   --/ more easily (and efficiently) than the usual
   --/ [translate(-center), rotate(angle), translate(center)].
   --/
   --/ @param transform Transform object
   --/ @param angle     Rotation angle, in degrees
   --/ @param centerX   X coordinate of the center of rotation
   --/ @param centerY   Y coordinate of the center of rotation
   --/
   --//////////////////////////////////////////////////////////
   procedure sfTransform_rotateWithCenter
     (transform : access sfTransform;
      angle     : float;
      centerX   : float;
      centerY   : float);
   pragma Import (C, sfTransform_rotateWithCenter, "sfTransform_rotateWithCenter");

   --//////////////////////////////////////////////////////////
   --/ @brief Combine the current transform with a scaling
   --/
   --/ @param transform Transform object
   --/ @param scaleX    Scaling factor on the X axis
   --/ @param scaleY    Scaling factor on the Y axis
   --/
   --//////////////////////////////////////////////////////////
   procedure sfTransform_scale
     (transform : access sfTransform;
      scaleX    : float;
      scaleY    : float);
   pragma Import (C, sfTransform_scale, "sfTransform_scale");

   --//////////////////////////////////////////////////////////
   --/ @brief Combine the current transform with a scaling
   --/
   --/ The center of scaling is provided for convenience as a second
   --/ argument, so that you can build scaling around arbitrary points
   --/ more easily (and efficiently) than the usual
   --/ [translate(-center), scale(factors), translate(center)]
   --/
   --/ @param transform Transform object
   --/ @param scaleX    Scaling factor on X axis
   --/ @param scaleY    Scaling factor on Y axis
   --/ @param centerX   X coordinate of the center of scaling
   --/ @param centerY   Y coordinate of the center of scaling
   --/
   --//////////////////////////////////////////////////////////
   procedure sfTransform_scaleWithCenter
     (transform : access sfTransform;
      scaleX    : float;
      scaleY    : float;
      centerX   : float;
      centerY   : float);
   pragma Import (C, sfTransform_scaleWithCenter, "sfTransform_scaleWithCenter");

end Sf.Graphics.Transform;
